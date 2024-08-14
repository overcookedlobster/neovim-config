
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

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  vim.notify('Packer not found. Skipping plugin setup.', vim.log.levels.WARN)
  return
end

-- Rest of your packer configuration
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'InES-HPMM/zhaw-snippets'
  use 'tpope/vim-surround'
  use 'tpope/vim-sensible'
  use 'junegunn/seoul256.vim'
  use 'tiagovla/tokyodark.nvim'
  use {'xuhdev/vim-latex-live-preview', ft = 'tex'}
  use {'L3MON4D3/LuaSnip', tag = 'v2.*', run = 'make install_jsregexp'}
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.4'}
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'crispgm/telescope-heading.nvim'
  use 'jakemason/ouroboros'

-- Colors
use 'kepano/flexoki'
  use 'Shatur/neovim-ayu'
  -- use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'cideM/yui'
  use 'jsit/toast.vim'

  --AI
    -- Add parrot.nvim
  use {
    'frankroeder/parrot.nvim',
    tag = "v0.4.2",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    config = function()
      require("parrot").setup {
        providers = {
          -- pplx = {
          --   api_key = os.getenv "PERPLEXITY_API_KEY",
          -- },
          -- openai = {
          --   api_key = os.getenv "OPENAI_API_KEY",
          -- },
          anthropic = {
            api_key = os.getenv "ANTHROPIC_API_KEY",
            endpoint = "https://api.anthropic.com/v1/messages",
            topic_prompt = "You only respond with 3 to 4 words to summarize the past conversation.",
            topic = {
              model = "claude-3-haiku-20240307",
              params = { max_tokens = 32 },
            },
            params = {
              chat = { max_tokens = 4096 },
              command = { max_tokens = 4096 },
            },
          },
          -- mistral = {
          --   api_key = os.getenv "MISTRAL_API_KEY",
          -- },
          -- gemini = {
          --   api_key = os.getenv "GEMINI_API_KEY",
          -- },
          -- groq = {
          --   api_key = os.getenv "GROQ_API_KEY",
          -- },
          ollama = {} -- provide an empty list to make provider available
        },
        
    -- The interactive user input appearing when can be "native" for
    -- vim.ui.input or "buffer" to query the input within a native nvim buffer
    -- (see video demonstrations below)
        user_input_ui = "native",

      }
    end,
    }

  use 'luk400/vim-jukit'
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'ibhagwan/fzf-lua', branch = 'main'}
  use 'nvim-tree/nvim-web-devicons'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-omni'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'numToStr/Comment.nvim'
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use("preservim/vim-markdown")
  use 'tpope/vim-fugitive'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
