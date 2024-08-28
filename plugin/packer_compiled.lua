-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hanginglobster/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/home/hanginglobster/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/home/hanginglobster/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/home/hanginglobster/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hanginglobster/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-omni"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  flexoki = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/flexoki",
    url = "https://github.com/kepano/flexoki"
  },
  fzf = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ouroboros = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/ouroboros",
    url = "https://github.com/jakemason/ouroboros"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parrot.nvim"] = {
    config = { "\27LJ\2\n©\4\0\0\b\0\22\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\17\0005\4\6\0006\5\3\0009\5\4\5'\a\5\0B\5\2\2=\5\a\0045\5\b\0005\6\t\0=\6\n\5=\5\v\0045\5\r\0005\6\f\0=\6\14\0055\6\15\0=\6\16\5=\5\n\4=\4\18\0034\4\0\0=\4\19\3=\3\21\2B\0\2\1K\0\1\0\14providers\1\0\2\18user_input_ui\vnative\14providers\0\vollama\14anthropic\1\0\2\14anthropic\0\vollama\0\fcommand\1\0\1\15max_tokens\3€ \tchat\1\0\2\fcommand\0\tchat\0\1\0\1\15max_tokens\3€ \ntopic\vparams\1\0\1\15max_tokens\3 \1\0\2\nmodel\28claude-3-haiku-20240307\vparams\0\fapi_key\1\0\5\vparams\0\ntopic\0\17topic_promptKYou only respond with 3 to 4 words to summarize the past conversation.\rendpoint*https://api.anthropic.com/v1/messages\fapi_key\0\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\frequire\0" },
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/parrot.nvim",
    url = "https://github.com/frankroeder/parrot.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["seoul256.vim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-heading.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toast.vim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/toast.vim",
    url = "https://github.com/jsit/toast.vim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-jukit"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/vim-jukit",
    url = "https://github.com/luk400/vim-jukit"
  },
  ["vim-latex-live-preview"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/opt/vim-latex-live-preview",
    url = "https://github.com/xuhdev/vim-latex-live-preview"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["w3m.vim"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/w3m.vim",
    url = "https://github.com/yuratomo/w3m.vim"
  },
  yui = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/yui",
    url = "https://github.com/cideM/yui"
  },
  ["zhaw-snippets"] = {
    loaded = true,
    path = "/home/hanginglobster/.local/share/nvim/site/pack/packer/start/zhaw-snippets",
    url = "https://github.com/InES-HPMM/zhaw-snippets"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: parrot.nvim
time([[Config for parrot.nvim]], true)
try_loadstring("\27LJ\2\n©\4\0\0\b\0\22\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\17\0005\4\6\0006\5\3\0009\5\4\5'\a\5\0B\5\2\2=\5\a\0045\5\b\0005\6\t\0=\6\n\5=\5\v\0045\5\r\0005\6\f\0=\6\14\0055\6\15\0=\6\16\5=\5\n\4=\4\18\0034\4\0\0=\4\19\3=\3\21\2B\0\2\1K\0\1\0\14providers\1\0\2\18user_input_ui\vnative\14providers\0\vollama\14anthropic\1\0\2\14anthropic\0\vollama\0\fcommand\1\0\1\15max_tokens\3€ \tchat\1\0\2\fcommand\0\tchat\0\1\0\1\15max_tokens\3€ \ntopic\vparams\1\0\1\15max_tokens\3 \1\0\2\nmodel\28claude-3-haiku-20240307\vparams\0\fapi_key\1\0\5\vparams\0\ntopic\0\17topic_promptKYou only respond with 3 to 4 words to summarize the past conversation.\rendpoint*https://api.anthropic.com/v1/messages\fapi_key\0\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\frequire\0", "config", "parrot.nvim")
time([[Config for parrot.nvim]], false)
-- Config for: vim-jukit
time([[Config for vim-jukit]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-jukit")
time([[Config for vim-jukit]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-latex-live-preview'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
