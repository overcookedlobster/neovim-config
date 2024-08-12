local M = {}

-- Configuration
M.config = {
  checklist_dir = vim.fn.stdpath('config') .. ('/checklists'),
  projects_dir = vim.fn.expand('~/projects'),
}

-- Helper function to sanitize folder names
local function sanitize_name(name)
  return name:gsub("%s+", "_"):gsub("[^%w_-]", "")
end

-- Function to create directories
local function create_directory(path)
  vim.fn.mkdir(path, "p")
end

-- Function to generate folder structure from a checklist
local function generate_folder_structure(checklist_path)
  local content = vim.fn.readfile(checklist_path)
  local project_name = vim.fn.fnamemodify(checklist_path, ':t:r')
  local base_path = M.config.projects_dir .. '/' .. project_name
  
  create_directory(base_path)
  
  local current_chapter = nil
  
  for _, line in ipairs(content) do
    if line:match("^%- %[.?%] %*%*Chapter %d+:") then
      -- Chapter line
      local chapter_name = line:match("%*%*(.-)%*%*")
      current_chapter = sanitize_name(chapter_name)
      local chapter_path = base_path .. "/" .. current_chapter
      create_directory(chapter_path)
      
      -- Create subfolders
      create_directory(chapter_path .. "/concepts")
      create_directory(chapter_path .. "/examples")
      create_directory(chapter_path .. "/exercises")
    elseif line:match("^%s+%- %[.?%] %d+%.%d+") and current_chapter then
      -- Section line
      local section_name = line:match("%d+%.%d+%s+(.-) %(")
      if section_name then
        local section_path = base_path .. "/" .. current_chapter .. "/concepts/" .. sanitize_name(section_name)
        create_directory(section_path)
      end
    end
  end
  
  print("Folder structure created successfully in '" .. base_path .. "'")
end

-- Function to check if a project has been generated
local function project_exists(project_name)
  local project_path = M.config.projects_dir .. '/' .. project_name
  return vim.fn.isdirectory(project_path) == 1
end

-- Function to list and select checklists
function M.list_checklists()
  local checklists = vim.fn.globpath(M.config.checklist_dir, '*.md', false, true)
  
  -- Create a list of checklist items with indicators
  local checklist_items = {}
  for _, path in ipairs(checklists) do
    local name = vim.fn.fnamemodify(path, ':t:r')
    local indicator = project_exists(name) and "🗹 " or "☐ "
    table.insert(checklist_items, {name = name, path = path, indicator = indicator})
  end
  
  vim.ui.select(checklist_items, {
    prompt = 'Select a checklist:',
    format_item = function(item)
      return item.indicator .. item.name
    end,
  }, function(choice)
    if choice then
      local project_name = choice.name
      local project_path = M.config.projects_dir .. '/' .. project_name
      
      if project_exists(project_name) then
        vim.ui.select({'Open existing project', 'Regenerate project structure'}, {
          prompt = 'Project already exists. What would you like to do?'
        }, function(action_choice)
          if action_choice == 'Open existing project' then
            vim.cmd('cd ' .. project_path)
            print("Opened existing project: " .. project_path)
          elseif action_choice == 'Regenerate project structure' then
            generate_folder_structure(choice.path)
          end
        end)
      else
        local confirm = vim.fn.input("Generate project structure for " .. project_name .. "? (y/n): ")
        if confirm:lower() == 'y' then
          generate_folder_structure(choice.path)
        end
      end
    end
  end)
end

-- Function to open a checklist
function M.open_checklist(checklist_path)
  vim.cmd('edit ' .. checklist_path)
end

-- Set up keybindings
function M.setup()
  vim.api.nvim_set_keymap('n', '<leader>mk', ':lua require("personal.checklist_directory_generator").list_checklists()<CR>', {noremap = true, silent = true})
end

return M
