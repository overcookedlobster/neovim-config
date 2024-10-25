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
  ["csv.vim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
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
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
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
    config = { "\27LJ\2\n¯\2\0\2\v\0\a\0\14'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0\18\6\1\0009\a\4\0009\a\5\a9\a\6\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_modelí\2          I have the following code from {{filename}}:\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please finish the code above carefully and logically.\n          Respond just with the snippet of code that should be inserted.\"\n          ˜\3\0\2\v\0\a\0\14'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0\18\6\1\0009\a\4\0009\a\5\a9\a\6\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_modelë\3          I have the following code from {{filename}}:\n\n          ```{{filetype}}\n          {{filecontent}}\n          ```\n\n          Please look at the following section specifically:\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please finish the code above carefully and logically.\n          Respond just with the snippet of code that should be inserted.\n          î\4\0\2\v\0\a\0\14'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0\18\6\1\0009\a\4\0009\a\5\a9\a\6\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_modelÆ\3          I have the following code from {{filename}} and other realted files:\n\n          ```{{filetype}}\n          {{multifilecontent}}\n          ```\n\n          Please look at the following section specifically:\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please finish the code above carefully and logically.\n          Respond just with the snippet of code that should be inserted.\n          á\5\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\bnew\vTarget\aui\vPrompt\tname&Explaining selection with model: \tinfo\vlogger\fcommand\14get_modelŸ\3          Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.\n          Break down the code's functionality, purpose, and key components.\n          The goal is to help the reader understand what the code does and how it works.\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Use the markdown format with codeblocks and inline code.\n          Explanation of the code above:\n          ¬\6\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\bnew\vTarget\aui\vPrompt\tname*Fixing bugs in selection with model: \tinfo\vlogger\fcommand\14get_modelê\5          You are an expert in {{filetype}}.\n          Fix bugs in the below code from {{filename}} carefully and logically:\n          Your task is to analyze the provided {{filetype}} code snippet, identify\n          any bugs or errors present, and provide a corrected version of the code\n          that resolves these issues. Explain the problems you found in the\n          original code and how your fixes address them. The corrected code should\n          be functional, efficient, and adhere to best practices in\n          {{filetype}} programming.\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Fixed code:\n          ◊\6\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\bnew\vTarget\aui\vPrompt\tname&Optimizing selection with model: \tinfo\vlogger\fcommand\14get_model©\5          You are an expert in {{filetype}}.\n          Your task is to analyze the provided {{filetype}} code snippet and\n          suggest improvements to optimize its performance. Identify areas\n          where the code can be made more efficient, faster, or less\n          resource-intensive. Provide specific suggestions for optimization,\n          along with explanations of how these changes can enhance the code's\n          performance. The optimized code should maintain the same functionality\n          as the original code while demonstrating improved efficiency.\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Optimized code:\n          î\3\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\tenew\vTarget\aui\vPrompt\tname3Creating unit tests for selection with model: \tinfo\vlogger\fcommand\14get_modelÿ\1          I have the following code from {{filename}}:\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please respond by writing table driven unit tests for the code above.\n          ˝\3\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\tenew\vTarget\aui\vPrompt\tname%Debugging selection with model: \tinfo\vlogger\fcommand\14get_modelœ\2          I want you to act as {{filetype}} expert.\n          Review the following code, carefully examine it, and report potential\n          bugs and edge cases alongside solutions to resolve them.\n          Keep your explanation short and to the point:\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n          Ü\a\0\2\f\0\18\0!6\2\0\0'\4\1\0B\2\2\0029\3\2\2B\3\1\2\a\3\3\0X\3\6Ä9\3\4\0009\3\5\3'\5\6\0B\3\2\1K\0\1\0X\3\19Ä'\3\a\0006\4\b\0009\4\t\0049\4\n\4'\6\v\0B\4\2\2&\3\4\0039\4\f\0'\6\r\0B\4\2\0029\5\14\0\18\a\1\0009\b\15\0009\b\16\b9\b\17\b\18\t\4\0+\n\0\0\18\v\3\0B\5\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_model/git diff --no-color --no-ext-diff --staged\vsystem\afn\bvimÀ\4            I want you to act as a commit message generator. I will provide you\n            with information about the task and the prefix for the task code, and\n            I would like you to generate an appropriate commit message using the\n            conventional commit format. Do not write any explanations or other\n            words, just reply with the commit message.\n            Start with a short headline as summary but then list the individual\n            changes in more detail.\n\n            Here are the changes that should be considered by this message:\n            \28Not in a git repository\fwarning\vlogger\5\18find_git_root\22parrot.file_utils\frequireÅ\3\0\2\a\0\2\0\6'\2\0\0009\3\1\0\18\5\1\0\18\6\2\0B\3\3\1K\0\1\0\fChatNew›\2          Your task is to take the text provided and rewrite it into a clear,\n          grammatically correct version while preserving the original meaning\n          as closely as possible. Correct any spelling mistakes, punctuation\n          errors, verb tense issues, word choice problems, and other\n          grammatical mistakes.\n          ∞\5\0\2\a\0\2\0\6'\2\0\0009\3\1\0\18\5\1\0\18\6\2\0B\3\3\1K\0\1\0\fChatNewå\5            Your task is to analyze the provided {{filetype}} code and suggest\n            improvements to optimize its performance. Identify areas where the\n            code can be made more efficient, faster, or less resource-intensive.\n            Provide specific suggestions for optimization, along with explanations\n            of how these changes can enhance the code's performance. The optimized\n            code should maintain the same functionality as the original code while\n            demonstrating improved efficiency.\n\n            Here is the code\n            ```{{filetype}}\n            {{filecontent}}\n            ```\n          €\a\0\2\a\0\2\0\6'\2\0\0009\3\1\0\18\5\1\0\18\6\2\0B\3\3\1K\0\1\0\fChatNew∑\a          I want you to act as a proofreader. I will provide you with texts and\n          I would like you to review them for any spelling, grammar, or\n          punctuation errors. Once you have finished reviewing the text,\n          provide me with any necessary corrections or suggestions to improve the\n          text. Highlight the corrected fragments (if any) using markdown backticks.\n\n          When you have done that subsequently provide me with a slightly better\n          version of the text, but keep close to the original text.\n\n          Finally provide me with an ideal version of the text.\n\n          Whenever I provide you with text, you reply in this format directly:\n\n          ## Corrected text:\n\n          {corrected text, or say \"NO_CORRECTIONS_NEEDED\" instead if there are no corrections made}\n\n          ## Slightly better text\n\n          {slightly better text}\n\n          ## Ideal text\n\n          {ideal text}\n          ÿ\6\1\0\b\0)\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0005\2\r\0005\3\n\0005\4\b\0006\5\5\0009\5\6\5'\a\a\0B\5\2\2=\5\t\4=\4\v\0034\4\0\0=\4\f\3=\3\14\0025\3\16\0003\4\15\0=\4\17\0033\4\18\0=\4\19\0033\4\20\0=\4\21\0033\4\22\0=\4\23\0033\4\24\0=\4\25\0033\4\26\0=\4\27\0033\4\28\0=\4\29\0033\4\30\0=\4\31\0033\4 \0=\4!\0033\4\"\0=\4#\0033\4$\0=\4%\0033\4&\0=\4'\3=\3(\2B\0\2\1K\0\1\0\nhooks\16ProofReader\0\19CodeConsultant\0\15SpellCheck\0\14CommitMsg\0\nDebug\0\14UnitTests\0\rOptimize\0\fFixBugs\0\fExplain\0\25CompleteMultiContext\0\24CompleteFullContext\0\rComplete\1\0\f\14UnitTests\0\15SpellCheck\0\14CommitMsg\0\rComplete\0\rOptimize\0\16ProofReader\0\fFixBugs\0\fExplain\0\25CompleteMultiContext\0\24CompleteFullContext\0\nDebug\0\19CodeConsultant\0\0\14providers\1\0\b\18toggle_target\vtabnew\18user_input_ui\vbuffer\30chat_conceal_model_params\1\14providers\0\15cmd_prefix\bPrt!command_auto_select_response\2\27online_model_selection\2\nhooks\0\vollama\14anthropic\1\0\2\14anthropic\0\vollama\0\fapi_key\1\0\1\fapi_key\0\22ANTHROPIC_API_KEY\vgetenv\aos\vparrot\1\0\3\vrender\fcompact\22background_colour\f#000000\rtop_down\1\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/parrot.nvim",
    url = "https://github.com/frankroeder/parrot.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/flyinglobster/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
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
try_loadstring("\27LJ\2\n¯\2\0\2\v\0\a\0\14'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0\18\6\1\0009\a\4\0009\a\5\a9\a\6\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_modelí\2          I have the following code from {{filename}}:\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please finish the code above carefully and logically.\n          Respond just with the snippet of code that should be inserted.\"\n          ˜\3\0\2\v\0\a\0\14'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0\18\6\1\0009\a\4\0009\a\5\a9\a\6\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_modelë\3          I have the following code from {{filename}}:\n\n          ```{{filetype}}\n          {{filecontent}}\n          ```\n\n          Please look at the following section specifically:\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please finish the code above carefully and logically.\n          Respond just with the snippet of code that should be inserted.\n          î\4\0\2\v\0\a\0\14'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0\18\6\1\0009\a\4\0009\a\5\a9\a\6\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_modelÆ\3          I have the following code from {{filename}} and other realted files:\n\n          ```{{filetype}}\n          {{multifilecontent}}\n          ```\n\n          Please look at the following section specifically:\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please finish the code above carefully and logically.\n          Respond just with the snippet of code that should be inserted.\n          á\5\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\bnew\vTarget\aui\vPrompt\tname&Explaining selection with model: \tinfo\vlogger\fcommand\14get_modelŸ\3          Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.\n          Break down the code's functionality, purpose, and key components.\n          The goal is to help the reader understand what the code does and how it works.\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Use the markdown format with codeblocks and inline code.\n          Explanation of the code above:\n          ¬\6\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\bnew\vTarget\aui\vPrompt\tname*Fixing bugs in selection with model: \tinfo\vlogger\fcommand\14get_modelê\5          You are an expert in {{filetype}}.\n          Fix bugs in the below code from {{filename}} carefully and logically:\n          Your task is to analyze the provided {{filetype}} code snippet, identify\n          any bugs or errors present, and provide a corrected version of the code\n          that resolves these issues. Explain the problems you found in the\n          original code and how your fixes address them. The corrected code should\n          be functional, efficient, and adhere to best practices in\n          {{filetype}} programming.\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Fixed code:\n          ◊\6\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\bnew\vTarget\aui\vPrompt\tname&Optimizing selection with model: \tinfo\vlogger\fcommand\14get_model©\5          You are an expert in {{filetype}}.\n          Your task is to analyze the provided {{filetype}} code snippet and\n          suggest improvements to optimize its performance. Identify areas\n          where the code can be made more efficient, faster, or less\n          resource-intensive. Provide specific suggestions for optimization,\n          along with explanations of how these changes can enhance the code's\n          performance. The optimized code should maintain the same functionality\n          as the original code while demonstrating improved efficiency.\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Optimized code:\n          î\3\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\tenew\vTarget\aui\vPrompt\tname3Creating unit tests for selection with model: \tinfo\vlogger\fcommand\14get_modelÿ\1          I have the following code from {{filename}}:\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n\n          Please respond by writing table driven unit tests for the code above.\n          ˝\3\0\2\v\0\v\0\20'\2\0\0009\3\1\0'\5\2\0B\3\2\0029\4\3\0009\4\4\4'\6\5\0009\a\6\3&\6\a\6B\4\2\0019\4\a\0\18\6\1\0009\a\b\0009\a\t\a9\a\n\a\18\b\3\0+\t\0\0\18\n\2\0B\4\6\1K\0\1\0\tenew\vTarget\aui\vPrompt\tname%Debugging selection with model: \tinfo\vlogger\fcommand\14get_modelœ\2          I want you to act as {{filetype}} expert.\n          Review the following code, carefully examine it, and report potential\n          bugs and edge cases alongside solutions to resolve them.\n          Keep your explanation short and to the point:\n\n          ```{{filetype}}\n          {{selection}}\n          ```\n          Ü\a\0\2\f\0\18\0!6\2\0\0'\4\1\0B\2\2\0029\3\2\2B\3\1\2\a\3\3\0X\3\6Ä9\3\4\0009\3\5\3'\5\6\0B\3\2\1K\0\1\0X\3\19Ä'\3\a\0006\4\b\0009\4\t\0049\4\n\4'\6\v\0B\4\2\2&\3\4\0039\4\f\0'\6\r\0B\4\2\0029\5\14\0\18\a\1\0009\b\15\0009\b\16\b9\b\17\b\18\t\4\0+\n\0\0\18\v\3\0B\5\6\1K\0\1\0\vappend\vTarget\aui\vPrompt\fcommand\14get_model/git diff --no-color --no-ext-diff --staged\vsystem\afn\bvimÀ\4            I want you to act as a commit message generator. I will provide you\n            with information about the task and the prefix for the task code, and\n            I would like you to generate an appropriate commit message using the\n            conventional commit format. Do not write any explanations or other\n            words, just reply with the commit message.\n            Start with a short headline as summary but then list the individual\n            changes in more detail.\n\n            Here are the changes that should be considered by this message:\n            \28Not in a git repository\fwarning\vlogger\5\18find_git_root\22parrot.file_utils\frequireÅ\3\0\2\a\0\2\0\6'\2\0\0009\3\1\0\18\5\1\0\18\6\2\0B\3\3\1K\0\1\0\fChatNew›\2          Your task is to take the text provided and rewrite it into a clear,\n          grammatically correct version while preserving the original meaning\n          as closely as possible. Correct any spelling mistakes, punctuation\n          errors, verb tense issues, word choice problems, and other\n          grammatical mistakes.\n          ∞\5\0\2\a\0\2\0\6'\2\0\0009\3\1\0\18\5\1\0\18\6\2\0B\3\3\1K\0\1\0\fChatNewå\5            Your task is to analyze the provided {{filetype}} code and suggest\n            improvements to optimize its performance. Identify areas where the\n            code can be made more efficient, faster, or less resource-intensive.\n            Provide specific suggestions for optimization, along with explanations\n            of how these changes can enhance the code's performance. The optimized\n            code should maintain the same functionality as the original code while\n            demonstrating improved efficiency.\n\n            Here is the code\n            ```{{filetype}}\n            {{filecontent}}\n            ```\n          €\a\0\2\a\0\2\0\6'\2\0\0009\3\1\0\18\5\1\0\18\6\2\0B\3\3\1K\0\1\0\fChatNew∑\a          I want you to act as a proofreader. I will provide you with texts and\n          I would like you to review them for any spelling, grammar, or\n          punctuation errors. Once you have finished reviewing the text,\n          provide me with any necessary corrections or suggestions to improve the\n          text. Highlight the corrected fragments (if any) using markdown backticks.\n\n          When you have done that subsequently provide me with a slightly better\n          version of the text, but keep close to the original text.\n\n          Finally provide me with an ideal version of the text.\n\n          Whenever I provide you with text, you reply in this format directly:\n\n          ## Corrected text:\n\n          {corrected text, or say \"NO_CORRECTIONS_NEEDED\" instead if there are no corrections made}\n\n          ## Slightly better text\n\n          {slightly better text}\n\n          ## Ideal text\n\n          {ideal text}\n          ÿ\6\1\0\b\0)\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0005\2\r\0005\3\n\0005\4\b\0006\5\5\0009\5\6\5'\a\a\0B\5\2\2=\5\t\4=\4\v\0034\4\0\0=\4\f\3=\3\14\0025\3\16\0003\4\15\0=\4\17\0033\4\18\0=\4\19\0033\4\20\0=\4\21\0033\4\22\0=\4\23\0033\4\24\0=\4\25\0033\4\26\0=\4\27\0033\4\28\0=\4\29\0033\4\30\0=\4\31\0033\4 \0=\4!\0033\4\"\0=\4#\0033\4$\0=\4%\0033\4&\0=\4'\3=\3(\2B\0\2\1K\0\1\0\nhooks\16ProofReader\0\19CodeConsultant\0\15SpellCheck\0\14CommitMsg\0\nDebug\0\14UnitTests\0\rOptimize\0\fFixBugs\0\fExplain\0\25CompleteMultiContext\0\24CompleteFullContext\0\rComplete\1\0\f\14UnitTests\0\15SpellCheck\0\14CommitMsg\0\rComplete\0\rOptimize\0\16ProofReader\0\fFixBugs\0\fExplain\0\25CompleteMultiContext\0\24CompleteFullContext\0\nDebug\0\19CodeConsultant\0\0\14providers\1\0\b\18toggle_target\vtabnew\18user_input_ui\vbuffer\30chat_conceal_model_params\1\14providers\0\15cmd_prefix\bPrt!command_auto_select_response\2\27online_model_selection\2\nhooks\0\vollama\14anthropic\1\0\2\14anthropic\0\vollama\0\fapi_key\1\0\1\fapi_key\0\22ANTHROPIC_API_KEY\vgetenv\aos\vparrot\1\0\3\vrender\fcompact\22background_colour\f#000000\rtop_down\1\nsetup\vnotify\frequire\0", "config", "parrot.nvim")
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
