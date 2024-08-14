local cmp = require('cmp')
local lfs = require('lfs')
local path = require('plenary.path')

local source = {}

source.new = function()
  return setmetatable({}, { __index = source })
end

-- Supported file types for different LaTeX commands
source.file_types = {
  tex = { "tex", "sty", "cls" },
  bib = { "bib" },
  img = { "png", "jpg", "pdf", "eps" }
}

-- Function to check if a file has a supported extension
local function is_supported_file(file, types)
  local ext = file:match("^.+%.(.+)$")
  return ext and vim.tbl_contains(types, ext:lower())
end

-- Function to find LaTeX project root
local function find_latex_root()
  local current_file = vim.fn.expand('%:p')
  local current_dir = vim.fn.fnamemodify(current_file, ':h')
  local root_markers = { 'main.tex', '.latexmkrc', '.git' }

  local check_dir = current_dir
  while check_dir ~= '/' do
    for _, marker in ipairs(root_markers) do
      if path:new(check_dir, marker):exists() then
        return check_dir
      end
    end
    check_dir = vim.fn.fnamemodify(check_dir, ':h')
  end
  return current_dir
end

-- Function to get all relevant files
local function get_files(types)
  local files = {}
  local root_dir = find_latex_root()
  local seen = {}

  local function scan_dir(dir)
    for file in lfs.dir(dir) do
      if file ~= "." and file ~= ".." then
        local full_path = path:new(dir, file):absolute()
        if not seen[full_path] then
          seen[full_path] = true
          local attr = lfs.attributes(full_path)
          if attr.mode == "directory" then
            scan_dir(full_path)
          elseif attr.mode == "file" and is_supported_file(file, types) then
            table.insert(files, path:new(full_path):make_relative(root_dir))
          end
        end
      end
    end
  end

  scan_dir(root_dir)
  return files
end

function source:complete(params, callback)
  local input = params.context.cursor_before_line:match("\\%w+%{(.*)$")
  if not input then return callback({ items = {}, isIncomplete = false }) end

  local command = params.context.cursor_before_line:match("\\(%w+)")
  local types = self.file_types.tex  -- default to tex files

  if command == "includegraphics" then
    types = self.file_types.img
  elseif command == "bibliography" then
    types = self.file_types.bib
  elseif command == "input" or command == "include" then
    types = self.file_types.tex
  end

  local items = {}
  for _, file in ipairs(get_files(types)) do
    table.insert(items, {
      label = tostring(file),
      kind = cmp.lsp.CompletionItemKind.File,
    })
  end

  callback({ items = items, isIncomplete = false })
end

function source:get_trigger_characters()
  return { '{' }
end

function source:is_available()
  return vim.bo.filetype == "tex"
end

return source
