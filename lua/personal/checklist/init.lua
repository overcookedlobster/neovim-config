-- File: ~/.config/nvim/lua/personal/checklist/init.lua

local M = {}

-- Table to store the last opened checklist
M.last_opened = nil

-- Function to get all checklist files
local function get_checklists()
  local checklists = {}
  local config_path = vim.fn.stdpath('config')
  local checklist_path = config_path .. '/lua/personal/checklist'
  local handle = vim.loop.fs_scandir(checklist_path)
  if not handle then
    print("Failed to scan directory: " .. checklist_path)
    return checklists
  end

  local index = 1
  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then break end
    if type == 'file' and name:match('%.lua$') and name ~= 'init.lua' then
      checklists[index] = name:gsub('%.lua$', '')
      index = index + 1
    end
  end
  return checklists
end

-- Function to display checklist selection
function M.display_checklists()
  local checklists = get_checklists()
  if #checklists == 0 then
    print("No checklists found.")
    return
  end
  
  vim.ui.select(checklists, {
    prompt = 'Select a checklist:',
    format_item = function(item)
      return item:gsub('_', ' '):gsub('^%l', string.upper)
    end,
  }, function(choice)
    if choice then
      M.open_checklist(choice)
    end
  end)
end

-- Function to open a specific checklist
function M.open_checklist(name)
  local ok, module = pcall(require, 'personal.checklist.' .. name)
  if ok and module and type(module.open_progress) == 'function' then
    -- Create a new window on the left
    vim.cmd('leftabove vnew')
    -- Set the window to close when it loses focus
    vim.cmd('setlocal bufhidden=wipe')
    -- Open the markdown file
    module.open_progress()
    -- Store the last opened checklist
    M.last_opened = name
    -- Set up autocmd to close the window when leaving
    vim.cmd([[
      augroup close_checklist
        autocmd!
        autocmd WinLeave <buffer> quit
      augroup END
    ]])
  else
    print("Checklist module not found or invalid: " .. name)
  end
end

-- Function to reopen the last opened checklist
function M.reopen_last_checklist()
  if M.last_opened then
    M.open_checklist(M.last_opened)
  else
    print("No checklist was previously opened")
  end
end

-- Setup function
function M.setup()
  -- Keybinding to display checklist selection
  vim.api.nvim_set_keymap('n', '<leader>pp', ':lua require("personal.checklist").display_checklists()<CR>', { noremap = true, silent = true })
  
  -- Keybinding to reopen last checklist
  vim.api.nvim_set_keymap('n', '<leader>po', ':lua require("personal.checklist").reopen_last_checklist()<CR>', { noremap = true, silent = true })
end

return M
