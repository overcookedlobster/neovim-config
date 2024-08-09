-- Set leader key
vim.keymap.set('', '<Space>', '<NOP>')
vim.g.mapleader = " "

-- Basic configuration settings
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.hlsearch = false
vim.opt.incsearch = false
vim.opt.showmode = false
vim.opt.foldenable = false
vim.opt.foldmethod = "marker"
vim.opt.autowriteall = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

-- Plugin management with packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'InES-HPMM/zhaw-snippets'
  use 'tpope/vim-sensible'
  use 'junegunn/seoul256.vim'
  use {'xuhdev/vim-latex-live-preview', ft = 'tex'}
  use {'L3MON4D3/LuaSnip', tag = 'v2.*', run = 'make install_jsregexp'}
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.4'}
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'crispgm/telescope-heading.nvim'
  use 'jakemason/ouroboros'
  use 'morhetz/gruvbox'
  use 'luk400/vim-jukit'
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'ibhagwan/fzf-lua', branch = 'main'}
  use 'nvim-tree/nvim-web-devicons'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- LSP config
require('lsp/lsp')

-- Color scheme
vim.g.gruvbox_contrast_light = 'soft'
vim.g.gruvbox_termcolors = 256
local status_ok, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status_ok then
  vim.cmd('colorscheme default')
end

-- LuaSnip configuration
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  print("Failed to load LuaSnip")
  return
end

-- Ensure the snippets table exists
luasnip.snippets = luasnip.snippets or {}

luasnip.setup({
  store_selection_keys = "<Tab>",
  enable_autosnippets = true,
})
luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = {{"●", "GruvboxOrange"}}
      }
    }
  }
})
-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- Extend tex snippets (example)
luasnip.filetype_extend("tex", {"latex"})
-- Load snippets from Lua files
local loader_status, loader = pcall(require, "luasnip.loaders.from_lua")
if loader_status then
  loader.load({paths = "/home/flyinglobster/.config/nvim/LuaSnip"})
else
  print("Failed to load LuaSnip loader:", loader)
end

-- Manually add snippets to luasnip.snippets if _snippets exists
if luasnip._snippets then
  for filetype, snippets in pairs(luasnip._snippets) do
    luasnip.snippets[filetype] = luasnip.snippets[filetype] or {}
    for _, snippet in ipairs(snippets) do
      table.insert(luasnip.snippets[filetype], snippet)
    end
  end
end

vim.api.nvim_create_user_command("LuaSnipDebug", function()
  print("Debugging LuaSnip configuration:")
  local ls = require("luasnip")
  print("LuaSnip object type:", type(ls))
  print("Snippets table type:", type(ls.snippets))
  print("Snippet loading path:", vim.fn.expand("/home/flyinglobster/.config/nvim/LuaSnip"))
  
  local function print_snippets(snippets_table, table_name)
    if type(snippets_table) == "table" then
      local count = 0
      for ft, snips in pairs(snippets_table) do
        count = count + 1
        print(string.format("  Filetype in %s: %s", table_name, ft))
        print("  Number of snippets:", #snips)
        for i, snip in ipairs(snips) do
          print(string.format("    %d. Trigger: %s", i, snip.trigger))
        end
      end
      print(string.format("Total filetypes with snippets in %s: %d", table_name, count))
      
      if count == 0 then
        print(string.format("No snippets found in %s table.", table_name))
      end
    else
      print(string.format("%s is not a table", table_name))
    end
  end

  print("--- ls.snippets ---")
  print_snippets(ls.snippets, "ls.snippets")
  
  print("\n--- ls.get_snippets() ---")
  local get_snippets = ls.get_snippets()
  if get_snippets then
    print_snippets(get_snippets, "ls.get_snippets()")
  else
    print("ls.get_snippets() returned nil")
  end
  
  -- Try to print LuaSnip version
  pcall(function()
    print("LuaSnip version:", ls.version)
  end)

  -- Print information about the current buffer
  print("\nCurrent buffer information:")
  print("Filetype:", vim.bo.filetype)
  print("File path:", vim.fn.expand("%:p"))
end, {})

vim.api.nvim_create_autocmd("User", {
  pattern = "LuasnipSnippetsAdded",
  callback = function()
    print("Snippets loaded for: " .. vim.bo.filetype)
  end,
})

-- Telescope configuration
local telescope_status_ok, telescope = pcall(require, 'telescope')
if telescope_status_ok then
  local builtin_status_ok, builtin = pcall(require, 'telescope.builtin')
  if builtin_status_ok then
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set('n', '<leader>fm', builtin.marks, {})
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
    vim.keymap.set('n', '<leader>fp', '<cmd>Telescope file_browser<CR>', {})
  else
    print("Telescope builtin not found. Keybindings not set.")
  end

  telescope.setup{
    defaults = {
      file_ignore_patterns = {"node_modules"},
      layout_strategy = 'vertical',
      layout_config = { height = 0.95, width = 0.95 },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
    extensions = {
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
      },
    },
  }

  pcall(telescope.load_extension, 'file_browser')
  pcall(telescope.load_extension, 'heading')
else
  print("Telescope not found")
end

-- Treesitter configuration
local treesitter_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if treesitter_status_ok then
  treesitter.setup {
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
  }
else
  print("Treesitter not found")
end

-- Cheatsheet function
_G.open_cheatsheet = function()
  local filetype = vim.bo.filetype
  local cheatsheet_path = string.format("~/.config/nvim/cheatsheets/%s_cheatsheet.md", filetype)
  
  if vim.fn.filereadable(vim.fn.expand(cheatsheet_path)) == 1 then
    vim.cmd(string.format("vsplit %s", cheatsheet_path))
  else
    print(string.format("No cheatsheet found for filetype: %s", filetype))
  end
end

-- Set up a keymap to open the cheatsheet
vim.api.nvim_set_keymap("n", "<leader>qq", ":lua open_cheatsheet()<CR>", {noremap = true, silent = true})

-- Use `d` (delimiter) for targets.vim block text objects
vim.cmd[[
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'd': {'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}]},
    \ })
]]

