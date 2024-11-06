-- Automatically install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
-- print(vim.inspect(vim.g.jukit_config_path))

-- Set Python provider
vim.g.python3_host_prog = '/usr/bin/python3'  -- Adjust path as needed
local packer_bootstrap = ensure_packer()
-- Add this to your init.lua
vim.g.jukit_config_path = vim.fn.stdpath('config') .. '/jukit_config.json'
-- Enable vim-jukit debug mode
vim.g.jukit_debug = 2
vim.g.jukit_shell_cmd = 'ipython3'
vim.g.jukit_terminal = 'nvimterm'
vim.g.jukit_auto_output_hist = 1
vim.g.jukit_use_tcomment = 1




-- Autocommand to reload Neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use packer to manage itself and install plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  -- Install Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Add your plugins here, e.g.:
  -- use 'tpope/vim-surround'
  -- use 'nvim-treesitter/nvim-treesitter'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Keep this at the end of your plugin list
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Load core options
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load plugin configurations
require('plugins.packer')
require('plugins.telescope')
require('plugins.treesitter')
-- require('plugins.lsp')
require('plugins.cmp').setup()
-- require('plugins.lsp').setup()
require('plugins.null-ls')
require('plugins.trouble')
require('plugins.markdown')
require('plugins.luasnip')
require('plugins.LuaSnip') -- Reload LuaSnip config
-- require('plugins.nvim-cmp')
-- require('plugins.cmp')
-- require('plugins.systemverilog').setup()
require('plugins.Comment')
require('personal.checklist_directory_generator').setup()
-- In your init.lua
require('personal.transient-notes').setup({
    -- Optional: override default settings
    width = 0.6,  -- 60% of screen width
    height = 0.7, -- 70% of screen height
    notes_dir = vim.fn.expand('~/Documents/my_notes/'),  -- Optional: change the notes directory
})
-- Load utilities
require('utils').setup()
-- Load colorscheme
-- require('ayu').setup({
--     mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--     terminal = true, -- Set to `false` to let terminal manage its own colors.
--     overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
-- })
vim.opt.hlsearch = true
-- vim.opt.background = "dark"
vim.cmd('colorscheme gruvbox-material')
vim.o.background = "dark" vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_ui_contrast = "high"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_visual ="red background"
-- vim.g.gruvbox_material_better_performance = 1
-- vim.cmd("colorscheme lunaperche")

local clipboard_saver = require('clipboard_image_saver')
clipboard_saver.setup({
  save_path = vim.fn.expand('~/Pictures/clipboard_images'),
  name_format = "screenshot_{timestamp}_{count}"
})
-- Enable VimTeX
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
vim.g.vimtex_enabled = 1
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_complete_enabled = 1
vim.g.vimtex_compiler_latexmk = {build_dir = ''}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.bo.omnifunc = 'vimtex#complete#omnifunc'
  end,
})

vim.api.nvim_create_user_command('ReloadConfig', function()
    -- Unload all loaded modules
    for name,_ in pairs(package.loaded) do
        if name:match('^plugins') or name:match('^core') then
            package.loaded[name] = nil
        end
    end

    -- Source init.lua
    dofile(vim.env.MYVIMRC)

    -- Reload some critical runtime files
    local function safe_source(file)
        local ok, err = pcall(vim.cmd, 'silent! source ' .. file)
        if not ok then
            print('Error sourcing ' .. file .. ': ' .. err)
        end
    end

    safe_source(vim.fn.stdpath('config') .. '/plugin/**/*.vim')
    safe_source(vim.fn.stdpath('config') .. '/plugin/**/*.lua')
    safe_source(vim.fn.stdpath('config') .. '/ftplugin/**/*.vim')
    safe_source(vim.fn.stdpath('config') .. '/ftplugin/**/*.lua')

    -- Manually trigger some reloads
    require('plugins.LuaSnip') -- Reload LuaSnip config
    require('plugins.nvim-cmp') -- Reload nvim-cmp config

    -- Force re-detection of filetype for the current buffer
    vim.cmd('filetype detect')

    print('Configuration reloaded!')
end, {})
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "*",
--   callback = function()
--     if vim.b.undo_ftplugin == nil then
--       vim.b.undo_ftplugin = ""
--     end
--   end
-- })

