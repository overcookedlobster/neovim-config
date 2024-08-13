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

