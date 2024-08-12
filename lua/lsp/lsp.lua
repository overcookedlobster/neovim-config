local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify('lspconfig not found. Skipping LSP setup.', vim.log.levels.WARN)
  return
end

local function on_attach(client)
  vim.diagnostic.disable(0)
  local status_ok, illuminate = pcall(require, 'illuminate')
  if status_ok then
    illuminate.on_attach(client)
  end
end

local function setup_lsp_if_available(server, setup_func)
  if lspconfig[server].document_config.default_config.cmd then
    local cmd = lspconfig[server].document_config.default_config.cmd[1]
    if vim.fn.executable(cmd) == 1 then
      setup_func()
    else
      vim.notify(server .. ' LSP server not found. Skipping setup.', vim.log.levels.WARN)
    end
  end
end

setup_lsp_if_available('phpactor', function()
  lspconfig.phpactor.setup {
  cmd = {"phpactor", "language-server"},
  filetypes = {"php"},
  root_dir = require("lspconfig/util").root_pattern("composer.json", ".git"),
  on_attach = function()
    vim.diagnostic.disable(0)
    require('illuminate').on_attach(client)
  end
}
end)


setup_lsp_if_available('jedi_language_server', function()
  lspconfig.jedi_language_server.setup {
  on_attach = function(client)
    vim.diagnostic.disable(0)
    require('illuminate').on_attach(client)
  end,
}
end)

setup_lsp_if_available('clangd', function()
  lspconfig.clangd.setup {
  on_attach = function(client)
    require('illuminate').on_attach(client)
  end,
}
end)

setup_lsp_if_available('jdtls', function()
  lspconfig.jdtls.setup {
  on_attach = function(client)
    require('illuminate').on_attach(client)
  end,
}
end)