-- -- Enable omni completion
vim.o.omnifunc = 'syntaxcomplete#Complete'

 -- Enable omni completion for all file types
 -- vim.api.nvim_create_autocmd("FileType", {
 --   pattern = "*",
 --   callback = function()
 --     vim.bo.omnifunc = 'syntaxcomplete#Complete'
 --   end,
 -- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "tex",
--   callback = function()
--     -- Use vim-surround to delete surroundings
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>d(', 'ds(', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>d[', 'ds[', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>d{', 'ds{', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>d"', 'ds"', {noremap = false, silent = true})
--     
--     -- Use vim-surround to delete surroundings
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c(', 'cs(', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c[', 'cs[', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c{', 'cs{', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c"', 'cs"', {noremap = false, silent = true})
--     -- Add LaTeX-specific surroundings
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>se', 'ysiw\\emph{', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>sb', 'ysiw\\textbf{', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'n', '<leader>si', 'ysiw\\textit{', {noremap = false, silent = true})
--     
--     -- For visual mode
--     vim.api.nvim_buf_set_keymap(0, 'v', '<leader>se', 'S\\emph{', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'v', '<leader>sb', 'S\\textbf{', {noremap = false, silent = true})
--     vim.api.nvim_buf_set_keymap(0, 'v', '<leader>si', 'S\\textit{', {noremap = false, silent = true})
--   end,
-- })
if vim.fn.has('nvim-0.7') == 0 then
  vim.api.nvim_err_writeln('concat_files requires at least nvim-0.7')
  return
end

-- Create a command to use the function
vim.api.nvim_create_user_command('ConcatFiles', function(opts)
  require('personal/concat_files').concat_files(opts.args)
end, {nargs = '*'})
vim.api.nvim_set_keymap('n', '<leader>ym', [[:redir @+ | :message | :redir END<CR>]], { noremap = true, silent = true })

vim.g.python3_host_prog = '/usr/bin/python3'
vim.opt.verbosefile = "/tmp/nvim.log"
vim.opt.verbose = 2
-- print("Attempting to load personal.beamer_folder")
local ok, beamer_folder = pcall(require, "personal.beamer_folder")
if ok then
    -- print("personal.beamer_folder loaded successfully")
    beamer_folder.setup()
    -- print("personal.beamer_folder setup complete")
-- else
    -- print("Error loading personal.beamer_folder module: " .. tostring(beamer_folder))
end
vim.api.nvim_set_keymap('n', '<leader>pr', ':PrtChatResponde<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>prr', ':PrtChatNew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pa', ':PrtAsk<CR>', { noremap = true, silent = true })
local function keymapOptions(desc)
    return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
    }
end
vim.keymap.set("v", "<C-p>r", ":<C-u>'<,'>PrtRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-p>a", ":<C-u>'<,'>PrtAppend<cr>", keymapOptions("Visual Append (after)"))
vim.keymap.set("v", "<C-p>b", ":<C-u>'<,'>PrtPrepend<cr>", keymapOptions("Visual Prepend (before)"))
vim.keymap.set("v", "<C-p>i", ":<C-u>'<,'>PrtImplement<cr>", keymapOptions("Implement selection"))

-- Make Ranger replace Netrw and be the file explorer
vim.g.rnvimr_enable_ex = 1

-- Make Ranger to be hidden after picking a file
vim.g.rnvimr_enable_picker = 1

-- Replace `$EDITOR` candidate with this command to open the selected file
vim.g.rnvimr_edit_cmd = 'drop'

-- Disable a border for floating window
vim.g.rnvimr_draw_border = 0

-- Hide the files included in gitignore
vim.g.rnvimr_hide_gitignore = 1

-- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
vim.g.rnvimr_enable_bw = 1

-- Add a shadow window, value is equal to 100 will disable shadow
vim.g.rnvimr_shadow_winblend = 70

-- Map Rnvimr action
vim.api.nvim_set_keymap('n', '<leader>rr', ':RnvimrToggle<CR>', {noremap = true, silent = true})
require('plugins.csv').setup()

   vim.api.nvim_set_keymap('i', '<Tab>', '<Tab>', { noremap = true, silent = true })
   vim.api.nvim_set_keymap('s', '<Tab>', '<Tab>', { noremap = true, silent = true })



vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>")
vim.keymap.set('n', '<TAB>', ':bn<CR>', { silent = true })
vim.keymap.set('n', '<S-TAB>', ':bp<CR>', { silent = true })
