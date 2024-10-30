-- File: ~/.config/nvim/lua/plugins/cmp.lua
local M = {}

M.setup = function()
  local cmp = require('cmp')
  local types = require('cmp.types')
  
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    preselect = cmp.PreselectMode.None,
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
      { name = 'path' },
    }),
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snip]",
          buffer = "[Buf]",
          path = "[Path]"
        })[entry.source.name]
        return vim_item
      end
    },
    completion = {
      completeopt = 'menu,menuone,noinsert',
      keyword_length = 1,
    },
    view = {
      entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    matching = {
      disallow_fuzzy_matching = false,
      disallow_partial_fuzzy_matching = false,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = false,
    },
  })

  -- Special configuration for SystemVerilog files
  cmp.setup.filetype('systemverilog', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp', priority = 1000 },
      { name = 'luasnip', priority = 750 },
    }, {
      { name = 'buffer', priority = 500 },
      { name = 'path', priority = 250 },
    })
  })

  -- Configure `<C-Space>` to manually trigger completion
  vim.keymap.set('i', '<C-Space>', function()
    if cmp.visible() then
      cmp.close()
    else
      cmp.complete()
    end
  end, { silent = true })

  -- Set up completion for command mode
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up completion for / search
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
end

return M
