local M = {}

M.is_sv_file = function()
  local ft = vim.bo.filetype
  return ft == 'systemverilog' or ft == 'verilog'
end

M.verilator_diagnostics = function()
  if not M.is_sv_file() then return end
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

M.refresh_diagnostics = function()
  if not M.is_sv_file() then return end
  local bufnr = vim.api.nvim_get_current_buf()
  
  local current_diagnostics = vim.diagnostic.get(bufnr)
  
  if #current_diagnostics == 0 then
    M.verilator_diagnostics()
  end
  
  current_diagnostics = vim.diagnostic.get(bufnr)
  
  vim.diagnostic.show(nil, bufnr)
  
  for _, diagnostic in ipairs(current_diagnostics) do
    print(string.format("Line %d: %s", diagnostic.lnum + 1, diagnostic.message))
  end
end

return M
