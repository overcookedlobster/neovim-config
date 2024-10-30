-- File: ~/.config/nvim/lua/plugins/systemverilog.lua
local M = {}

-- Define the mappings function at the module level
local function set_sv_mappings()
    local opts = { noremap = true, silent = true }
    
    -- Instance template generation
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>vi', ':VerilogInstance<CR>', opts)
    
    -- Go to module definition
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>vg', ':VerilogGotoInstanceStart<CR>', opts)
    
    -- Follow instance port connections
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>vf', ':VerilogFollowInstance<CR>', opts)
    
    -- Follow instance port declarations
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>vd', ':VerilogFollowPort<CR>', opts)
    
    -- Open matching file (implementation/header)
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>vo', ':VerilogOpenMatchingFile<CR>', opts)
end

-- Make the function accessible through the module
M.apply_mappings = set_sv_mappings

M.setup = function()
    -- Configure verilog_systemverilog plugin settings
    vim.g.verilog_syntax_fold_lst = "module,function,task,specify,interface"
    vim.g.verilog_dont_deindent_eos = 1
    vim.g.verilog_indent_modules = 1
    vim.g.verilog_indent_width = 2
    vim.g.verilog_disable_indent_lst = "eos"
    
    -- Enable automatic indentation for SystemVerilog files
    vim.cmd([[
        augroup systemverilog_settings
            autocmd!
            autocmd FileType systemverilog setlocal foldmethod=syntax
            autocmd FileType systemverilog setlocal tabstop=2
            autocmd FileType systemverilog setlocal shiftwidth=2
            autocmd FileType systemverilog setlocal expandtab
            autocmd FileType systemverilog setlocal autoindent
            autocmd FileType systemverilog setlocal smartindent
        augroup END
    ]])

    -- Define SystemVerilog file patterns
    vim.cmd([[
        augroup systemverilog_files
            autocmd!
            autocmd BufNewFile,BufRead *.sv,*.svh setfiletype systemverilog
        augroup END
    ]])

    -- Apply mappings for SystemVerilog files using a more reliable method
    vim.cmd([[
        augroup systemverilog_mappings
            autocmd!
            autocmd FileType systemverilog lua require('plugins.systemverilog').apply_mappings()
        augroup END
    ]])

    -- Setup LSP for SystemVerilog
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.svls.setup{
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            
            -- LSP mappings
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            
            -- Apply SystemVerilog specific mappings
            M.apply_mappings()
        end,
        settings = {
            systemverilog = {
                includeIndexing = {"**/*.{sv,svh}"},
                excludeIndexing = {"**/test/**"},
            }
        }
    }
end

return M
