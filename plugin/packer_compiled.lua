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
local package_path_str = "/home/flyinglobster/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/home/flyinglobster/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/home/flyinglobster/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/home/flyinglobster/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/flyinglobster/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
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
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-omni"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  flexoki = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/flexoki",
    url = "https://github.com/kepano/flexoki"
  },
  fzf = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ouroboros = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/ouroboros",
    url = "https://github.com/jakemason/ouroboros"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parrot.nvim"] = {
    config = { "\27LJ\2\nZ\0\2\6\1\2\0\17\15\0\0\0X\2\14€-\2\0\0\18\4\2\0009\2\0\2\18\5\0\0B\2\3\2\15\0\2\0X\3\5€\18\5\2\0009\3\1\2B\3\2\2\14\0\3\0X\4\1€\18\3\1\0L\3\2\0L\1\2\0\2À\rabsolute\bnew÷\6\0\2\19\1#\1\1276\2\0\0009\2\1\2'\4\2\0006\5\3\0\18\a\1\0B\5\2\2&\4\5\0046\5\0\0009\5\4\0059\5\5\0059\5\6\5B\2\3\0016\2\a\0-\4\0\0009\4\b\0045\5\t\0=\0\n\5-\6\0\0009\6\v\0069\6\f\0069\6\r\0066\a\14\0+\b\0\0006\t\15\0B\2\a\3\15\0\2\0X\4\4€\15\0\3\0X\4\2€\a\3\16\0X\4?€6\4\0\0009\4\1\4'\6\17\0006\a\0\0009\a\4\a9\a\5\a9\a\18\aB\4\3\1'\4\19\0004\5\0\0\18\b\0\0009\6\20\0'\t\21\0B\6\3\4X\t\5€6\n\22\0009\n\23\n\18\f\5\0\18\r\t\0B\n\3\1E\t\3\2R\tù\127'\6\16\0)\a\0\0006\b\24\0\18\n\5\0B\b\2\4X\v\17€\5\f\6\0X\r\2€\22\a\0\aX\r\r€)\r\0\0\1\r\a\0X\r\b€\18\r\4\0006\14\25\0009\14\26\14'\16\27\0\18\17\6\0\22\18\0\aB\14\4\2&\4\14\r\18\6\f\0)\a\0\0E\v\3\3R\ví\127)\b\0\0\1\b\a\0X\b\b€\18\b\4\0006\t\25\0009\t\26\t'\v\27\0\18\f\6\0\22\r\0\aB\t\4\2&\4\t\b\18\b\4\0'\t\28\0&\b\t\b+\t\2\0J\b\3\0006\4\29\0\18\6\3\0B\4\2\2\a\4\25\0X\4\17€\18\6\3\0009\4\30\3'\a\31\0B\4\3\2\15\0\4\0X\5\b€\18\6\3\0009\4 \3'\a\31\0'\b\16\0B\4\4\2+\5\2\0J\4\3\0X\4\3€\18\4\3\0+\5\1\0J\4\3\0006\4\0\0009\4\1\4'\6!\0006\a\0\0009\a\4\a9\a\5\a9\a\"\aB\4\3\1+\4\0\0+\5\2\0J\4\3\0\4\0\nERROR&Unexpected result from processing\tgsub\f# EOF\n$\nmatch\ttype\f\n# EOF\n   - %s (repeated %d times)\n\vformat\vstring\vipairs\vinsert\ntable\v[^\r\n]+\vgmatch\14summary:\n\tWARNMAI processing failed or returned empty result, using fallback processing\5\rtemplate\14model_obj\npopup\vTarget\aui\targs\1\0\1\targs\0\vPrompt\npcall\nDEBUG\vlevels\blog\rtostring%Processing chunk, continuation: \vnotify\bvim\2¡\14\1\2\19\5.\0›\0026\2\0\0009\2\1\2'\4\2\0\18\5\0\0&\4\5\0046\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\1+\2\0\0006\3\6\0009\3\a\3\18\5\0\0'\6\b\0B\3\3\2\14\0\3\0X\4\v€6\4\0\0009\4\1\4'\6\t\0\18\a\0\0&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\n\aB\4\3\0012\0ø€\18\6\3\0009\4\v\3'\a\f\0B\4\3\2\18\2\4\0\18\6\3\0009\4\r\3B\4\2\1\15\0\2\0X\3\2€\a\2\14\0X\3\v€6\3\0\0009\3\1\3'\5\15\0\18\6\0\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\16\6B\3\3\0012\0â€6\3\0\0009\3\1\3'\5\17\0\21\6\2\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\0016\3\0\0009\3\1\3'\5\19\0\18\6\0\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\0016\3\0\0009\3\1\3'\5\20\0006\6\21\0-\b\0\0B\6\2\2&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\0016\3\0\0009\3\1\3'\5\22\0006\6\21\0-\b\1\0B\6\2\2&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\1-\3\2\0\18\5\3\0009\3\23\3\18\6\0\0B\3\3\2\18\5\3\0009\3\24\3-\6\0\0B\3\3\0026\4\0\0009\4\1\4'\6\25\0006\a\21\0\18\t\3\0B\a\2\2&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\18\aB\4\3\1\14\0\3\0X\4\v€6\4\0\0009\4\1\4'\6\26\0\18\a\0\0&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\n\aB\4\3\0012\0•€-\4\2\0\18\6\4\0009\4\23\4-\a\1\0\18\b\3\0B\4\4\0026\5\0\0009\5\1\5'\a\27\0006\b\21\0\18\n\4\0B\b\2\2&\a\b\a6\b\0\0009\b\3\b9\b\4\b9\b\18\bB\5\3\1\14\0\4\0X\5\t€6\5\0\0009\5\1\5'\a\28\0006\b\0\0009\b\3\b9\b\4\b9\b\n\bB\5\3\0012\0y€6\5\21\0\18\a\4\0B\5\2\2'\6\29\0&\5\6\0056\6\0\0009\6\1\6'\b\30\0\18\t\5\0&\b\t\b6\t\0\0009\t\3\t9\t\4\t9\t\18\tB\6\3\1-\6\2\0\18\b\6\0009\6\23\6\18\t\5\0B\6\3\2\18\4\6\0\14\0\4\0X\6\t€6\6\0\0009\6\1\6'\b\31\0006\t\0\0009\t\3\t9\t\4\t9\t\n\tB\6\3\0012\0Z€6\6\0\0009\6\1\6'\b \0006\t\21\0\18\v\4\0B\t\2\2&\b\t\b6\t\0\0009\t\3\t9\t\4\t9\t\18\tB\6\3\0016\6\6\0009\6\a\0066\b\21\0\18\n\4\0B\b\2\2'\t!\0B\6\3\2\14\0\6\0X\a\r€6\a\0\0009\a\1\a'\t\"\0006\n\21\0\18\f\4\0B\n\2\2&\t\n\t6\n\0\0009\n\3\n9\n\4\n9\n\n\nB\a\3\0012\0009€\18\t\6\0009\a#\6'\n$\0B\a\3\1\18\t\6\0009\a#\6B\a\2\2)\b\0\0\0\b\a\0X\b\2€+\b\1\0X\t\1€+\b\2\0-\t\3\0009\t%\t\14\0\t\0X\n\5€6\t\0\0009\t&\t9\t'\t'\v(\0B\t\2\2\a\t\14\0X\n\t€6\n\0\0009\n\1\n'\f)\0006\r\0\0009\r\3\r9\r\4\r9\r\16\rB\n\3\1'\t*\0003\n+\0\18\r\6\0009\v\r\6B\v\2\0016\v\0\0009\v\1\v'\r,\0\18\14\0\0'\15-\0006\16\21\0\18\18\4\0B\16\2\2&\r\16\r6\14\0\0009\14\3\0149\14\4\0149\14\5\14B\v\3\1K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0\6€\a€\2À\1À\0À\19 and saved to \15Processed \0\fcontent9No YAML structure provided. Using default structure.BEnter desired YAML structure (e.g., summary, details, etc.): \ninput\afn\19yaml_structure\bend\tseek!Failed to open output file: \aa+\29Final output file path: 7Failed to create new Path object with .yaml suffix#Output file path with suffix: \n.yaml&Failed to create output file path\23Output file path: )Failed to create relative path for: \20Relative path: \18make_relative\bnew\18Output path: \rtostring\17Input path: \16File path: \nDEBUG\26File content length: \tWARN(File is empty or couldn't be read: \5\nclose\t*all\tread\nERROR Failed to open input file: \6r\topen\aio\tINFO\vlevels\blog\22Processing file: \vnotify\bvimŠ\3\0\0\6\2\14\2>6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\0039\3\5\3B\0\3\1-\0\0\0\14\0\0\0X\1\t€6\0\0\0009\0\6\0009\0\a\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\v€6\0\0\0009\0\6\0009\0\t\0006\2\b\0-\4\1\0B\2\2\2'\3\n\0+\4\1\0+\5\2\0D\0\5\0X\0\30€6\0\0\0009\0\6\0009\0\v\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\a€4\0\3\0006\1\b\0-\3\1\0B\1\2\0?\1\1\0L\0\2\0X\0\14€6\0\0\0009\0\1\0'\2\f\0006\3\b\0-\5\1\0B\3\2\2&\2\3\0026\3\0\0009\3\3\0039\3\4\0039\3\r\3B\0\3\0014\0\0\0L\0\2\0K\0\1\0\vÀ\6€\nERROR\25Invalid input path: \17filereadable\6*\rglobpath\rtostring\16isdirectory\afn\nDEBUG\vlevels\blog\29Getting files to process\vnotify\bvim\2\3€€À™\4¸\1\0\0\t\1\t\0\23-\0\0\0\18\2\0\0009\0\0\0'\3\1\0'\4\2\0B\0\4\0026\1\3\0'\3\4\0\18\4\0\0'\5\5\0&\3\5\3B\1\2\3\14\0\1\0X\3\a€6\3\6\0'\5\a\0006\6\b\0\18\b\2\0B\6\2\2&\5\6\5B\3\2\1\18\3\1\0D\3\1\0\15À\rtostring#Failed to parse YAML options: \nerror\6}\rreturn {\tload\n%1 = \14(%w+):%s*\tgsubÀ\17\1\2#\0<\1é\0026\2\0\0009\2\1\2'\4\2\0006\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\0016\2\6\0'\4\a\0B\2\2\2\14\0\2\0X\3\t€6\3\0\0009\3\1\3'\5\b\0006\6\0\0009\6\3\0069\6\4\0069\6\t\6B\3\3\0012\0Q6\3\0\0009\3\1\3'\5\n\0006\6\0\0009\6\3\0069\6\4\0069\6\5\6B\3\3\0016\3\v\0006\5\6\0'\6\f\0B\3\3\3\14\0\3\0X\5\t€6\5\0\0009\5\1\5'\a\r\0006\b\0\0009\b\3\b9\b\4\b9\b\t\bB\5\3\0012\0;6\5\0\0009\5\14\0059\a\15\1\14\0\a\0X\b\1€'\a\16\0'\b\17\0B\5\3\2,\6\a\0)\b\1\0004\t\0\0006\n\18\0\18\f\5\0B\n\2\4X\r,€\a\14\19\0X\15\a€\22\15\0\r8\15\15\5\15\0\15\0X\16\3€\22\15\0\r8\6\15\5X\15#€\a\14\20\0X\15\a€\22\15\0\r8\15\15\5\15\0\15\0X\16\3€\22\15\0\r8\a\15\5X\15\26€\a\14\21\0X\15\f€\22\15\0\r8\15\15\5\15\0\15\0X\16\b€6\15\22\0\22\17\0\r8\17\17\5B\15\2\2\f\b\15\0X\16\1€)\b\1\0X\15\f€\a\14\23\0X\15\n€\22\15\0\r8\15\15\5\15\0\15\0X\16\6€6\15\24\0009\15\25\15\18\17\t\0\22\18\0\r8\18\18\5B\15\3\1E\r\3\3R\rÒ\1276\n\0\0009\n\1\n'\f\26\0006\r\27\0\18\15\6\0B\r\2\2'\14\28\0006\15\27\0\18\17\a\0B\15\2\2'\16\29\0006\17\27\0\18\19\b\0B\17\2\2&\f\17\f6\r\0\0009\r\3\r9\r\4\r9\r\30\rB\n\3\0016\n\0\0009\n\31\n9\n \n'\f!\0B\n\2\2\r\v\6\0X\v\4€\18\r\6\0009\v\"\6'\14#\0B\v\3\2\15\0\v\0X\f\6€\18\14\6\0009\f$\6)\15\1\0)\16þÿB\f\4\2\18\6\f\0003\f%\0\18\r\f\0\18\15\6\0\18\18\2\0009\16&\2\18\19\n\0'\20'\0B\16\4\2\18\18\16\0009\16(\16B\16\2\0A\r\1\2\18\6\r\0\18\r\f\0\18\15\a\0\18\18\2\0009\16&\2\18\19\n\0'\20)\0B\16\4\2\18\18\16\0009\16(\16B\16\2\0A\r\1\2\18\a\r\0006\r\0\0009\r\1\r'\15*\0006\16\27\0\18\18\6\0B\16\2\2'\17\28\0006\18\27\0\18\20\a\0B\18\2\2&\15\18\0156\16\0\0009\16\3\0169\16\4\0169\16\30\16B\r\3\1\15\0\6\0X\r\n€6\r\0\0009\r\31\r9\r+\r6\15\27\0\18\17\6\0B\15\2\0A\r\0\2\19\r\r\0\t\r\0\0X\r\14€6\r\0\0009\r\1\r'\15,\0006\16\27\0\18\18\6\0B\16\2\2&\15\16\0156\16\0\0009\16\3\0169\16\4\0169\16\t\16B\r\3\0012\0\0€K\0\1\0\15\0\a\0X\r\t€6\r\0\0009\r\31\r9\r+\r6\15\27\0\18\17\a\0B\15\2\0A\r\0\2\b\r\0\0X\r\b€6\r\0\0009\r\31\r9\r-\r6\15\27\0\18\17\a\0B\15\2\2'\16.\0B\r\3\0013\r/\0003\0140\0006\15\0\0009\15\31\0159\15'\15'\0171\0'\0182\0B\15\3\0026\16\0\0009\16\1\16'\0183\0\18\19\15\0&\18\19\0186\19\0\0009\19\3\0199\19\4\0199\19\30\19B\16\3\1+\16\0\0006\17\v\0003\0194\0B\17\2\3\15\0\17\0X\19\2€\18\16\18\0X\19\14€6\19\0\0009\19\1\19'\0215\0006\22\27\0\18\24\18\0B\22\2\2&\21\22\0216\22\0\0009\22\3\0229\22\4\0229\22\t\22B\19\3\0012\0\0€K\0\1\0\v\16\0\0X\19\n€6\19\0\0009\19\1\19'\0216\0006\22\0\0009\22\3\0229\22\4\0229\22\t\22B\19\3\0012\0\0€K\0\1\0006\19\0\0009\19\1\19'\0217\0006\22\0\0009\0228\22\18\24\16\0B\22\2\2&\21\22\0216\22\0\0009\22\3\0229\22\4\0229\22\5\22B\19\3\1\18\19\14\0B\19\1\0026\20\0\0009\20\1\20'\0229\0006\23\0\0009\0238\23\18\25\19\0B\23\2\2&\22\23\0226\23\0\0009\23\3\0239\23\4\0239\23\30\23B\20\3\0016\20\18\0\18\22\19\0B\20\2\4X\23 €+\25\2\0006\26\18\0\18\28\t\0B\26\2\4X\29\b€\18!\24\0009\31\"\24\18\"\30\0B\31\3\2\15\0\31\0X \2€+\25\1\0X\26\2€E\29\3\3R\29ö\127\15\0\25\0X\26\5€\18\26\r\0\18\28\24\0\18\29\16\0B\26\3\1X\26\n€6\26\0\0009\26\1\26'\28:\0\18\29\24\0&\28\29\0286\29\0\0009\29\3\0299\29\4\0299\29\5\29B\26\3\1E\23\3\3R\23Þ\1276\20\0\0009\20\1\20'\22;\0006\23\0\0009\23\3\0239\23\4\0239\23\5\23B\20\3\0012\0\0€K\0\1\0K\0\1\0K\0\1\0\25All files processed.\29Skipping excluded file: \23Files to process: \finspect&Processing dataset with options: .Invalid YAML formatting options provided.!Error loading YAML options: \0\24YAML format input:  indent = 2, line_width = 80LEnter YAML formatting preferences (e.g., indent = 2, line_width = 80): \0\0\6p\nmkdir6Input path does not exist or is not a directory: \16isdirectory\27Resolved paths: input=\voutput\rabsolute\ninput\bnew\0\bsub\t/%*$\nmatch\n%:p:h\vexpand\afn\nDEBUG\r, depth=\14, output=\rtostring\24Parsed args: input=\vinsert\ntable\a-e\rtonumber\a-d\a-o\a-i\vipairs\6 \5\targs\nsplit8Error: lua-yaml is required for ProcessLargeDataset\tyaml\npcall,Plenary Path module loaded successfully\nERROR'Failed to load plenary.path module\17plenary.path\frequire\tINFO\vlevels\blog&Starting ProcessLargeDataset hook\vnotify\bvim\2Ÿ\a\1\0\r\0&\0@6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\t€6\1\2\0009\1\3\1'\3\4\0006\4\2\0009\4\5\0049\4\6\0049\4\a\4B\1\3\0012\0001€6\1\0\0'\3\b\0B\1\2\0026\2\t\0006\4\0\0'\5\n\0B\2\3\3\14\0\2\0X\4\b€6\4\2\0009\4\3\4'\6\v\0006\a\2\0009\a\5\a9\a\6\a9\a\f\aB\4\3\0016\4\0\0'\6\r\0B\4\2\0029\5\14\0045\a \0005\b\29\0005\t\18\0006\n\15\0009\n\16\n'\f\17\0B\n\2\2=\n\19\t5\n\20\0005\v\21\0=\v\22\n=\n\23\t5\n\25\0005\v\24\0=\v\26\n5\v\27\0=\v\28\n=\n\22\t=\t\30\b4\t\0\0=\t\31\b=\b!\a5\b#\0003\t\"\0=\t$\b=\b%\aB\5\2\1K\0\1\0K\0\1\0\nhooks\24ProcessLargeDataset\1\0\1\24ProcessLargeDataset\0\0\14providers\1\0\3\nhooks\0\14providers\0\18user_input_ui\vnative\vollama\14anthropic\1\0\2\vollama\0\14anthropic\0\fcommand\1\0\1\15max_tokens\3€ \tchat\1\0\2\tchat\0\fcommand\0\1\0\1\15max_tokens\3€ \ntopic\vparams\1\0\1\15max_tokens\3 \1\0\2\vparams\0\nmodel\28claude-3-haiku-20240307\fapi_key\1\0\5\fapi_key\0\rendpoint*https://api.anthropic.com/v1/messages\vparams\0\ntopic\0\17topic_promptKYou only respond with 3 to 4 words to summarize the past conversation.\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\tWARNDWarning: lua-yaml not found. Some functionality may be limited.\tyaml\npcall\20plenary.scandir\nERROR\vlevels\blog'Failed to load plenary.path module\vnotify\bvim\17plenary.path\frequire\0" },
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/parrot.nvim",
    url = "https://github.com/frankroeder/parrot.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["seoul256.vim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-heading.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toast.vim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/toast.vim",
    url = "https://github.com/jsit/toast.vim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-jukit"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/vim-jukit",
    url = "https://github.com/luk400/vim-jukit"
  },
  ["vim-latex-live-preview"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/opt/vim-latex-live-preview",
    url = "https://github.com/xuhdev/vim-latex-live-preview"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  vimtex = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["w3m.vim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/w3m.vim",
    url = "https://github.com/yuratomo/w3m.vim"
  },
  yui = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/yui",
    url = "https://github.com/cideM/yui"
  },
  ["zhaw-snippets"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/zhaw-snippets",
    url = "https://github.com/InES-HPMM/zhaw-snippets"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: parrot.nvim
time([[Config for parrot.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\2\6\1\2\0\17\15\0\0\0X\2\14€-\2\0\0\18\4\2\0009\2\0\2\18\5\0\0B\2\3\2\15\0\2\0X\3\5€\18\5\2\0009\3\1\2B\3\2\2\14\0\3\0X\4\1€\18\3\1\0L\3\2\0L\1\2\0\2À\rabsolute\bnew÷\6\0\2\19\1#\1\1276\2\0\0009\2\1\2'\4\2\0006\5\3\0\18\a\1\0B\5\2\2&\4\5\0046\5\0\0009\5\4\0059\5\5\0059\5\6\5B\2\3\0016\2\a\0-\4\0\0009\4\b\0045\5\t\0=\0\n\5-\6\0\0009\6\v\0069\6\f\0069\6\r\0066\a\14\0+\b\0\0006\t\15\0B\2\a\3\15\0\2\0X\4\4€\15\0\3\0X\4\2€\a\3\16\0X\4?€6\4\0\0009\4\1\4'\6\17\0006\a\0\0009\a\4\a9\a\5\a9\a\18\aB\4\3\1'\4\19\0004\5\0\0\18\b\0\0009\6\20\0'\t\21\0B\6\3\4X\t\5€6\n\22\0009\n\23\n\18\f\5\0\18\r\t\0B\n\3\1E\t\3\2R\tù\127'\6\16\0)\a\0\0006\b\24\0\18\n\5\0B\b\2\4X\v\17€\5\f\6\0X\r\2€\22\a\0\aX\r\r€)\r\0\0\1\r\a\0X\r\b€\18\r\4\0006\14\25\0009\14\26\14'\16\27\0\18\17\6\0\22\18\0\aB\14\4\2&\4\14\r\18\6\f\0)\a\0\0E\v\3\3R\ví\127)\b\0\0\1\b\a\0X\b\b€\18\b\4\0006\t\25\0009\t\26\t'\v\27\0\18\f\6\0\22\r\0\aB\t\4\2&\4\t\b\18\b\4\0'\t\28\0&\b\t\b+\t\2\0J\b\3\0006\4\29\0\18\6\3\0B\4\2\2\a\4\25\0X\4\17€\18\6\3\0009\4\30\3'\a\31\0B\4\3\2\15\0\4\0X\5\b€\18\6\3\0009\4 \3'\a\31\0'\b\16\0B\4\4\2+\5\2\0J\4\3\0X\4\3€\18\4\3\0+\5\1\0J\4\3\0006\4\0\0009\4\1\4'\6!\0006\a\0\0009\a\4\a9\a\5\a9\a\"\aB\4\3\1+\4\0\0+\5\2\0J\4\3\0\4\0\nERROR&Unexpected result from processing\tgsub\f# EOF\n$\nmatch\ttype\f\n# EOF\n   - %s (repeated %d times)\n\vformat\vstring\vipairs\vinsert\ntable\v[^\r\n]+\vgmatch\14summary:\n\tWARNMAI processing failed or returned empty result, using fallback processing\5\rtemplate\14model_obj\npopup\vTarget\aui\targs\1\0\1\targs\0\vPrompt\npcall\nDEBUG\vlevels\blog\rtostring%Processing chunk, continuation: \vnotify\bvim\2¡\14\1\2\19\5.\0›\0026\2\0\0009\2\1\2'\4\2\0\18\5\0\0&\4\5\0046\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\1+\2\0\0006\3\6\0009\3\a\3\18\5\0\0'\6\b\0B\3\3\2\14\0\3\0X\4\v€6\4\0\0009\4\1\4'\6\t\0\18\a\0\0&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\n\aB\4\3\0012\0ø€\18\6\3\0009\4\v\3'\a\f\0B\4\3\2\18\2\4\0\18\6\3\0009\4\r\3B\4\2\1\15\0\2\0X\3\2€\a\2\14\0X\3\v€6\3\0\0009\3\1\3'\5\15\0\18\6\0\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\16\6B\3\3\0012\0â€6\3\0\0009\3\1\3'\5\17\0\21\6\2\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\0016\3\0\0009\3\1\3'\5\19\0\18\6\0\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\0016\3\0\0009\3\1\3'\5\20\0006\6\21\0-\b\0\0B\6\2\2&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\0016\3\0\0009\3\1\3'\5\22\0006\6\21\0-\b\1\0B\6\2\2&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\18\6B\3\3\1-\3\2\0\18\5\3\0009\3\23\3\18\6\0\0B\3\3\2\18\5\3\0009\3\24\3-\6\0\0B\3\3\0026\4\0\0009\4\1\4'\6\25\0006\a\21\0\18\t\3\0B\a\2\2&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\18\aB\4\3\1\14\0\3\0X\4\v€6\4\0\0009\4\1\4'\6\26\0\18\a\0\0&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\n\aB\4\3\0012\0•€-\4\2\0\18\6\4\0009\4\23\4-\a\1\0\18\b\3\0B\4\4\0026\5\0\0009\5\1\5'\a\27\0006\b\21\0\18\n\4\0B\b\2\2&\a\b\a6\b\0\0009\b\3\b9\b\4\b9\b\18\bB\5\3\1\14\0\4\0X\5\t€6\5\0\0009\5\1\5'\a\28\0006\b\0\0009\b\3\b9\b\4\b9\b\n\bB\5\3\0012\0y€6\5\21\0\18\a\4\0B\5\2\2'\6\29\0&\5\6\0056\6\0\0009\6\1\6'\b\30\0\18\t\5\0&\b\t\b6\t\0\0009\t\3\t9\t\4\t9\t\18\tB\6\3\1-\6\2\0\18\b\6\0009\6\23\6\18\t\5\0B\6\3\2\18\4\6\0\14\0\4\0X\6\t€6\6\0\0009\6\1\6'\b\31\0006\t\0\0009\t\3\t9\t\4\t9\t\n\tB\6\3\0012\0Z€6\6\0\0009\6\1\6'\b \0006\t\21\0\18\v\4\0B\t\2\2&\b\t\b6\t\0\0009\t\3\t9\t\4\t9\t\18\tB\6\3\0016\6\6\0009\6\a\0066\b\21\0\18\n\4\0B\b\2\2'\t!\0B\6\3\2\14\0\6\0X\a\r€6\a\0\0009\a\1\a'\t\"\0006\n\21\0\18\f\4\0B\n\2\2&\t\n\t6\n\0\0009\n\3\n9\n\4\n9\n\n\nB\a\3\0012\0009€\18\t\6\0009\a#\6'\n$\0B\a\3\1\18\t\6\0009\a#\6B\a\2\2)\b\0\0\0\b\a\0X\b\2€+\b\1\0X\t\1€+\b\2\0-\t\3\0009\t%\t\14\0\t\0X\n\5€6\t\0\0009\t&\t9\t'\t'\v(\0B\t\2\2\a\t\14\0X\n\t€6\n\0\0009\n\1\n'\f)\0006\r\0\0009\r\3\r9\r\4\r9\r\16\rB\n\3\1'\t*\0003\n+\0\18\r\6\0009\v\r\6B\v\2\0016\v\0\0009\v\1\v'\r,\0\18\14\0\0'\15-\0006\16\21\0\18\18\4\0B\16\2\2&\r\16\r6\14\0\0009\14\3\0149\14\4\0149\14\5\14B\v\3\1K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0\6€\a€\2À\1À\0À\19 and saved to \15Processed \0\fcontent9No YAML structure provided. Using default structure.BEnter desired YAML structure (e.g., summary, details, etc.): \ninput\afn\19yaml_structure\bend\tseek!Failed to open output file: \aa+\29Final output file path: 7Failed to create new Path object with .yaml suffix#Output file path with suffix: \n.yaml&Failed to create output file path\23Output file path: )Failed to create relative path for: \20Relative path: \18make_relative\bnew\18Output path: \rtostring\17Input path: \16File path: \nDEBUG\26File content length: \tWARN(File is empty or couldn't be read: \5\nclose\t*all\tread\nERROR Failed to open input file: \6r\topen\aio\tINFO\vlevels\blog\22Processing file: \vnotify\bvimŠ\3\0\0\6\2\14\2>6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\0039\3\5\3B\0\3\1-\0\0\0\14\0\0\0X\1\t€6\0\0\0009\0\6\0009\0\a\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\v€6\0\0\0009\0\6\0009\0\t\0006\2\b\0-\4\1\0B\2\2\2'\3\n\0+\4\1\0+\5\2\0D\0\5\0X\0\30€6\0\0\0009\0\6\0009\0\v\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\a€4\0\3\0006\1\b\0-\3\1\0B\1\2\0?\1\1\0L\0\2\0X\0\14€6\0\0\0009\0\1\0'\2\f\0006\3\b\0-\5\1\0B\3\2\2&\2\3\0026\3\0\0009\3\3\0039\3\4\0039\3\r\3B\0\3\0014\0\0\0L\0\2\0K\0\1\0\vÀ\6€\nERROR\25Invalid input path: \17filereadable\6*\rglobpath\rtostring\16isdirectory\afn\nDEBUG\vlevels\blog\29Getting files to process\vnotify\bvim\2\3€€À™\4¸\1\0\0\t\1\t\0\23-\0\0\0\18\2\0\0009\0\0\0'\3\1\0'\4\2\0B\0\4\0026\1\3\0'\3\4\0\18\4\0\0'\5\5\0&\3\5\3B\1\2\3\14\0\1\0X\3\a€6\3\6\0'\5\a\0006\6\b\0\18\b\2\0B\6\2\2&\5\6\5B\3\2\1\18\3\1\0D\3\1\0\15À\rtostring#Failed to parse YAML options: \nerror\6}\rreturn {\tload\n%1 = \14(%w+):%s*\tgsubÀ\17\1\2#\0<\1é\0026\2\0\0009\2\1\2'\4\2\0006\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\0016\2\6\0'\4\a\0B\2\2\2\14\0\2\0X\3\t€6\3\0\0009\3\1\3'\5\b\0006\6\0\0009\6\3\0069\6\4\0069\6\t\6B\3\3\0012\0Q6\3\0\0009\3\1\3'\5\n\0006\6\0\0009\6\3\0069\6\4\0069\6\5\6B\3\3\0016\3\v\0006\5\6\0'\6\f\0B\3\3\3\14\0\3\0X\5\t€6\5\0\0009\5\1\5'\a\r\0006\b\0\0009\b\3\b9\b\4\b9\b\t\bB\5\3\0012\0;6\5\0\0009\5\14\0059\a\15\1\14\0\a\0X\b\1€'\a\16\0'\b\17\0B\5\3\2,\6\a\0)\b\1\0004\t\0\0006\n\18\0\18\f\5\0B\n\2\4X\r,€\a\14\19\0X\15\a€\22\15\0\r8\15\15\5\15\0\15\0X\16\3€\22\15\0\r8\6\15\5X\15#€\a\14\20\0X\15\a€\22\15\0\r8\15\15\5\15\0\15\0X\16\3€\22\15\0\r8\a\15\5X\15\26€\a\14\21\0X\15\f€\22\15\0\r8\15\15\5\15\0\15\0X\16\b€6\15\22\0\22\17\0\r8\17\17\5B\15\2\2\f\b\15\0X\16\1€)\b\1\0X\15\f€\a\14\23\0X\15\n€\22\15\0\r8\15\15\5\15\0\15\0X\16\6€6\15\24\0009\15\25\15\18\17\t\0\22\18\0\r8\18\18\5B\15\3\1E\r\3\3R\rÒ\1276\n\0\0009\n\1\n'\f\26\0006\r\27\0\18\15\6\0B\r\2\2'\14\28\0006\15\27\0\18\17\a\0B\15\2\2'\16\29\0006\17\27\0\18\19\b\0B\17\2\2&\f\17\f6\r\0\0009\r\3\r9\r\4\r9\r\30\rB\n\3\0016\n\0\0009\n\31\n9\n \n'\f!\0B\n\2\2\r\v\6\0X\v\4€\18\r\6\0009\v\"\6'\14#\0B\v\3\2\15\0\v\0X\f\6€\18\14\6\0009\f$\6)\15\1\0)\16þÿB\f\4\2\18\6\f\0003\f%\0\18\r\f\0\18\15\6\0\18\18\2\0009\16&\2\18\19\n\0'\20'\0B\16\4\2\18\18\16\0009\16(\16B\16\2\0A\r\1\2\18\6\r\0\18\r\f\0\18\15\a\0\18\18\2\0009\16&\2\18\19\n\0'\20)\0B\16\4\2\18\18\16\0009\16(\16B\16\2\0A\r\1\2\18\a\r\0006\r\0\0009\r\1\r'\15*\0006\16\27\0\18\18\6\0B\16\2\2'\17\28\0006\18\27\0\18\20\a\0B\18\2\2&\15\18\0156\16\0\0009\16\3\0169\16\4\0169\16\30\16B\r\3\1\15\0\6\0X\r\n€6\r\0\0009\r\31\r9\r+\r6\15\27\0\18\17\6\0B\15\2\0A\r\0\2\19\r\r\0\t\r\0\0X\r\14€6\r\0\0009\r\1\r'\15,\0006\16\27\0\18\18\6\0B\16\2\2&\15\16\0156\16\0\0009\16\3\0169\16\4\0169\16\t\16B\r\3\0012\0\0€K\0\1\0\15\0\a\0X\r\t€6\r\0\0009\r\31\r9\r+\r6\15\27\0\18\17\a\0B\15\2\0A\r\0\2\b\r\0\0X\r\b€6\r\0\0009\r\31\r9\r-\r6\15\27\0\18\17\a\0B\15\2\2'\16.\0B\r\3\0013\r/\0003\0140\0006\15\0\0009\15\31\0159\15'\15'\0171\0'\0182\0B\15\3\0026\16\0\0009\16\1\16'\0183\0\18\19\15\0&\18\19\0186\19\0\0009\19\3\0199\19\4\0199\19\30\19B\16\3\1+\16\0\0006\17\v\0003\0194\0B\17\2\3\15\0\17\0X\19\2€\18\16\18\0X\19\14€6\19\0\0009\19\1\19'\0215\0006\22\27\0\18\24\18\0B\22\2\2&\21\22\0216\22\0\0009\22\3\0229\22\4\0229\22\t\22B\19\3\0012\0\0€K\0\1\0\v\16\0\0X\19\n€6\19\0\0009\19\1\19'\0216\0006\22\0\0009\22\3\0229\22\4\0229\22\t\22B\19\3\0012\0\0€K\0\1\0006\19\0\0009\19\1\19'\0217\0006\22\0\0009\0228\22\18\24\16\0B\22\2\2&\21\22\0216\22\0\0009\22\3\0229\22\4\0229\22\5\22B\19\3\1\18\19\14\0B\19\1\0026\20\0\0009\20\1\20'\0229\0006\23\0\0009\0238\23\18\25\19\0B\23\2\2&\22\23\0226\23\0\0009\23\3\0239\23\4\0239\23\30\23B\20\3\0016\20\18\0\18\22\19\0B\20\2\4X\23 €+\25\2\0006\26\18\0\18\28\t\0B\26\2\4X\29\b€\18!\24\0009\31\"\24\18\"\30\0B\31\3\2\15\0\31\0X \2€+\25\1\0X\26\2€E\29\3\3R\29ö\127\15\0\25\0X\26\5€\18\26\r\0\18\28\24\0\18\29\16\0B\26\3\1X\26\n€6\26\0\0009\26\1\26'\28:\0\18\29\24\0&\28\29\0286\29\0\0009\29\3\0299\29\4\0299\29\5\29B\26\3\1E\23\3\3R\23Þ\1276\20\0\0009\20\1\20'\22;\0006\23\0\0009\23\3\0239\23\4\0239\23\5\23B\20\3\0012\0\0€K\0\1\0K\0\1\0K\0\1\0\25All files processed.\29Skipping excluded file: \23Files to process: \finspect&Processing dataset with options: .Invalid YAML formatting options provided.!Error loading YAML options: \0\24YAML format input:  indent = 2, line_width = 80LEnter YAML formatting preferences (e.g., indent = 2, line_width = 80): \0\0\6p\nmkdir6Input path does not exist or is not a directory: \16isdirectory\27Resolved paths: input=\voutput\rabsolute\ninput\bnew\0\bsub\t/%*$\nmatch\n%:p:h\vexpand\afn\nDEBUG\r, depth=\14, output=\rtostring\24Parsed args: input=\vinsert\ntable\a-e\rtonumber\a-d\a-o\a-i\vipairs\6 \5\targs\nsplit8Error: lua-yaml is required for ProcessLargeDataset\tyaml\npcall,Plenary Path module loaded successfully\nERROR'Failed to load plenary.path module\17plenary.path\frequire\tINFO\vlevels\blog&Starting ProcessLargeDataset hook\vnotify\bvim\2Ÿ\a\1\0\r\0&\0@6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\t€6\1\2\0009\1\3\1'\3\4\0006\4\2\0009\4\5\0049\4\6\0049\4\a\4B\1\3\0012\0001€6\1\0\0'\3\b\0B\1\2\0026\2\t\0006\4\0\0'\5\n\0B\2\3\3\14\0\2\0X\4\b€6\4\2\0009\4\3\4'\6\v\0006\a\2\0009\a\5\a9\a\6\a9\a\f\aB\4\3\0016\4\0\0'\6\r\0B\4\2\0029\5\14\0045\a \0005\b\29\0005\t\18\0006\n\15\0009\n\16\n'\f\17\0B\n\2\2=\n\19\t5\n\20\0005\v\21\0=\v\22\n=\n\23\t5\n\25\0005\v\24\0=\v\26\n5\v\27\0=\v\28\n=\n\22\t=\t\30\b4\t\0\0=\t\31\b=\b!\a5\b#\0003\t\"\0=\t$\b=\b%\aB\5\2\1K\0\1\0K\0\1\0\nhooks\24ProcessLargeDataset\1\0\1\24ProcessLargeDataset\0\0\14providers\1\0\3\nhooks\0\14providers\0\18user_input_ui\vnative\vollama\14anthropic\1\0\2\vollama\0\14anthropic\0\fcommand\1\0\1\15max_tokens\3€ \tchat\1\0\2\tchat\0\fcommand\0\1\0\1\15max_tokens\3€ \ntopic\vparams\1\0\1\15max_tokens\3 \1\0\2\vparams\0\nmodel\28claude-3-haiku-20240307\fapi_key\1\0\5\fapi_key\0\rendpoint*https://api.anthropic.com/v1/messages\vparams\0\ntopic\0\17topic_promptKYou only respond with 3 to 4 words to summarize the past conversation.\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\tWARNDWarning: lua-yaml not found. Some functionality may be limited.\tyaml\npcall\20plenary.scandir\nERROR\vlevels\blog'Failed to load plenary.path module\vnotify\bvim\17plenary.path\frequire\0", "config", "parrot.nvim")
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
