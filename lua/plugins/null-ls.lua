local null_ls = require("null-ls")
local verilator = null_ls.builtins.diagnostics.verilator.with({
  extra_args = { "--lint-only", "-Wall", "-I" .. os.getenv("UVM_HOME") .. "/src"},
  method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
})

local update_in_progress = false

null_ls.setup({
  sources = { verilator },
  on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup("NullLsDiagnostics", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold", "BufWritePost" }, {
      group = augroup,
      buffer = bufnr,
      callback = function()
        if not update_in_progress then
          update_in_progress = true
          vim.defer_fn(function()
            vim.diagnostic.show()
            update_in_progress = false
          end, 100)  -- 100ms delay
        end
      end,
    })
  end,
})
