local cmp = require('cmp')
local uv = vim.loop or vim.uv  -- Use vim.loop for Neovim < 0.10.0, vim.uv for >= 0.10.0
local path = require('plenary.path')
local latex_files_source = require('latex_files_sources')
local M = {}

M.supported_filetypes = {
  tex = {"tex", "sty", "cls"},
  bib = {"bib"},
  img = {"png", "pdf", "jpg", "jpeg", "eps", "ps", "gif", "bmp", "tiff"}
}

local function is_supported_file(file, types)
  local ext = file:match("^.+%.(.+)$")
  return ext and vim.tbl_contains(types, ext:lower())
end

local function get_files(dirs, types)
  local files = {}
  local seen = {}
  local function recursive_search(dir)
    local handle = uv.fs_scandir(dir)
    if not handle then return end
    
    local function iter()
      return uv.fs_scandir_next(handle)
    end
    
    for name, type in iter do
      if name ~= "." and name ~= ".." then
        local full_path = path:new(dir, name):absolute()
        if not seen[full_path] then
          seen[full_path] = true
          if type == "directory" then
            recursive_search(full_path)
          elseif type == "file" and is_supported_file(name, types) then
            table.insert(files, path:new(full_path):make_relative(vim.fn.getcwd()))
          end
        end
      end
    end
  end
  
  for _, dir in ipairs(dirs) do
    recursive_search(dir)
  end
  return files
end

local function find_latex_root()
  if vim.g.latex_root then
    return vim.g.latex_root
  end
  local current_file = vim.fn.expand('%:p')
  local current_dir = vim.fn.fnamemodify(current_file, ':h')
  local root_markers = {'.latexroot', 'main.tex', '.git'}
  
  local function has_root_marker(dir)
    for _, marker in ipairs(root_markers) do
      if path:new(dir, marker):exists() then
        return true
      end
    end
    return false
  end
  
  local check_dir = current_dir
  while check_dir ~= '/' do
    if has_root_marker(check_dir) then
      return check_dir
    end
    check_dir = vim.fn.fnamemodify(check_dir, ':h')
  end
  return vim.fn.getcwd()
end

local latex_source = {}

latex_source.new = function()
  return setmetatable({}, { __index = latex_source })
end

latex_source.get_trigger_characters = function()
  return { '{', '/' }
end

latex_source.complete = function(self, params, callback)
  local context = params.context
  local cursor_before_line = context.cursor_before_line
  local command, current_input = cursor_before_line:match("\\(%w+)%{(.*)%}?$")
  if not command then return callback({ items = {}, isIncomplete = false }) end

  local current_dir = vim.fn.expand("%:p:h")
  local root_dir = find_latex_root()
  local search_dirs = {root_dir, current_dir}
  if current_input and current_input ~= "" then
    table.insert(search_dirs, 1, path:new(current_dir, current_input):parent():absolute())
  end

  local types = M.supported_filetypes.tex
  if command == "includegraphics" then
    types = M.supported_filetypes.img
  elseif command == "bibliography" then
    types = M.supported_filetypes.bib
  end

  local items = {}
  for _, file in ipairs(get_files(search_dirs, types)) do
    table.insert(items, {
      label = file,
      kind = cmp.lsp.CompletionItemKind.File,
    })
  end
  callback({ items = items, isIncomplete = false })
end

M.setup = function()
  cmp.setup({
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'latex_files' },
      { name = 'omni' },
      { name = 'vimtex' },
    }),
    mapping = cmp.mapping.preset.insert({
      -- Your existing mappings...
    }),
    completion = {
      autocomplete = false, -- Disable automatic popup globally
    },
    experimental = {
      ghost_text = false,
    },
  })

  cmp.setup.filetype('tex', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'latex_symbols' },
      { name = 'latex_files' },
      { name = 'vimtex' },
      { name = 'omni' },
    }),
    completion = {
      autocomplete = true, -- Enable automatic popup for tex files
    },
  })

  cmp.register_source('latex_files', latex_files_source.new())
end

-- Set up vimtex's omnifunc
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.bo.omnifunc = 'vimtex#complete#omnifunc'
  end,
})

-- Defer the setup of nvim-cmp to ensure it's loaded
vim.defer_fn(function()
  local cmp = require('cmp')
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
     if cmp.visible() then
       cmp.select_next_item()
     elseif luasnip.expand_or_jumpable() then
       luasnip.expand_or_jump()
     else
       fallback()
     end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
     if cmp.visible() then
       cmp.select_prev_item()
     elseif luasnip.jumpable(-1) then
       luasnip.jump(-1)
     else
       fallback()
     end
    end, { "i", "s" }),
  }),
    sources = {
        { name = 'omni' },
        { name = 'nvim_lsp' },
        { name = 'vimtex' },
        -- { name = 'buffer' },
      -- Add other sources you're using
    },
    completion = {
      autocomplete = false, -- Disable automatic popup globally
    },
      -- Disable autoindent
  experimental = {
    ghost_text = false,
  },
  })

  --BELOW IS CAUSING MANY ERRORS
  -- Enable vimtex completion source for LaTeX files
  -- vim.api.nvim_create_autocmd("FileType", {
  --   pattern = "tex",
  --   callback = function()
  --     cmp.setup.buffer({ 
  --       sources = {{ name = 'omni' }},
  --       completion = {
  --         autocomplete = true, -- Enable automatic popup for tex files
  --       },
  --     })
  --   end,
  -- })

  -- Set up a keymap to manually trigger completion
  vim.keymap.set('i', '<C-Space>', function()
    if cmp.visible() then
      cmp.close()
    else
      cmp.complete()
    end
  end, { silent = true })
end, 100)  -- 100ms delay to ensure plugins are loaded





