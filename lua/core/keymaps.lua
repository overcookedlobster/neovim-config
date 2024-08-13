local keymap = vim.keymap.set

-- Set leader key
vim.g.mapleader = " "

-- Telescope keymaps
keymap('n', '<leader>ff', require('telescope.builtin').find_files, {})
keymap('n', '<leader>fg', require('telescope.builtin').live_grep, {})
keymap('n', '<leader>fb', require('telescope.builtin').buffers, {})
keymap('n', '<leader>fh', require('telescope.builtin').help_tags, {})
keymap('n', '<leader>fr', require('telescope.builtin').oldfiles, {})
keymap('n', '<leader>fc', require('telescope.builtin').current_buffer_fuzzy_find, {})
keymap('n', '<leader>fm', require('telescope.builtin').marks, {})
keymap('n', '<leader>fk', require('telescope.builtin').keymaps, {})
keymap('n', '<leader>fs', require('telescope.builtin').git_status, {})
keymap('n', '<leader>fp', '<cmd>Telescope file_browser<CR>', {})

-- Other keymaps
keymap('n', '<leader>xx', '<cmd>Trouble<cr>', {silent = true, noremap = true})
keymap('n', '<leader>hc', '<Cmd>HighlightColorsToggle<CR>', {})
keymap('n', '<leader>mc', ':! make clean all<CR>', { noremap = true, silent = false })
keymap('n', '<leader>cf', ':! concat_files<CR>', { noremap = true, silent = false })
keymap('n', '<leader>cl', ':lua require("personal.checklist").list_checklists()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>rc', ':ReloadConfig<CR>', {noremap = true, silent = true})

-- IN CASE COMMENT ERROR LAGI
--vim.keymap.set('n', '<leader>/', function()
--  require('Comment.api').toggle.linewise.current()
--end, { noremap = true, silent = true, desc = "Toggle comment" })
--local api = require('Comment.api')
--
--
--local function comment_visual_selection()
--  local mode = vim.fn.visualmode()
--  local s_start = vim.fn.getpos("'<")
--  local s_end = vim.fn.getpos("'>")
--  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
--
--  -- Store the current cursor position
--  local cur_pos = vim.fn.getcurpos()
--
--  -- Move to the start of the visual selection
--  vim.cmd("normal! `<")
--
--  -- Comment the lines
--  api.toggle.linewise(mode)
--
--  -- Restore the cursor position
--  vim.fn.setpos('.', cur_pos)
--end
--
--vim.keymap.set('x', 'gll', comment_visual_selection, {noremap = true, silent = true})
--vim.keymap.set('x', 'gcc', comment_visual_selection, {noremap = true, silent = true})
