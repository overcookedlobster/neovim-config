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

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'InES-HPMM/zhaw-snippets'
  use 'tpope/vim-sensible'
  use 'junegunn/seoul256.vim'
  use {'xuhdev/vim-latex-live-preview', ft = 'tex'}
  use {'L3MON4D3/LuaSnip', tag = 'v2.*', run = 'make install_jsregexp'}
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.4'}
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'crispgm/telescope-heading.nvim'
  use 'jakemason/ouroboros'
  use 'morhetz/gruvbox'
  use 'luk400/vim-jukit'
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'ibhagwan/fzf-lua', branch = 'main'}
  use 'nvim-tree/nvim-web-devicons'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-omni'
  use 'hrsh7th/cmp-nvim-lsp'
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
