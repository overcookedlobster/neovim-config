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
    config = { "\27LJ\2\nZ\0\2\6\1\2\0\17\15\0\0\0X\2\14Ä-\2\0\0\18\4\2\0009\2\0\2\18\5\0\0B\2\3\2\15\0\2\0X\3\5Ä\18\5\2\0009\3\1\2B\3\2\2\14\0\3\0X\4\1Ä\18\3\1\0L\3\2\0L\1\2\0\2¿\rabsolute\bnew„\b\0\2\f\1\30\0r6\2\0\0009\2\1\2'\4\2\0006\5\3\0\18\a\1\0B\5\2\2&\4\5\0046\5\0\0009\5\4\0059\5\5\0059\5\6\5B\2\3\1'\2\a\0\15\0\1\0X\3\3Ä'\3\b\0\18\4\2\0&\2\4\3-\3\0\0009\3\t\3'\5\n\0B\3\2\2\14\0\3\0X\4\vÄ6\4\0\0009\4\1\4'\6\v\0006\a\0\0009\a\4\a9\a\5\a9\a\f\aB\4\3\1+\4\0\0+\5\2\0J\4\3\0006\4\0\0009\4\1\4'\6\r\0006\a\0\0009\a\4\a9\a\5\a9\a\6\aB\4\3\0016\4\14\0-\6\0\0009\6\15\6B\4\2\2\6\4\16\0X\4\16Ä6\4\0\0009\4\1\4'\6\17\0006\a\14\0-\t\0\0009\t\15\tB\a\2\2&\6\a\0066\a\0\0009\a\4\a9\a\5\a9\a\f\aB\4\3\1+\4\0\0+\5\2\0J\4\3\0006\4\18\0-\6\0\0009\6\15\0065\a\19\0=\0\20\a-\b\0\0009\b\21\b9\b\22\b9\b\23\b\18\t\3\0+\n\0\0\18\v\2\0B\4\a\3\14\0\4\0X\6\15Ä6\6\0\0009\6\1\6'\b\24\0006\t\3\0\18\v\5\0B\t\2\2&\b\t\b6\t\0\0009\t\4\t9\t\5\t9\t\f\tB\6\3\1+\6\0\0+\a\2\0J\6\3\0006\6\25\0009\6\26\6\18\b\5\0'\t\27\0B\6\3\2\15\0\6\0X\a\bÄ\18\b\5\0009\6\28\5'\t\27\0'\n\29\0B\6\4\2+\a\2\0J\6\3\0X\6\3Ä\18\6\5\0+\a\1\0J\6\3\0K\0\1\0\3\0\5\tgsub\f# EOF\n$\nmatch\vstring\26Error in prt.Prompt: \npopup\vTarget\aui\targs\1\0\1\targs\0\npcall0Error: prt.Prompt is not a function. Type: \rfunction\vPrompt\ttype\23Calling prt.Prompt\nERROR Failed to get command model\fcommand\14get_model-Continue processing where you left off:\n…\2                Process the following content and produce a YAML output. \n                If this is a continuation, append to the existing structure.\n                Content:\n                {{content}}\n                \n                Produce YAML output below. End with \"# EOF\" on a new line when complete:\n              \nDEBUG\vlevels\blog\rtostring%Processing chunk, continuation: \vnotify\bvim≈\14\1\2\24\0050\0π\0026\2\0\0009\2\1\2'\4\2\0\18\5\0\0&\4\5\0046\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\0016\2\6\0009\2\a\2\18\4\0\0'\5\b\0B\2\3\2\14\0\2\0X\3\vÄ6\3\0\0009\3\1\3'\5\t\0\18\6\0\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\n\6B\3\3\0012\0\24Å\18\5\2\0009\3\v\2'\6\f\0B\3\3\2\18\6\2\0009\4\r\2B\4\2\0016\4\0\0009\4\1\4'\6\14\0\18\a\0\0&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\15\aB\4\3\0016\4\0\0009\4\1\4'\6\16\0006\a\17\0-\t\0\0B\a\2\2&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\15\aB\4\3\0016\4\0\0009\4\1\4'\6\18\0006\a\17\0-\t\1\0B\a\2\2&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\15\aB\4\3\1-\4\2\0\18\6\4\0009\4\19\4\18\a\0\0B\4\3\2\18\6\4\0009\4\20\4-\a\0\0B\4\3\0026\5\0\0009\5\1\5'\a\21\0006\b\17\0\18\n\4\0B\b\2\2&\a\b\a6\b\0\0009\b\3\b9\b\4\b9\b\15\bB\5\3\1\14\0\4\0X\5\vÄ6\5\0\0009\5\1\5'\a\22\0\18\b\0\0&\a\b\a6\b\0\0009\b\3\b9\b\4\b9\b\n\bB\5\3\0012\0ŒÄ-\5\2\0\18\a\5\0009\5\19\5-\b\1\0\18\t\4\0B\5\4\0026\6\0\0009\6\1\6'\b\23\0006\t\17\0\18\v\5\0B\t\2\2&\b\t\b6\t\0\0009\t\3\t9\t\4\t9\t\15\tB\6\3\1\14\0\5\0X\6\tÄ6\6\0\0009\6\1\6'\b\24\0006\t\0\0009\t\3\t9\t\4\t9\t\n\tB\6\3\0012\0≤Ä6\6\17\0\18\b\5\0B\6\2\2'\a\25\0&\6\a\0066\a\0\0009\a\1\a'\t\26\0\18\n\6\0&\t\n\t6\n\0\0009\n\3\n9\n\4\n9\n\15\nB\a\3\1-\a\2\0\18\t\a\0009\a\19\a\18\n\6\0B\a\3\2\18\5\a\0\14\0\5\0X\a\tÄ6\a\0\0009\a\1\a'\t\27\0006\n\0\0009\n\3\n9\n\4\n9\n\n\nB\a\3\0012\0ìÄ6\a\0\0009\a\1\a'\t\28\0006\n\17\0\18\f\5\0B\n\2\2&\t\n\t6\n\0\0009\n\3\n9\n\4\n9\n\15\nB\a\3\0016\a\6\0009\a\a\a6\t\17\0\18\v\5\0B\t\2\2'\n\29\0B\a\3\2\14\0\a\0X\b\rÄ6\b\0\0009\b\1\b'\n\30\0006\v\17\0\18\r\5\0B\v\2\2&\n\v\n6\v\0\0009\v\3\v9\v\4\v9\v\n\vB\b\3\0012\0rÄ\18\n\a\0009\b\31\a'\v \0B\b\3\1\18\n\a\0009\b\31\aB\b\2\2)\t\0\0\0\t\b\0X\t\2Ä+\t\1\0X\n\1Ä+\t\2\0003\n!\0+\v\1\0\14\0\v\0X\fKÄU\fJÄ\18\f\n\0\18\14\3\0\18\15\t\0B\f\3\3\14\0\f\0X\14\tÄ6\14\0\0009\14\1\14'\16\"\0006\17\0\0009\17\3\0179\17\4\0179\17\n\17B\14\3\1X\f;Ä\15\0\t\0X\14\4Ä\18\16\a\0009\14#\a'\17$\0B\14\3\0016\14%\0-\16\4\0009\16&\16\18\17\f\0B\14\3\3\15\0\14\0X\16\aÄ-\16\4\0009\16'\16\18\18\15\0\18\19\1\0B\16\3\2\18\f\16\0X\16\14Ä6\16\0\0009\16\1\16'\18(\0\18\19\0\0'\20)\0006\21\17\0\18\23\15\0B\21\2\2&\18\21\0186\19\0\0009\19\3\0199\19\4\0199\19\n\19B\16\3\1\18\18\a\0009\16#\a\18\19\f\0B\16\3\1\18\v\r\0+\t\2\0\14\0\v\0X\16ƒ\1276\16\0\0009\16\1\16'\18*\0\18\19\0\0'\20+\0&\18\20\0186\19\0\0009\19\3\0199\19\4\0199\19\5\19B\16\3\0016\16\0\0009\16,\0169\16-\16)\18Ë\3B\16\2\1X\f≥\127\18\14\a\0009\f\r\aB\f\2\0016\f\0\0009\f\1\f'\14.\0\18\15\0\0'\16/\0006\17\17\0\18\19\5\0B\17\2\2&\14\17\0146\15\0\0009\15\3\0159\15\4\0159\15\5\15B\f\3\1K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0\4Ä\5Ä\2¿\0¿\1\0\19 and saved to \15Processed \nsleep\tloop\20. Continuing...\27Output incomplete for \a: \30Failed to parse YAML for \tdump\tload\npcall\6\n\nwrite\28Failed to process chunk\0\bend\tseek!Failed to open output file: \aa+\29Final output file path: 7Failed to create new Path object with .yaml suffix#Output file path with suffix: \n.yaml&Failed to create output file path\23Output file path: )Failed to create relative path for: \20Relative path: \18make_relative\bnew\18Output path: \rtostring\17Input path: \nDEBUG\16File path: \nclose\t*all\tread\nERROR Failed to open input file: \6r\topen\aio\tINFO\vlevels\blog\22Processing file: \vnotify\bvim¢\3\0\0\6\4\15\2=6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\0039\3\5\3B\0\3\1-\0\0\0\14\0\0\0X\1\tÄ6\0\0\0009\0\6\0009\0\a\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\nÄ-\0\2\0009\0\t\0006\2\b\0-\4\1\0B\2\2\0025\3\n\0-\4\3\0=\4\v\3D\0\3\0X\0\30Ä6\0\0\0009\0\6\0009\0\f\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\aÄ4\0\3\0006\1\b\0-\3\1\0B\1\2\0?\1\1\0L\0\2\0X\0\14Ä6\0\0\0009\0\1\0'\2\r\0006\3\b\0-\5\1\0B\3\2\2&\2\3\0026\3\0\0009\3\3\0039\3\4\0039\3\14\3B\0\3\0014\0\0\0L\0\2\0K\0\1\0\t¿\4Ä\2\0\6Ä\nERROR\25Invalid input path: \17filereadable\ndepth\1\0\2\radd_dirs\1\ndepth\0\rscan_dir\rtostring\16isdirectory\afn\nDEBUG\vlevels\blog\29Getting files to process\vnotify\bvim\2\3ÄÄ¿ô\4æ\1\0\0\t\1\t\0\23-\0\0\0\18\2\0\0009\0\0\0'\3\1\0'\4\2\0B\0\4\0026\1\3\0'\3\4\0\18\4\0\0'\5\5\0&\3\5\3B\1\2\3\14\0\1\0X\3\aÄ6\3\6\0'\5\a\0006\6\b\0\18\b\2\0B\6\2\2&\5\6\5B\3\2\1\18\3\1\0D\3\1\0\r¿\rtostring#Failed to parse YAML options: \nerror\6}\rreturn {\15loadstring\n%1 = \14(%w+):%s*\tgsub›\17\1\2!\3;\1\0026\2\0\0009\2\1\2'\4\2\0006\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\0016\2\6\0'\4\a\0B\2\2\2\14\0\2\0X\3\tÄ6\3\0\0009\3\1\3'\5\b\0006\6\0\0009\6\3\0069\6\4\0069\6\t\6B\3\3\0012\0XÅ6\3\0\0009\3\1\3'\5\n\0006\6\0\0009\6\3\0069\6\4\0069\6\5\6B\3\3\1-\3\0\0\14\0\3\0X\3\tÄ6\3\0\0009\3\1\3'\5\v\0006\6\0\0009\6\3\0069\6\4\0069\6\t\6B\3\3\0012\0EÅ6\3\0\0009\3\f\0039\5\r\1\14\0\5\0X\6\1Ä'\5\14\0'\6\15\0B\3\3\2,\4\5\0)\6\1\0004\a\0\0006\b\16\0\18\n\3\0B\b\2\4X\v,Ä\a\f\17\0X\r\aÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\3Ä\22\r\0\v8\4\r\3X\r#Ä\a\f\18\0X\r\aÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\3Ä\22\r\0\v8\5\r\3X\r\26Ä\a\f\19\0X\r\fÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\bÄ6\r\20\0\22\15\0\v8\15\15\3B\r\2\2\f\6\r\0X\14\1Ä)\6\1\0X\r\fÄ\a\f\21\0X\r\nÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\6Ä6\r\22\0009\r\23\r\18\15\a\0\22\16\0\v8\16\16\3B\r\3\1E\v\3\3R\v“\1276\b\0\0009\b\1\b'\n\24\0006\v\25\0\18\r\4\0B\v\2\2'\f\26\0006\r\25\0\18\15\5\0B\r\2\2'\14\27\0006\15\25\0\18\17\6\0B\15\2\2&\n\15\n6\v\0\0009\v\3\v9\v\4\v9\v\28\vB\b\3\0016\b\0\0009\b\29\b9\b\30\b'\n\31\0B\b\2\2\r\t\4\0X\t\4Ä\18\v\4\0009\t \4'\f!\0B\t\3\2\15\0\t\0X\n\6Ä\18\f\4\0009\n\"\4)\r\1\0)\14˛ˇB\n\4\2\18\4\n\0003\n#\0\18\v\n\0\18\r\4\0\18\16\2\0009\14$\2\18\17\b\0'\18%\0B\14\4\2\18\16\14\0009\14&\14B\14\2\0A\v\1\2\18\4\v\0\18\v\n\0\18\r\5\0\18\16\2\0009\14$\2\18\17\b\0'\18'\0B\14\4\2\18\16\14\0009\14&\14B\14\2\0A\v\1\2\18\5\v\0006\v\0\0009\v\1\v'\r(\0006\14\25\0\18\16\4\0B\14\2\2'\15\26\0006\16\25\0\18\18\5\0B\16\2\2&\r\16\r6\14\0\0009\14\3\0149\14\4\0149\14\28\14B\v\3\1\15\0\4\0X\v\nÄ6\v\0\0009\v\29\v9\v)\v6\r\25\0\18\15\4\0B\r\2\0A\v\0\2\19\v\v\0\t\v\0\0X\v\14Ä6\v\0\0009\v\1\v'\r*\0006\14\25\0\18\16\4\0B\14\2\2&\r\14\r6\14\0\0009\14\3\0149\14\4\0149\14\t\14B\v\3\0012\0\0ÄK\0\1\0\15\0\5\0X\v\tÄ6\v\0\0009\v\29\v9\v)\v6\r\25\0\18\15\5\0B\r\2\0A\v\0\2\b\v\0\0X\v\bÄ6\v\0\0009\v\29\v9\v+\v6\r\25\0\18\15\5\0B\r\2\2'\14,\0B\v\3\0013\v-\0003\f.\0006\r\0\0009\r\29\r9\r%\r'\15/\0'\0160\0B\r\3\0026\14\0\0009\14\1\14'\0161\0\18\17\r\0&\16\17\0166\17\0\0009\17\3\0179\17\4\0179\17\28\17B\14\3\0016\14\0\0009\14\1\14'\0161\0\18\17\r\0&\16\17\0166\17\0\0009\17\3\0179\17\4\0179\17\28\17B\14\3\1+\14\0\0006\0152\0003\0173\0B\15\2\3\15\0\15\0X\17\2Ä\18\14\16\0X\17\14Ä6\17\0\0009\17\1\17'\0194\0006\20\25\0\18\22\16\0B\20\2\2&\19\20\0196\20\0\0009\20\3\0209\20\4\0209\20\t\20B\17\3\0012\0\0ÄK\0\1\0\v\14\0\0X\17\nÄ6\17\0\0009\17\1\17'\0195\0006\20\0\0009\20\3\0209\20\4\0209\20\t\20B\17\3\0012\0\0ÄK\0\1\0006\17\0\0009\17\1\17'\0196\0006\20\0\0009\0207\20\18\22\14\0B\20\2\2&\19\20\0196\20\0\0009\20\3\0209\20\4\0209\20\5\20B\17\3\1\18\17\f\0B\17\1\0026\18\0\0009\18\1\18'\0208\0006\21\0\0009\0217\21\18\23\17\0B\21\2\2&\20\21\0206\21\0\0009\21\3\0219\21\4\0219\21\28\21B\18\3\0016\18\16\0\18\20\17\0B\18\2\4X\21 Ä+\23\2\0006\24\16\0\18\26\a\0B\24\2\4X\27\bÄ\18\31\22\0009\29 \22\18 \28\0B\29\3\2\15\0\29\0X\30\2Ä+\23\1\0X\24\2ÄE\27\3\3R\27ˆ\127\15\0\23\0X\24\5Ä\18\24\v\0\18\26\22\0\18\27\14\0B\24\3\1X\24\nÄ6\24\0\0009\24\1\24'\0269\0\18\27\22\0&\26\27\0266\27\0\0009\27\3\0279\27\4\0279\27\5\27B\24\3\1E\21\3\3R\21ﬁ\1276\18\0\0009\18\1\18'\20:\0006\21\0\0009\21\3\0219\21\4\0219\21\5\21B\18\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\2¿\3¿\1¿\25All files processed.\29Skipping excluded file: \23Files to process: \finspect&Processing dataset with options: .Invalid YAML formatting options provided.!Error loading YAML options: \0\npcall\24YAML format input:  indent = 2, line_width = 80LEnter YAML formatting preferences (e.g., indent = 2, line_width = 80): \0\0\6p\nmkdir6Input path does not exist or is not a directory: \16isdirectory\27Resolved paths: input=\voutput\rabsolute\ninput\bnew\0\bsub\t/%*$\nmatch\n%:p:h\vexpand\afn\nDEBUG\r, depth=\14, output=\rtostring\24Parsed args: input=\vinsert\ntable\a-e\rtonumber\a-d\a-o\a-i\vipairs\6 \5\targs\nsplit8Error: lua-yaml is required for ProcessLargeDataset,Plenary Path module loaded successfully\nERROR'Failed to load plenary.path module\17plenary.path\frequire\tINFO\vlevels\blog&Starting ProcessLargeDataset hook\vnotify\bvim\2£\a\1\0\r\0&\0A6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\tÄ6\1\2\0009\1\3\1'\3\4\0006\4\2\0009\4\5\0049\4\6\0049\4\a\4B\1\3\0012\0002Ä6\1\0\0'\3\b\0B\1\2\0026\2\t\0006\4\0\0'\5\n\0B\2\3\3\14\0\2\0X\4\bÄ6\4\2\0009\4\3\4'\6\v\0006\a\2\0009\a\5\a9\a\6\a9\a\f\aB\4\3\0016\4\0\0'\6\r\0B\4\2\0029\5\14\0045\a \0005\b\29\0005\t\18\0006\n\15\0009\n\16\n'\f\17\0B\n\2\2=\n\19\t5\n\20\0005\v\21\0=\v\22\n=\n\23\t5\n\25\0005\v\24\0=\v\26\n5\v\27\0=\v\28\n=\n\22\t=\t\30\b4\t\0\0=\t\31\b=\b!\a5\b#\0003\t\"\0=\t$\b=\b%\aB\5\2\0012\0\0ÄK\0\1\0K\0\1\0\nhooks\24ProcessLargeDataset\1\0\1\24ProcessLargeDataset\0\0\14providers\1\0\3\18user_input_ui\vnative\nhooks\0\14providers\0\vollama\14anthropic\1\0\2\vollama\0\14anthropic\0\fcommand\1\0\1\15max_tokens\3Ä \tchat\1\0\2\tchat\0\fcommand\0\1\0\1\15max_tokens\3Ä \ntopic\vparams\1\0\1\15max_tokens\3 \1\0\2\vparams\0\nmodel\28claude-3-haiku-20240307\fapi_key\1\0\5\17topic_promptKYou only respond with 3 to 4 words to summarize the past conversation.\vparams\0\rendpoint*https://api.anthropic.com/v1/messages\fapi_key\0\ntopic\0\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\tWARNDWarning: lua-yaml not found. Some functionality may be limited.\tyaml\npcall\20plenary.scandir\nERROR\vlevels\blog'Failed to load plenary.path module\vnotify\bvim\17plenary.path\frequire\0" },
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
-- Config for: vim-jukit
time([[Config for vim-jukit]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-jukit")
time([[Config for vim-jukit]], false)
-- Config for: parrot.nvim
time([[Config for parrot.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\2\6\1\2\0\17\15\0\0\0X\2\14Ä-\2\0\0\18\4\2\0009\2\0\2\18\5\0\0B\2\3\2\15\0\2\0X\3\5Ä\18\5\2\0009\3\1\2B\3\2\2\14\0\3\0X\4\1Ä\18\3\1\0L\3\2\0L\1\2\0\2¿\rabsolute\bnew„\b\0\2\f\1\30\0r6\2\0\0009\2\1\2'\4\2\0006\5\3\0\18\a\1\0B\5\2\2&\4\5\0046\5\0\0009\5\4\0059\5\5\0059\5\6\5B\2\3\1'\2\a\0\15\0\1\0X\3\3Ä'\3\b\0\18\4\2\0&\2\4\3-\3\0\0009\3\t\3'\5\n\0B\3\2\2\14\0\3\0X\4\vÄ6\4\0\0009\4\1\4'\6\v\0006\a\0\0009\a\4\a9\a\5\a9\a\f\aB\4\3\1+\4\0\0+\5\2\0J\4\3\0006\4\0\0009\4\1\4'\6\r\0006\a\0\0009\a\4\a9\a\5\a9\a\6\aB\4\3\0016\4\14\0-\6\0\0009\6\15\6B\4\2\2\6\4\16\0X\4\16Ä6\4\0\0009\4\1\4'\6\17\0006\a\14\0-\t\0\0009\t\15\tB\a\2\2&\6\a\0066\a\0\0009\a\4\a9\a\5\a9\a\f\aB\4\3\1+\4\0\0+\5\2\0J\4\3\0006\4\18\0-\6\0\0009\6\15\0065\a\19\0=\0\20\a-\b\0\0009\b\21\b9\b\22\b9\b\23\b\18\t\3\0+\n\0\0\18\v\2\0B\4\a\3\14\0\4\0X\6\15Ä6\6\0\0009\6\1\6'\b\24\0006\t\3\0\18\v\5\0B\t\2\2&\b\t\b6\t\0\0009\t\4\t9\t\5\t9\t\f\tB\6\3\1+\6\0\0+\a\2\0J\6\3\0006\6\25\0009\6\26\6\18\b\5\0'\t\27\0B\6\3\2\15\0\6\0X\a\bÄ\18\b\5\0009\6\28\5'\t\27\0'\n\29\0B\6\4\2+\a\2\0J\6\3\0X\6\3Ä\18\6\5\0+\a\1\0J\6\3\0K\0\1\0\3\0\5\tgsub\f# EOF\n$\nmatch\vstring\26Error in prt.Prompt: \npopup\vTarget\aui\targs\1\0\1\targs\0\npcall0Error: prt.Prompt is not a function. Type: \rfunction\vPrompt\ttype\23Calling prt.Prompt\nERROR Failed to get command model\fcommand\14get_model-Continue processing where you left off:\n…\2                Process the following content and produce a YAML output. \n                If this is a continuation, append to the existing structure.\n                Content:\n                {{content}}\n                \n                Produce YAML output below. End with \"# EOF\" on a new line when complete:\n              \nDEBUG\vlevels\blog\rtostring%Processing chunk, continuation: \vnotify\bvim≈\14\1\2\24\0050\0π\0026\2\0\0009\2\1\2'\4\2\0\18\5\0\0&\4\5\0046\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\0016\2\6\0009\2\a\2\18\4\0\0'\5\b\0B\2\3\2\14\0\2\0X\3\vÄ6\3\0\0009\3\1\3'\5\t\0\18\6\0\0&\5\6\0056\6\0\0009\6\3\0069\6\4\0069\6\n\6B\3\3\0012\0\24Å\18\5\2\0009\3\v\2'\6\f\0B\3\3\2\18\6\2\0009\4\r\2B\4\2\0016\4\0\0009\4\1\4'\6\14\0\18\a\0\0&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\15\aB\4\3\0016\4\0\0009\4\1\4'\6\16\0006\a\17\0-\t\0\0B\a\2\2&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\15\aB\4\3\0016\4\0\0009\4\1\4'\6\18\0006\a\17\0-\t\1\0B\a\2\2&\6\a\0066\a\0\0009\a\3\a9\a\4\a9\a\15\aB\4\3\1-\4\2\0\18\6\4\0009\4\19\4\18\a\0\0B\4\3\2\18\6\4\0009\4\20\4-\a\0\0B\4\3\0026\5\0\0009\5\1\5'\a\21\0006\b\17\0\18\n\4\0B\b\2\2&\a\b\a6\b\0\0009\b\3\b9\b\4\b9\b\15\bB\5\3\1\14\0\4\0X\5\vÄ6\5\0\0009\5\1\5'\a\22\0\18\b\0\0&\a\b\a6\b\0\0009\b\3\b9\b\4\b9\b\n\bB\5\3\0012\0ŒÄ-\5\2\0\18\a\5\0009\5\19\5-\b\1\0\18\t\4\0B\5\4\0026\6\0\0009\6\1\6'\b\23\0006\t\17\0\18\v\5\0B\t\2\2&\b\t\b6\t\0\0009\t\3\t9\t\4\t9\t\15\tB\6\3\1\14\0\5\0X\6\tÄ6\6\0\0009\6\1\6'\b\24\0006\t\0\0009\t\3\t9\t\4\t9\t\n\tB\6\3\0012\0≤Ä6\6\17\0\18\b\5\0B\6\2\2'\a\25\0&\6\a\0066\a\0\0009\a\1\a'\t\26\0\18\n\6\0&\t\n\t6\n\0\0009\n\3\n9\n\4\n9\n\15\nB\a\3\1-\a\2\0\18\t\a\0009\a\19\a\18\n\6\0B\a\3\2\18\5\a\0\14\0\5\0X\a\tÄ6\a\0\0009\a\1\a'\t\27\0006\n\0\0009\n\3\n9\n\4\n9\n\n\nB\a\3\0012\0ìÄ6\a\0\0009\a\1\a'\t\28\0006\n\17\0\18\f\5\0B\n\2\2&\t\n\t6\n\0\0009\n\3\n9\n\4\n9\n\15\nB\a\3\0016\a\6\0009\a\a\a6\t\17\0\18\v\5\0B\t\2\2'\n\29\0B\a\3\2\14\0\a\0X\b\rÄ6\b\0\0009\b\1\b'\n\30\0006\v\17\0\18\r\5\0B\v\2\2&\n\v\n6\v\0\0009\v\3\v9\v\4\v9\v\n\vB\b\3\0012\0rÄ\18\n\a\0009\b\31\a'\v \0B\b\3\1\18\n\a\0009\b\31\aB\b\2\2)\t\0\0\0\t\b\0X\t\2Ä+\t\1\0X\n\1Ä+\t\2\0003\n!\0+\v\1\0\14\0\v\0X\fKÄU\fJÄ\18\f\n\0\18\14\3\0\18\15\t\0B\f\3\3\14\0\f\0X\14\tÄ6\14\0\0009\14\1\14'\16\"\0006\17\0\0009\17\3\0179\17\4\0179\17\n\17B\14\3\1X\f;Ä\15\0\t\0X\14\4Ä\18\16\a\0009\14#\a'\17$\0B\14\3\0016\14%\0-\16\4\0009\16&\16\18\17\f\0B\14\3\3\15\0\14\0X\16\aÄ-\16\4\0009\16'\16\18\18\15\0\18\19\1\0B\16\3\2\18\f\16\0X\16\14Ä6\16\0\0009\16\1\16'\18(\0\18\19\0\0'\20)\0006\21\17\0\18\23\15\0B\21\2\2&\18\21\0186\19\0\0009\19\3\0199\19\4\0199\19\n\19B\16\3\1\18\18\a\0009\16#\a\18\19\f\0B\16\3\1\18\v\r\0+\t\2\0\14\0\v\0X\16ƒ\1276\16\0\0009\16\1\16'\18*\0\18\19\0\0'\20+\0&\18\20\0186\19\0\0009\19\3\0199\19\4\0199\19\5\19B\16\3\0016\16\0\0009\16,\0169\16-\16)\18Ë\3B\16\2\1X\f≥\127\18\14\a\0009\f\r\aB\f\2\0016\f\0\0009\f\1\f'\14.\0\18\15\0\0'\16/\0006\17\17\0\18\19\5\0B\17\2\2&\14\17\0146\15\0\0009\15\3\0159\15\4\0159\15\5\15B\f\3\1K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0\4Ä\5Ä\2¿\0¿\1\0\19 and saved to \15Processed \nsleep\tloop\20. Continuing...\27Output incomplete for \a: \30Failed to parse YAML for \tdump\tload\npcall\6\n\nwrite\28Failed to process chunk\0\bend\tseek!Failed to open output file: \aa+\29Final output file path: 7Failed to create new Path object with .yaml suffix#Output file path with suffix: \n.yaml&Failed to create output file path\23Output file path: )Failed to create relative path for: \20Relative path: \18make_relative\bnew\18Output path: \rtostring\17Input path: \nDEBUG\16File path: \nclose\t*all\tread\nERROR Failed to open input file: \6r\topen\aio\tINFO\vlevels\blog\22Processing file: \vnotify\bvim¢\3\0\0\6\4\15\2=6\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\0039\3\5\3B\0\3\1-\0\0\0\14\0\0\0X\1\tÄ6\0\0\0009\0\6\0009\0\a\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\nÄ-\0\2\0009\0\t\0006\2\b\0-\4\1\0B\2\2\0025\3\n\0-\4\3\0=\4\v\3D\0\3\0X\0\30Ä6\0\0\0009\0\6\0009\0\f\0006\2\b\0-\4\1\0B\2\2\0A\0\0\2\t\0\0\0X\0\aÄ4\0\3\0006\1\b\0-\3\1\0B\1\2\0?\1\1\0L\0\2\0X\0\14Ä6\0\0\0009\0\1\0'\2\r\0006\3\b\0-\5\1\0B\3\2\2&\2\3\0026\3\0\0009\3\3\0039\3\4\0039\3\14\3B\0\3\0014\0\0\0L\0\2\0K\0\1\0\t¿\4Ä\2\0\6Ä\nERROR\25Invalid input path: \17filereadable\ndepth\1\0\2\radd_dirs\1\ndepth\0\rscan_dir\rtostring\16isdirectory\afn\nDEBUG\vlevels\blog\29Getting files to process\vnotify\bvim\2\3ÄÄ¿ô\4æ\1\0\0\t\1\t\0\23-\0\0\0\18\2\0\0009\0\0\0'\3\1\0'\4\2\0B\0\4\0026\1\3\0'\3\4\0\18\4\0\0'\5\5\0&\3\5\3B\1\2\3\14\0\1\0X\3\aÄ6\3\6\0'\5\a\0006\6\b\0\18\b\2\0B\6\2\2&\5\6\5B\3\2\1\18\3\1\0D\3\1\0\r¿\rtostring#Failed to parse YAML options: \nerror\6}\rreturn {\15loadstring\n%1 = \14(%w+):%s*\tgsub›\17\1\2!\3;\1\0026\2\0\0009\2\1\2'\4\2\0006\5\0\0009\5\3\0059\5\4\0059\5\5\5B\2\3\0016\2\6\0'\4\a\0B\2\2\2\14\0\2\0X\3\tÄ6\3\0\0009\3\1\3'\5\b\0006\6\0\0009\6\3\0069\6\4\0069\6\t\6B\3\3\0012\0XÅ6\3\0\0009\3\1\3'\5\n\0006\6\0\0009\6\3\0069\6\4\0069\6\5\6B\3\3\1-\3\0\0\14\0\3\0X\3\tÄ6\3\0\0009\3\1\3'\5\v\0006\6\0\0009\6\3\0069\6\4\0069\6\t\6B\3\3\0012\0EÅ6\3\0\0009\3\f\0039\5\r\1\14\0\5\0X\6\1Ä'\5\14\0'\6\15\0B\3\3\2,\4\5\0)\6\1\0004\a\0\0006\b\16\0\18\n\3\0B\b\2\4X\v,Ä\a\f\17\0X\r\aÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\3Ä\22\r\0\v8\4\r\3X\r#Ä\a\f\18\0X\r\aÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\3Ä\22\r\0\v8\5\r\3X\r\26Ä\a\f\19\0X\r\fÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\bÄ6\r\20\0\22\15\0\v8\15\15\3B\r\2\2\f\6\r\0X\14\1Ä)\6\1\0X\r\fÄ\a\f\21\0X\r\nÄ\22\r\0\v8\r\r\3\15\0\r\0X\14\6Ä6\r\22\0009\r\23\r\18\15\a\0\22\16\0\v8\16\16\3B\r\3\1E\v\3\3R\v“\1276\b\0\0009\b\1\b'\n\24\0006\v\25\0\18\r\4\0B\v\2\2'\f\26\0006\r\25\0\18\15\5\0B\r\2\2'\14\27\0006\15\25\0\18\17\6\0B\15\2\2&\n\15\n6\v\0\0009\v\3\v9\v\4\v9\v\28\vB\b\3\0016\b\0\0009\b\29\b9\b\30\b'\n\31\0B\b\2\2\r\t\4\0X\t\4Ä\18\v\4\0009\t \4'\f!\0B\t\3\2\15\0\t\0X\n\6Ä\18\f\4\0009\n\"\4)\r\1\0)\14˛ˇB\n\4\2\18\4\n\0003\n#\0\18\v\n\0\18\r\4\0\18\16\2\0009\14$\2\18\17\b\0'\18%\0B\14\4\2\18\16\14\0009\14&\14B\14\2\0A\v\1\2\18\4\v\0\18\v\n\0\18\r\5\0\18\16\2\0009\14$\2\18\17\b\0'\18'\0B\14\4\2\18\16\14\0009\14&\14B\14\2\0A\v\1\2\18\5\v\0006\v\0\0009\v\1\v'\r(\0006\14\25\0\18\16\4\0B\14\2\2'\15\26\0006\16\25\0\18\18\5\0B\16\2\2&\r\16\r6\14\0\0009\14\3\0149\14\4\0149\14\28\14B\v\3\1\15\0\4\0X\v\nÄ6\v\0\0009\v\29\v9\v)\v6\r\25\0\18\15\4\0B\r\2\0A\v\0\2\19\v\v\0\t\v\0\0X\v\14Ä6\v\0\0009\v\1\v'\r*\0006\14\25\0\18\16\4\0B\14\2\2&\r\14\r6\14\0\0009\14\3\0149\14\4\0149\14\t\14B\v\3\0012\0\0ÄK\0\1\0\15\0\5\0X\v\tÄ6\v\0\0009\v\29\v9\v)\v6\r\25\0\18\15\5\0B\r\2\0A\v\0\2\b\v\0\0X\v\bÄ6\v\0\0009\v\29\v9\v+\v6\r\25\0\18\15\5\0B\r\2\2'\14,\0B\v\3\0013\v-\0003\f.\0006\r\0\0009\r\29\r9\r%\r'\15/\0'\0160\0B\r\3\0026\14\0\0009\14\1\14'\0161\0\18\17\r\0&\16\17\0166\17\0\0009\17\3\0179\17\4\0179\17\28\17B\14\3\0016\14\0\0009\14\1\14'\0161\0\18\17\r\0&\16\17\0166\17\0\0009\17\3\0179\17\4\0179\17\28\17B\14\3\1+\14\0\0006\0152\0003\0173\0B\15\2\3\15\0\15\0X\17\2Ä\18\14\16\0X\17\14Ä6\17\0\0009\17\1\17'\0194\0006\20\25\0\18\22\16\0B\20\2\2&\19\20\0196\20\0\0009\20\3\0209\20\4\0209\20\t\20B\17\3\0012\0\0ÄK\0\1\0\v\14\0\0X\17\nÄ6\17\0\0009\17\1\17'\0195\0006\20\0\0009\20\3\0209\20\4\0209\20\t\20B\17\3\0012\0\0ÄK\0\1\0006\17\0\0009\17\1\17'\0196\0006\20\0\0009\0207\20\18\22\14\0B\20\2\2&\19\20\0196\20\0\0009\20\3\0209\20\4\0209\20\5\20B\17\3\1\18\17\f\0B\17\1\0026\18\0\0009\18\1\18'\0208\0006\21\0\0009\0217\21\18\23\17\0B\21\2\2&\20\21\0206\21\0\0009\21\3\0219\21\4\0219\21\28\21B\18\3\0016\18\16\0\18\20\17\0B\18\2\4X\21 Ä+\23\2\0006\24\16\0\18\26\a\0B\24\2\4X\27\bÄ\18\31\22\0009\29 \22\18 \28\0B\29\3\2\15\0\29\0X\30\2Ä+\23\1\0X\24\2ÄE\27\3\3R\27ˆ\127\15\0\23\0X\24\5Ä\18\24\v\0\18\26\22\0\18\27\14\0B\24\3\1X\24\nÄ6\24\0\0009\24\1\24'\0269\0\18\27\22\0&\26\27\0266\27\0\0009\27\3\0279\27\4\0279\27\5\27B\24\3\1E\21\3\3R\21ﬁ\1276\18\0\0009\18\1\18'\20:\0006\21\0\0009\21\3\0219\21\4\0219\21\5\21B\18\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\2¿\3¿\1¿\25All files processed.\29Skipping excluded file: \23Files to process: \finspect&Processing dataset with options: .Invalid YAML formatting options provided.!Error loading YAML options: \0\npcall\24YAML format input:  indent = 2, line_width = 80LEnter YAML formatting preferences (e.g., indent = 2, line_width = 80): \0\0\6p\nmkdir6Input path does not exist or is not a directory: \16isdirectory\27Resolved paths: input=\voutput\rabsolute\ninput\bnew\0\bsub\t/%*$\nmatch\n%:p:h\vexpand\afn\nDEBUG\r, depth=\14, output=\rtostring\24Parsed args: input=\vinsert\ntable\a-e\rtonumber\a-d\a-o\a-i\vipairs\6 \5\targs\nsplit8Error: lua-yaml is required for ProcessLargeDataset,Plenary Path module loaded successfully\nERROR'Failed to load plenary.path module\17plenary.path\frequire\tINFO\vlevels\blog&Starting ProcessLargeDataset hook\vnotify\bvim\2£\a\1\0\r\0&\0A6\0\0\0'\2\1\0B\0\2\2\14\0\0\0X\1\tÄ6\1\2\0009\1\3\1'\3\4\0006\4\2\0009\4\5\0049\4\6\0049\4\a\4B\1\3\0012\0002Ä6\1\0\0'\3\b\0B\1\2\0026\2\t\0006\4\0\0'\5\n\0B\2\3\3\14\0\2\0X\4\bÄ6\4\2\0009\4\3\4'\6\v\0006\a\2\0009\a\5\a9\a\6\a9\a\f\aB\4\3\0016\4\0\0'\6\r\0B\4\2\0029\5\14\0045\a \0005\b\29\0005\t\18\0006\n\15\0009\n\16\n'\f\17\0B\n\2\2=\n\19\t5\n\20\0005\v\21\0=\v\22\n=\n\23\t5\n\25\0005\v\24\0=\v\26\n5\v\27\0=\v\28\n=\n\22\t=\t\30\b4\t\0\0=\t\31\b=\b!\a5\b#\0003\t\"\0=\t$\b=\b%\aB\5\2\0012\0\0ÄK\0\1\0K\0\1\0\nhooks\24ProcessLargeDataset\1\0\1\24ProcessLargeDataset\0\0\14providers\1\0\3\18user_input_ui\vnative\nhooks\0\14providers\0\vollama\14anthropic\1\0\2\vollama\0\14anthropic\0\fcommand\1\0\1\15max_tokens\3Ä \tchat\1\0\2\tchat\0\fcommand\0\1\0\1\15max_tokens\3Ä \ntopic\vparams\1\0\1\15max_tokens\3 \1\0\2\vparams\0\nmodel\28claude-3-haiku-20240307\fapi_key\1\0\5\17topic_promptKYou only respond with 3 to 4 words to summarize the past conversation.\vparams\0\rendpoint*https://api.anthropic.com/v1/messages\fapi_key\0\ntopic\0\22ANTHROPIC_API_KEY\vgetenv\aos\nsetup\vparrot\tWARNDWarning: lua-yaml not found. Some functionality may be limited.\tyaml\npcall\20plenary.scandir\nERROR\vlevels\blog'Failed to load plenary.path module\vnotify\bvim\17plenary.path\frequire\0", "config", "parrot.nvim")
time([[Config for parrot.nvim]], false)
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
