local null_ls = require("null-ls")
local verilator = null_ls.builtins.diagnostics.verilator.with({
  extra_args = { "--lint-only", "-Wall", "-I" .. os.getenv("UVM_HOME") .. "/src"},
  method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
})
null_ls.setup({
  sources = { verilator },
  on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup("NullLsDiagnostics", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold", "BufWritePost" }, {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.diagnostic.show()
      end,
    })
  end,
})

