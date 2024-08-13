-- Load core options
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load plugin configurations
require('plugins.packer')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.null-ls')
require('plugins.trouble')
require('plugins.markdown')
require('plugins.luasnip')
require('plugins.nvim-cmp')

require('personal.checklist_directory_generator').setup()
-- Load utilities
require('utils').setup()
-- Load colorscheme
vim.cmd('colorscheme gruvbox')
local clipboard_saver = require('clipboard_image_saver')
clipboard_saver.setup({
  save_path = vim.fn.expand('~/Pictures/clipboard_images'),
  name_format = "screenshot_{timestamp}_{count}"
})
-- Enable VimTeX
vim.g.vimtex_enabled = 1
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_complete_enabled = 1

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
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.b.undo_ftplugin == nil then
      vim.b.undo_ftplugin = ""
    end
  end
})
