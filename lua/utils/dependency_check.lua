local M = {}

M.check_command = function(command)
  local handle = io.popen('command -v ' .. command .. ' 2>/dev/null')
  local result = handle:read('*a')
  handle:close()
  return result ~= ''
end

M.check_dependency = function(name, check_func)
  if not check_func() then
    vim.notify('Dependency ' .. name .. ' not found. Some features may not work.', vim.log.levels.WARN)
    return false
  end
  return true
end

return M
