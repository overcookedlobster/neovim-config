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
M.setup = function()
    require('utils.cheatsheet').setup()
    -- dependency_check
    local dependency_check = require('utils.dependency_check')

    -- Check for required dependencies
    local has_git = dependency_check.check_dependency('git', function() return dependency_check.check_command('git') end)
    local has_node = dependency_check.check_dependency('nodejs', function() return dependency_check.check_command('node') end)
    local has_python = dependency_check.check_dependency('python3', function() return dependency_check.check_command('python3') end)
    local has_ripgrep = dependency_check.check_dependency('ripgrep', function() return dependency_check.check_command('rg') end)
    local has_fd = dependency_check.check_dependency('fd-find', function() return dependency_check.check_command('fd') end)
    local has_xclip = dependency_check.check_dependency('xclip', function() return dependency_check.check_command('xclip') end)
    local has_zathura = dependency_check.check_dependency('zathura', function() return dependency_check.check_command('zathura') end)

    -- Now use these flags to conditionally load parts of your configuration

    if has_git then
      -- Load git-related plugins and configurations
    end

    if has_node then
      -- Load Node.js-dependent configurations
    end

    if has_python then
      -- Load Python-dependent configurations
    end

-- ... and so on for other dependencies
end
return M