vim.keymap.set('', '<Leader>hc', '<Cmd>HighlightColorsToggle<CR>')

-- Enter/leave insert mode when entering/leaving a terminal
vim.cmd[[
  autocmd BufEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
]]

-- Set up LuaSnip keymaps
local function setup_keymaps()
  local opts = {noremap = true, silent = true}
  vim.keymap.set("i", "<C-k>", "<Plug>luasnip-expand-or-jump", opts)
  vim.keymap.set("s", "<C-k>", "<Plug>luasnip-expand-or-jump", opts)
  vim.keymap.set("i", "<C-j>", "<Plug>luasnip-jump-prev", opts)
  vim.keymap.set("s", "<C-j>", "<Plug>luasnip-jump-prev", opts)
end

setup_keymaps()

local function load_snippets()
  require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/sv/"})
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "systemverilog",
  callback = function()
    load_snippets()
    setup_keymaps()
  end
})

-- for sv linting
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.verilator.with({
      extra_args = { "--lint-only", "-Wall" },
    }),
  },
  on_attach = function(client, bufnr)
    -- Enable diagnostics in normal mode
    vim.api.nvim_create_autocmd("BufEnter", {
      buffer = bufnr,
      callback = function()
        vim.diagnostic.show()
      end,
    })
  end,
})

require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
}

-- Keybinding to open Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)

-- Change diagnostic signs
vim.fn.sign_define("DiagnosticSignError", {text = "✘", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "▲", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "ℹ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "⚑", texthl = "DiagnosticSignHint"})

-- Customize diagnostic colors
vim.cmd [[
  highlight DiagnosticError guifg=#ff8800 gui=bold
  highlight DiagnosticWarn guifg=#ffcc00 gui=bold
  highlight DiagnosticInfo guifg=#00ffcc gui=bold
  highlight DiagnosticHint guifg=#00ccff gui=bold
]]

local lspconfig = require('lspconfig')
lspconfig.svls.setup{
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
 vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
     vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI", "BufWritePost"}, {
      buffer = bufnr,
      callback = function()
        vim.diagnostic.show(nil, bufnr)
      end,
    })
  end,
  flags = {
    debounce_text_changes = 150,
  }
}

-- Function to check if the current buffer is a SystemVerilog file
local function is_sv_file()
  local ft = vim.bo.filetype
  return ft == 'systemverilog' or ft == 'verilog'
end

local function verilator_diagnostics()
  if not is_sv_file() then return end
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local cmd = string.format("verilator --lint-only -Wall %s 2>&1", filename)
  local output = vim.fn.system(cmd)
  local diagnostics = {}
  for line in output:gmatch("[^\r\n]+") do
    local lnum, col, type, msg = line:match("(%d+):(%d+):%s*(%w+):%s*(.*)")
    if lnum and col and type and msg then
      table.insert(diagnostics, {
        lnum = tonumber(lnum) - 1,
        col = tonumber(col) - 1,
        severity = type == "Error" and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
        message = msg,
        source = "Verilator"
      })
    end
  end
  local namespace = vim.api.nvim_create_namespace("verilator")
  vim.diagnostic.reset(namespace, bufnr)
  vim.diagnostic.set(namespace, bufnr, diagnostics)
end

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if not is_sv_file() then return end
    local bufnr = vim.api.nvim_get_current_buf()
    vim.diagnostic.reset(nil, bufnr)
    vim.diagnostic.show(nil, bufnr)
    if verilator_diagnostics then
      verilator_diagnostics()
    end
  end,
})

function RefreshDiagnostics()
  if not is_sv_file() then return end
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(nil, bufnr)
  vim.diagnostic.show(nil, bufnr)
  if verilator_diagnostics then
    verilator_diagnostics()
  end
end

vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua RefreshDiagnostics()<CR>', {noremap = true, silent = true})
vim.api.nvim_create_user_command('RefreshDiagnostics', RefreshDiagnostics, {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Set up autocommand to ensure diagnostics are shown on file open
vim.api.nvim_create_autocmd({"BufReadPost"}, {
  callback = function()
    if is_sv_file() then
      vim.diagnostic.show()
    end
  end,
})

-- Optional: Set up autocmd for BufEnter to refresh diagnostics
vim.api.nvim_create_autocmd({"BufEnter"}, {
  callback = function()
    if is_sv_file() then
      RefreshDiagnostics()
    end
  end,
})
