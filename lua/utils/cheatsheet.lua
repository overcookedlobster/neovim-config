local M = {}

-- Open cheatsheet for current filetype
M.open_cheatsheet = function()
  local filetype = vim.bo.filetype
  local config_path = vim.fn.stdpath('config')
  local cheatsheet_path = string.format("%s/cheatsheets/%s_cheatsheet.md", config_path, filetype)
  
  if vim.fn.filereadable(cheatsheet_path) == 1 then
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
    
    local content = vim.fn.readfile(cheatsheet_path)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    
    vim.cmd('vsplit')
    vim.api.nvim_win_set_buf(0, buf)
    
    vim.wo.wrap = false
    vim.wo.conceallevel = 2
    vim.wo.concealcursor = 'nc'
    
    vim.cmd('MarkdownPreview')
    
    vim.api.nvim_create_autocmd("WinLeave", {
      buffer = buf,
      command = "bdelete!",
      once = true,
    })
  else
    vim.notify(string.format("No cheatsheet found for filetype: %s", filetype), vim.log.levels.WARN)
  end
end

-- Open Git tutorial
M.git_tutorial = function()
  local config_path = vim.fn.stdpath('config')
  local cheatsheet_path = string.format("%s/cheatsheets/git_cheatsheet.md", config_path)
  
  if vim.fn.filereadable(cheatsheet_path) == 1 then
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
    
    local content = vim.fn.readfile(cheatsheet_path)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    
    vim.cmd('vsplit')
    vim.api.nvim_win_set_buf(0, buf)
    
    vim.wo.wrap = false
    vim.wo.conceallevel = 2
    vim.wo.concealcursor = 'nc'
    
    vim.cmd('MarkdownPreview')
    
    vim.api.nvim_create_autocmd("WinLeave", {
      buffer = buf,
      command = "bdelete!",
      once = true,
    })
  else
    vim.notify("Git Cheatsheet Not Found", vim.log.levels.WARN)
  end
end

function M.setup()
  vim.keymap.set('n', '<leader>qq', M.open_cheatsheet, {noremap = true, silent = true, desc = "Open filetype cheatsheet"})
  vim.keymap.set('n', '<leader>qg', M.git_tutorial, {noremap = true, silent = true, desc = "Open Git tutorial"})
end

return M
