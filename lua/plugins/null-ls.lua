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
