local lspconfig = require('lspconfig')

-- SystemVerilog LSP setup
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

-- C LSP setup
lspconfig.clangd.setup{
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
  },
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}
-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Change diagnostic signs
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "ℹ" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Customize diagnostic colors
vim.cmd [[
  highlight DiagnosticError guifg=#ffcc00 gui=bold
  highlight DiagnosticWarn guifg=#ffcc00 gui=bold
  highlight DiagnosticInfo guifg=#00ffcc gui=bold
  highlight DiagnosticHint guifg=#00ccff gui=bold
]]
