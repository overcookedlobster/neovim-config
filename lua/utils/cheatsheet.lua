local M = {}

M.open_cheatsheet = function()
  local filetype = vim.bo.filetype
  local fn = vim.fn
  local config_path = fn.stdpath('config')
  local cheatsheet_path = string.format(config_path .. "/cheatsheets/%s_cheatsheet.md", filetype)
  
  if vim.fn.filereadable(vim.fn.expand(cheatsheet_path)) == 1 then
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
    
    local content = vim.fn.readfile(vim.fn.expand(cheatsheet_path))
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    
    vim.api.nvim_command('vsplit')
    vim.api.nvim_win_set_buf(0, buf)
    
    vim.api.nvim_win_set_option(0, 'wrap', false)
    vim.api.nvim_win_set_option(0, 'conceallevel', 2)
    vim.api.nvim_win_set_option(0, 'concealcursor', 'nc')
    
    vim.cmd('MarkdownPreview')
    
    vim.cmd([[
      augroup close_cheatsheet
        autocmd!
        autocmd WinLeave <buffer> bdelete!
      augroup END
    ]])
  else
    print(string.format("No cheatsheet found for filetype: %s", filetype))
  end
end

M.git_tutorial = function()
  local config_path = vim.fn.stdpath('config') 
  local cheatsheet_path = string.format(config_path .. "/cheatsheets/git_cheatsheet.md")
  
  if vim.fn.filereadable(vim.fn.expand(cheatsheet_path)) == 1 then
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')
    
    local content = vim.fn.readfile(vim.fn.expand(cheatsheet_path))
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    
    vim.api.nvim_command('vsplit')
    vim.api.nvim_win_set_buf(0, buf)
    
    vim.api.nvim_win_set_option(0, 'wrap', false)
    vim.api.nvim_win_set_option(0, 'conceallevel', 2)
    vim.api.nvim_win_set_option(0, 'concealcursor', 'nc')
    
    vim.cmd('MarkdownPreview')
    
    vim.cmd([[
      augroup close_cheatsheet
        autocmd!
        autocmd WinLeave <buffer> bdelete!
      augroup END
    ]])
  else
    print("Git Cheatsheet Not Found")
  end
end

function M.setup()
  vim.keymap.set('n', '<leader>qq', M.open_cheatsheet, {noremap = true, silent = true, desc = "Open filetype cheatsheet"})
  vim.keymap.set('n', '<leader>qg', M.git_tutorial, {noremap = true, silent = true, desc = "Open Git tutorial"})
end

return M
