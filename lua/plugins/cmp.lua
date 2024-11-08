local M = {}

M.setup = function()
  local cmp = require('cmp')
  local api = vim.api
  local fn = vim.fn

  -- Custom source for nearby files
  -- local nearby_files_source = {
  --   is_available = function()
  --     return true
  --   end,
  --   get_trigger_characters = function()
  --     return {}
  --   end,
  --   get_keyword_pattern = function()
  --     return [[\k\+]]
  --   end,
  --   complete = function(self, params, callback)
  --     local bufnr = api.nvim_get_current_buf()
  --     local filepath = api.nvim_buf_get_name(bufnr)
  --     local dir = fn.fnamemodify(filepath, ':h')
  --     
  --     local items = {}
  --     local files = fn.glob(dir .. '/*', 0, 1)
  --     
  --     for _, file in ipairs(files) do
  --       if fn.filereadable(file) == 1 then
  --         local lines = fn.readfile(file)
  --         for _, line in ipairs(lines) do
  --           for word in line:gmatch("%S+") do
  --             table.insert(items, {
  --               label = word,
  --               kind = cmp.lsp.CompletionItemKind.Text,
  --             })
  --           end
  --         end
  --       end
  --     end
  --     
  --     callback({
  --       items = items,
  --       isIncomplete = false
  --     })
  --   end
  -- }

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },    -- LSP source
      { name = 'luasnip' },     -- Snippets
      { name = 'buffer' },      -- Buffer words
      { name = 'path' },        -- File paths
      -- { name = 'nearby_files', option = {} }  -- Our new custom source
    }),
    completion = {
      completeopt = 'menu,menuone,noinsert'
    }
  })

  -- Special configuration for SystemVerilog files
  cmp.setup.filetype('systemverilog', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },    -- LSP source
      { name = 'luasnip' },     -- Snippets
      { name = 'omni' },        -- Omni completion
      { name = 'buffer' },      -- Buffer words
      { name = 'path' },        -- File paths
      -- { name = 'nearby_files', option = {} }  -- Our new custom source
    })
  })

  -- Register the custom source
  -- cmp.register_source('nearby_files', nearby_files_source)
end

return M
