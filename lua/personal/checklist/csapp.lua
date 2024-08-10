local M = {}

-- Configuration options
local config = {
    debug = false,  -- Set to true to enable debug output, false to disable
}

-- Helper function for debug printing
local function debug_print(message)
    if config.debug then
        print(message)
    end
end

-- Helper function for safe table access
local function safe_access(tbl, key)
    if tbl == nil then
        debug_print("Error: Trying to access a nil table")
        return nil
    end
    return tbl[key]
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

function M.open_progress()
    local markdown_path = vim.fn.expand('~/.config/nvim/checklists/cmu_progress.md')
    debug_print("Markdown path: " .. markdown_path)
    
    local page_mapping = parse_markdown_and_generate_mapping(markdown_path)
    
    -- Debug: Print the page_mapping
    if config.debug then
        debug_print("Page Mapping:")
        for chapter, data in pairs(page_mapping) do
            debug_print(string.format("Chapter %d: Start Page %d", chapter, data.start_page))
            for subchapter, page in pairs(data.subchapters) do
                debug_print(string.format("  Subchapter %d.%d: Page %d", chapter, subchapter, page))
            end
        end
    end

    -- Open the markdown checklist
    vim.cmd('edit ' .. markdown_path)

    -- Find the last checked item
    local last_checked_line = 0
    for line in io.lines(markdown_path) do
        if line:match('%[x%]') then
            last_checked_line = last_checked_line + 1
        end
    end

    -- Debug: Print last_checked_line
    debug_print("Last checked line: " .. last_checked_line)

    -- Determine the starting page for the PDF viewer
    local pdf_page = safe_access(safe_access(page_mapping, 1), 'start_page') or 1

    if last_checked_line > 0 then
        local current_chapter = 1
        local current_subchapter = 0
        
        for chapter, data in pairs(page_mapping) do
            if last_checked_line > #data.subchapters then
                last_checked_line = last_checked_line - #data.subchapters
                current_chapter = current_chapter + 1
            else
                current_subchapter = last_checked_line
                break
            end
        end
        
        -- Debug: Print current_chapter and current_subchapter
        debug_print(string.format("Current Chapter: %d, Current Subchapter: %d", current_chapter, current_subchapter))

        if page_mapping[current_chapter] then
            if current_subchapter > 0 and page_mapping[current_chapter].subchapters[current_subchapter] then
                pdf_page = page_mapping[current_chapter].subchapters[current_subchapter]
            else
                pdf_page = page_mapping[current_chapter].start_page
            end
        end
    end

    -- Debug: Print final pdf_page
    debug_print("Opening PDF at page: " .. pdf_page)

    -- Open the PDF with zathura at the calculated page
    local pdf_path = '~/.config/nvim/books/CSAPP_2016.pdf'
    vim.fn.system('zathura --page=' .. pdf_page .. ' ' .. pdf_path .. ' &')
end

-- Function to toggle debugging
function M.toggle_debug()
    config.debug = not config.debug
    print("Debugging " .. (config.debug and "enabled" or "disabled"))
end

return M
