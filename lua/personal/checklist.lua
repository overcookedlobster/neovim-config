
local M = {}

-- Configuration options
M.config = {
    debug = false,
    checklist_dir = vim.fn.expand('~/.config/nvim/checklists'),
    pdf_dir = vim.fn.expand('~/.config/nvim/books'),
    pdf_viewer = 'zathura',
}

-- Helper function for debug printing
local function debug_print(message)
    if M.config.debug then
        print(message)
    end
end

-- Function to save the current buffer to file
local function save_buffer_to_file()
    local bufnr = vim.api.nvim_get_current_buf()
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    vim.fn.writefile(lines, filepath)
    debug_print("Saved changes to " .. filepath)
end
-- Function to parse markdown and generate mapping
local function parse_markdown_and_generate_mapping(markdown_path)
    local mapping = {}
    local current_chapter = nil
    
    debug_print("Starting to parse markdown file: " .. markdown_path)
    
    for line in io.lines(markdown_path) do
        debug_print("Processing line: " .. line)
        
        local chapter, start_page = line:match('^%- %[[ x]%] %*%*Chapter (%d+):.+%*%* %(Page (%d+)%)')
        if chapter and start_page then
            debug_print("Found chapter: " .. chapter .. ", start page: " .. start_page)
            current_chapter = tonumber(chapter)
            if current_chapter == nil then
                debug_print("Error: Failed to convert chapter to number: " .. chapter)
            else
                mapping[current_chapter] = {
                    start_page = tonumber(start_page) - 6,  -- Adjusting for 6-page difference
                    subchapters = {}
                }
                debug_print("Created mapping for chapter " .. current_chapter)
            end
        else
            local subchapter, page = line:match('^%s+%- %[[ x]%] (%d+%.%d+.+) %(Page (%d+)%)')
            if subchapter and page and current_chapter then
                debug_print("Found subchapter: " .. subchapter .. ", page: " .. page)
                local subchapter_number = tonumber(subchapter:match('^%d+%.(%d+)'))
                if subchapter_number then
                    if mapping[current_chapter] == nil then
                        debug_print("Error: mapping[" .. current_chapter .. "] is nil")
                    else
                        mapping[current_chapter].subchapters[subchapter_number] = tonumber(page) - 6
                        debug_print("Added subchapter " .. subchapter_number .. " to chapter " .. current_chapter)
                    end
                else
                    debug_print("Error: Could not parse subchapter number from " .. subchapter)
                end
            end
        end
    end
    
    debug_print("Finished parsing markdown file")
    return mapping
end

-- Function to parse markdown and extract page offset
local function parse_markdown_and_get_offset(markdown_path)
    local page_offset = 0
    
    for line in io.lines(markdown_path) do
        local offset = line:match('^Page Offset: (.+)$')
        if offset then
            page_offset = tonumber(offset) or 0
            break
        end
    end
    
    debug_print("Extracted page offset: " .. page_offset)
    return page_offset
end
-- Function to create a floating window
local function create_float()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local win_id = vim.api.nvim_open_win(0, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = 'minimal',
        border = 'rounded',
    })
    return win_id
end

local function safe_edit(file_path)
  local ok, err = pcall(vim.cmd, "edit " .. file_path)
  if not ok then
    if err:match("E325") then
      -- Swap file exists, ask user what to do
      print("Swap file exists for " .. file_path)
      local choice = vim.fn.input("(E)dit anyway, (R)ecover, (Q)uit: ")
      if choice:lower() == "e" then
        vim.cmd("edit! " .. file_path)
      elseif choice:lower() == "r" then
        vim.cmd("recover " .. file_path)
      else
        print("Aborted opening the checklist.")
        return false
      end
    else
      -- Some other error occurred
      print("Error opening file: " .. err)
      return false
    end
  end
  return true
end
-- Function to display checklist in a floating window
local function display_checklist(markdown_path)
    local bufnr = vim.fn.bufnr(markdown_path)
    local win_id = create_float()

    if bufnr == -1 then
        -- If the buffer doesn't exist, create it
        vim.api.nvim_command('edit ' .. markdown_path)
        bufnr = vim.fn.bufnr(markdown_path)
    else
        -- If the buffer exists, set it as the current buffer for the new window
        vim.api.nvim_win_set_buf(win_id, bufnr)
    end

    -- Ensure the buffer is loaded
    if not vim.api.nvim_buf_is_loaded(bufnr) then
        vim.api.nvim_buf_set_option(bufnr, 'buftype', '')
        vim.api.nvim_command('buffer ' .. bufnr)
    end

    -- Set up keybindings for the floating window
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<CR>', ':lua require("personal.checklist").toggle_item()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':q<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>p', ':lua require("personal.checklist").open_pdf()<CR>', opts)

    -- Set filetype to markdown
    vim.api.nvim_buf_set_option(bufnr, 'filetype', 'markdown')

    return bufnr, win_id
end

-- Function to toggle checklist items
function M.toggle_item()
    local line = vim.api.nvim_get_current_line()
    local new_line
    if line:match('^%s*- %[ %]') then
        new_line = line:gsub('^(%s*- )%[ %]', '%1[x]')
    elseif line:match('^%s*- %[x%]') then
        new_line = line:gsub('^(%s*- )%[x%]', '%1[ ]')
    end
    if new_line then
        vim.api.nvim_set_current_line(new_line)
        save_buffer_to_file()
    end
end
-- Function to save the checklist
function M.save_checklist()
    save_buffer_to_file()
    vim.api.nvim_command('setlocal nomodified')
end

-- Function to close the checklist
function M.close_checklist()
    save_buffer_to_file()
    vim.api.nvim_command('q')
end

-- Function to open PDF at the correct page
function M.open_pdf()
    local markdown_path = vim.api.nvim_buf_get_name(0)
    local pdf_name = vim.fn.fnamemodify(markdown_path, ':t:r') .. '.pdf'
    local pdf_path = M.config.pdf_dir .. '/' .. pdf_name

    -- Check if the PDF file exists
    if vim.fn.filereadable(pdf_path) == 0 then
        print("Error: PDF file not found: " .. pdf_path)
        return
    end

    -- Get current line number
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- Parse the markdown file to get the page offset
    local page_offset = parse_markdown_and_get_offset(markdown_path)

    -- Find the nearest previous line with a page number
    local page_number = 1
    for i = current_line, 1, -1 do
        local line = vim.api.nvim_buf_get_lines(0, i-1, i, false)[1]
        local found_page = line:match("%(Page (%d+)%)")
        if found_page then
            page_number = tonumber(found_page)
            break
        end
    end

    -- Apply the page offset
    local adjusted_page = page_number + page_offset

    debug_print("Opening PDF: " .. pdf_path .. " at page " .. adjusted_page)
    vim.fn.system(M.config.pdf_viewer .. ' --page=' .. adjusted_page .. ' "' .. pdf_path .. '" &')
end


-- Function to list and select checklists
function M.list_checklists()
    local checklists = vim.fn.globpath(M.config.checklist_dir, '*.md', false, true)
    vim.ui.select(checklists, {
        prompt = 'Select a checklist:',
        format_item = function(item)
            return vim.fn.fnamemodify(item, ':t:r')
        end,
    }, function(choice)
        if choice then
            display_checklist(choice)
        end
    end)
end


-- Function to toggle debugging
function M.toggle_debug()
    M.config.debug = not M.config.debug
    print("Debugging " .. (M.config.debug and "enabled" or "disabled"))
end

return M
