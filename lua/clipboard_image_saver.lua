-- Clipboard Image Saver for Neovim
local M = {}

local Path = require('plenary.path')

M.config = {
  name_format = "clipboard_image_{timestamp}",
}

local function get_current_directory()
  local current_file = vim.fn.expand('%:p')
  return current_file ~= '' and vim.fn.fnamemodify(current_file, ':h') or vim.fn.getcwd()
end

local function generate_filename(custom_name)
  if custom_name then
    return custom_name:match("%.png$") and custom_name or custom_name .. '.png'
  end

  local timestamp = os.date("%Y%m%d_%H%M%S")
  local filename = M.config.name_format:gsub("{timestamp}", timestamp)
                                       :gsub("{count}", "1")
                                       :gsub("{date}", os.date("%Y-%m-%d"))
                                       :gsub("{time}", os.date("%H-%M-%S"))
  
  return filename .. ".png"
end

local function insert_path(path)
  vim.schedule(function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    table.insert(lines, 1, path)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    print("Image path inserted at the beginning of the buffer.")
  end)
end

local function verify_image(path)
  local command = string.format("file --mime-type -b '%s'", path)
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()
  return result:match("image/png")
end

function M.save_clipboard_image(args)
  local save_path = args.fargs[1] or get_current_directory()
  local custom_name = args.fargs[2]

  local filename = generate_filename(custom_name)
  local full_path = Path:new(save_path, filename):absolute()

  Path:new(save_path):mkdir({ parents = true, exists_ok = true })

  -- Use a temporary file
  local temp_file = os.tmpname()

  -- Save clipboard content to temp file
  os.execute(string.format("xclip -selection clipboard -t image/png -o > '%s'", temp_file))

  -- Check if the temp file is a valid PNG
  if verify_image(temp_file) then
    -- Move the temp file to the destination
    os.execute(string.format("mv '%s' '%s'", temp_file, full_path))
    print("Image saved successfully: " .. full_path)
    insert_path(full_path)
  else
    print("Failed to save image or clipboard doesn't contain a valid PNG image.")
    os.remove(temp_file)
  end
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

vim.api.nvim_create_user_command("SaveClipboardImage", M.save_clipboard_image, {
  nargs = '*',
  complete = 'dir',
  desc = 'Save clipboard image. Usage: SaveClipboardImage [path] [filename]'
})

return M
