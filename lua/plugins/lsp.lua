-- File: ~/.config/nvim/lua/plugins/lsp.lua
local M = {}

M.setup = function()
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- Debug function to check LSP status
  local function on_attach(client, bufnr)
    print("LSP attached:", client.name)
    
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    -- Mappings
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  end

  -- SystemVerilog LSP setup
  lspconfig.svls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    root_dir = function()
      return vim.fn.getcwd()
    end,
    settings = {
      systemverilog = {
        includeIndexing = {"**/*.{sv,svh}"},
        excludeIndexing = {"**/test/**"},
        defineModules = {
          uvm = {
            directories = { os.getenv("UVM_HOME/src") }
          }
        }
      }
    }
  }

  -- Add filetype detection
  vim.cmd([[
    autocmd BufNewFile,BufRead *.sv,*.svh set filetype=systemverilog
  ]])
end

return M
