-- File: ~/.config/nvim/lua/plugins/cmp.lua
local M = {}

M.setup = function()
  local cmp = require('cmp')
  
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },    -- LSP source
      { name = 'luasnip' },     -- Snippets
      { name = 'buffer' },      -- Buffer words
      { name = 'path' },        -- File paths
    }),
    completion = {
      completeopt = 'menu,menuone,noinsert'
    }
  })

  -- Special configuration for SystemVerilog files
  cmp.setup.filetype('systemverilog', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },    -- LSP source
      { name = 'luasnip' },     -- Snippets
      { name = 'omni' },        -- Omni completion
      { name = 'buffer' },      -- Buffer words
      { name = 'path' },        -- File paths
    })
  })

  -- Command line setup (optional)
  -- cmp.setup.cmdline(':', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources({
  --     { name = 'cmdline' }
  --   })
  -- })
end

return M
