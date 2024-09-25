   local M = {}

   function M.setup()
     -- Recognize .tsv files as CSV with tab delimiter
     vim.g.csv_extensions = {'csv', 'tsv'}

     -- Set tab as the default delimiter for .tsv files
     vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
       pattern = "*.tsv",
       callback = function()
         vim.b.csv_delimiter = "\t"
       end
     })

     -- Optional: Create a command for non-.tsv files
     vim.api.nvim_create_user_command('TSV', function()
       vim.bo.filetype = 'csv'
       vim.b.csv_delimiter = "\t"
     end, {})

     -- Optional: Set up key mappings
     local function map(mode, lhs, rhs, opts)
       local options = { noremap = true, silent = true }
       if opts then options = vim.tbl_extend('force', options, opts) end
       vim.api.nvim_set_keymap(mode, lhs, rhs, options)
     end

     vim.api.nvim_create_autocmd("FileType", {
       pattern = "csv",
       callback = function()
         map('n', '<C-k>', '<Plug>CSV_KernelSort', {buffer = true})
         map('n', '<C-j>', '<Plug>CSV_WhatColumn', {buffer = true})
         map('n', '<C-h>', '<Plug>CSV_HiColumn', {buffer = true})
         map('n', '<C-l>', '<Plug>CSV_NrColumns', {buffer = true})
       end
     })
   end

   return M
