-- Telescope Configuration
-- This file should be placed in your Neovim config directory, typically ~/.config/nvim/lua/
-- Then require it in your init.lua with: require('telescope_config')

local telescope = require('telescope')
local actions = require('telescope.actions')

-- Telescope setup with custom settings
telescope.setup {
  -- Default configuration for telescope
  defaults = {
    -- Ignore these directories when searching
    file_ignore_patterns = {"^vendor/", "^node_modules/"},
    
    -- Use a vertical layout
    layout_strategy = 'vertical',
    layout_config = { 
      height = 0.95, -- Use 95% of screen height
      width = 0.95,  -- Use 95% of screen width
    },

    -- Smart way to display file paths
    path_display = { "smart" },

    -- Ensure true color support
    set_env = { ['COLORTERM'] = 'truecolor' },

    -- Keybindings for telescope prompt
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
    extensions = {
        file_browser = {
      mappings = {
        i = {
          ["<C-n>"] = create_new_file,
        },
      },
    },
  },
  },

  -- Configuration for specific pickers
  pickers = {
    find_files = {
      theme = "dropdown", -- Use dropdown theme for find_files
    }
  },

  -- Configuration for telescope extensions
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  }
}

-- Load telescope extensions
telescope.load_extension('fzf')

-- Keybindings
local opts = { noremap = true, silent = true }

-- Find files
vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', opts)

-- Find files from project root (requires vim-rooter)
vim.keymap.set('n', '<Leader>fr', '<Cmd>Rooter<CR><Cmd>Telescope find_files<CR>', opts)

-- Find hidden files (including dotfiles)
vim.keymap.set('n', '<Leader>fh', '<Cmd>Telescope find_files hidden=true<CR>', opts)

-- Find files in current file's directory
vim.keymap.set('n', '<Leader>fd', function()
  require("telescope.builtin").find_files({cwd = vim.fn.expand("%:p:h")})
end, opts)

-- Live grep (requires ripgrep)
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', opts)

-- Help tags
vim.keymap.set('n', '<Leader>fH', '<Cmd>Telescope help_tags<CR>', opts)

-- Man pages
vim.keymap.set('n', '<Leader>fm', '<Cmd>Telescope man_pages<CR>', opts)

-- Vim keymaps
vim.keymap.set('n', '<Leader>fk', '<Cmd>Telescope keymaps<CR>', opts)

-- Vim options
vim.keymap.set('n', '<Leader>fo', '<Cmd>Telescope vim_options<CR>', opts)

-- Registers
vim.keymap.set('n', '<Leader>fR', '<Cmd>Telescope registers<CR>', opts)

-- Git commands
vim.keymap.set('n', '<Leader>gc', '<Cmd>Telescope git_commits<CR>', opts)
vim.keymap.set('n', '<Leader>gb', '<Cmd>Telescope git_branches<CR>', opts)
vim.keymap.set('n', '<Leader>gs', '<Cmd>Telescope git_status<CR>', opts)

-- Resume last telescope picker
vim.keymap.set('n', '<Leader>fl', '<Cmd>Telescope resume<CR>', opts)

-- Fuzzy find in current buffer
vim.keymap.set('n', '<Leader>f/', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', opts)

-- List all TODOs in your project
vim.keymap.set('n', '<Leader>ft', '<Cmd>Telescope grep_string search=TODO<CR>', opts)

-- Telescope file browser
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope file_browser<CR>', opts)
