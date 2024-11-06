-- File: ~/.config/nvim/lua/plugins/systemverilog.lua
local M = {}

M.setup = function()
    -- Base configuration remains the same
    vim.g.verilog_syntax_fold_lst = "block,function,task,specify,module,class,covergroup"
    vim.g.verilog_disable_indent_lst = "eos"
    vim.g.verilog_indent_modules = 1
    vim.g.verilog_indent_width = 2

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Enhanced LSP configuration for better context awareness
    lspconfig.svls.setup{
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            -- Previous LSP mappings remain...
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)

            -- Enhanced hover for SystemVerilog objects
            vim.keymap.set('n', 'K', function()
                local filetype = vim.bo.filetype
                if filetype == 'systemverilog' then
                    -- Try to get enhanced hover information
                    vim.lsp.buf.hover()
                end
            end, bufopts)

            print("SystemVerilog LSP attached with enhanced context support")
        end,
        settings = {
            systemverilog = {
                -- File indexing configuration
                includeIndexing = {
                    "**/*.sv",
                    "**/*.svh",
                    "**/*.v",
                    "**/*.vh"
                },
                excludeIndexing = {
                    "**/sim/**",
                    "**/tb/**"
                },
                -- Library paths - important for finding built-in classes and methods
                libraryFiles = {
                    "**/*.sv",
                    "**/*.svh",
                    "**/*.v",
                    "**/*.vh"
                },
                -- Enhanced feature set
                features = {
                    classContext = true,
                    memberCompletion = true,
                    hover = true,
                    signatureHelp = true,
                    -- Additional features for better context awareness
                    semanticHighlighting = true,
                    documentSymbols = true,
                    documentFormatting = true
                },
                -- Parser configuration for better context understanding
                parser = {
                    -- Enable class and covergroup parsing
                    parseClassProperties = true,
                    parseCovergroups = true,
                    parseAssertions = true,
                    parseConstraints = true
                },
                -- Type information
                typeHierarchy = {
                    enabled = true,
                    depth = 3
                }
            }
        },
        -- Improved workspace configuration
        root_dir = function(fname)
            local util = require('lspconfig.util')
            return util.root_pattern(
                'svls.toml',
                '.svls.toml',
                '.git',
                'package.sv'
            )(fname) or util.path.dirname(fname)
        end
    }

    -- Create an enhanced SVLS config
    local function create_svls_config()
        local config_file = vim.fn.getcwd() .. '/.svls.toml'
        if vim.fn.filereadable(config_file) == 0 then
            local f = io.open(config_file, 'w')
            if f then
                f:write([[
[options]
# SystemVerilog file extensions
fileExtensions = ["*.sv", "*.svh", "*.v", "*.vh"]

# Parser settings
[parser]
# Enable parsing of all relevant constructs
parseClassProperties = true
parseCovergroups = true
parseAssertions = true
parseConstraints = true

# Type hierarchy settings
[typeHierarchy]
enabled = true
depth = 3

# Include paths for standard libraries and UVM
[libraries]
# Add paths to any standard libraries you use
paths = [
    # Example UVM path (uncomment and modify as needed)
    # "/path/to/uvm/src"
]

# Preprocessor defines
[defines]
# Add any necessary defines here
values = []

# Workspace settings
[workspace]
# Library files or packages to include
libraryFiles = []
# Files to exclude
excludePatterns = ["**/sim/**", "**/tb/**"]
                ]])
                f:close()
                print("Created enhanced SVLS config file at " .. config_file)
            end
        end
    end

    create_svls_config()
end

return M
