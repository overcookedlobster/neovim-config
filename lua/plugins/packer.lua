
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
  use {'lervag/vimtex'}
  use 'wbthomason/packer.nvim'
  use 'InES-HPMM/zhaw-snippets'
  use 'yuratomo/w3m.vim'
  use 'mg979/vim-visual-multi'
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

  
  use 'chrisbra/csv.vim'
  use 'kevinhwang91/rnvimr'

-- Colors
use 'kepano/flexoki'
  use 'Shatur/neovim-ayu'
  -- use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'cideM/yui'
  use 'jsit/toast.vim'

use {
  "frankroeder/parrot.nvim",
  -- event = "VeryLazy",
  requires = { 
    "ibhagwan/fzf-lua", 
    "nvim-lua/plenary.nvim", 
    "rcarriga/nvim-notify" 
  },
  config = function()
    require("notify").setup {
      background_colour = "#000000",
      render = "compact",
      top_down = false,
    }
    require("parrot").setup({
      -- Copy the opts table from your original configuration here
      providers = {
        anthropic = {
          api_key = os.getenv "ANTHROPIC_API_KEY",
        },
        ollama = {},
      },
      cmd_prefix = "Prt",
      chat_conceal_model_params = false,
      user_input_ui = "buffer",
      toggle_target = "tabnew",
      online_model_selection = true,
      command_auto_select_response = true,
      -- Copy the rest of the opts table...
      hooks = {
        Complete = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted."
          ]]
          local model_obj = prt.get_model "command"
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        CompleteFullContext = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{filecontent}}
          ```

          Please look at the following section specifically:
          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted.
          ]]
          local model_obj = prt.get_model "command"
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        CompleteMultiContext = function(prt, params)
          local template = [[
          I have the following code from {{filename}} and other realted files:

          ```{{filetype}}
          {{multifilecontent}}
          ```

          Please look at the following section specifically:
          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted.
          ]]
          local model_obj = prt.get_model "command"
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        Explain = function(prt, params)
          local template = [[
          Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
          Break down the code's functionality, purpose, and key components.
          The goal is to help the reader understand what the code does and how it works.

          ```{{filetype}}
          {{selection}}
          ```

          Use the markdown format with codeblocks and inline code.
          Explanation of the code above:
          ]]
          local model = prt.get_model "command"
          prt.logger.info("Explaining selection with model: " .. model.name)
          prt.Prompt(params, prt.ui.Target.new, model, nil, template)
        end,
        FixBugs = function(prt, params)
          local template = [[
          You are an expert in {{filetype}}.
          Fix bugs in the below code from {{filename}} carefully and logically:
          Your task is to analyze the provided {{filetype}} code snippet, identify
          any bugs or errors present, and provide a corrected version of the code
          that resolves these issues. Explain the problems you found in the
          original code and how your fixes address them. The corrected code should
          be functional, efficient, and adhere to best practices in
          {{filetype}} programming.

          ```{{filetype}}
          {{selection}}
          ```

          Fixed code:
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Fixing bugs in selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
        end,
        Optimize = function(prt, params)
          local template = [[
          You are an expert in {{filetype}}.
          Your task is to analyze the provided {{filetype}} code snippet and
          suggest improvements to optimize its performance. Identify areas
          where the code can be made more efficient, faster, or less
          resource-intensive. Provide specific suggestions for optimization,
          along with explanations of how these changes can enhance the code's
          performance. The optimized code should maintain the same functionality
          as the original code while demonstrating improved efficiency.

          ```{{filetype}}
          {{selection}}
          ```

          Optimized code:
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Optimizing selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
        end,
        UnitTests = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{selection}}
          ```

          Please respond by writing table driven unit tests for the code above.
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
        end,
        Debug = function(prt, params)
          local template = [[
          I want you to act as {{filetype}} expert.
          Review the following code, carefully examine it, and report potential
          bugs and edge cases alongside solutions to resolve them.
          Keep your explanation short and to the point:

          ```{{filetype}}
          {{selection}}
          ```
          ]]
          local model_obj = prt.get_model "command"
          prt.logger.info("Debugging selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
        end,
        CommitMsg = function(prt, params)
          local futils = require "parrot.file_utils"
          if futils.find_git_root() == "" then
            prt.logger.warning "Not in a git repository"
            return
          else
            local template = [[
            I want you to act as a commit message generator. I will provide you
            with information about the task and the prefix for the task code, and
            I would like you to generate an appropriate commit message using the
            conventional commit format. Do not write any explanations or other
            words, just reply with the commit message.
            Start with a short headline as summary but then list the individual
            changes in more detail.

            Here are the changes that should be considered by this message:
            ]] .. vim.fn.system "git diff --no-color --no-ext-diff --staged"
            local model_obj = prt.get_model "command"
            prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
          end
        end,
        SpellCheck = function(prt, params)
          local chat_prompt = [[
          Your task is to take the text provided and rewrite it into a clear,
          grammatically correct version while preserving the original meaning
          as closely as possible. Correct any spelling mistakes, punctuation
          errors, verb tense issues, word choice problems, and other
          grammatical mistakes.
          ]]
          prt.ChatNew(params, chat_prompt)
        end,
        CodeConsultant = function(prt, params)
          local chat_prompt = [[
            Your task is to analyze the provided {{filetype}} code and suggest
            improvements to optimize its performance. Identify areas where the
            code can be made more efficient, faster, or less resource-intensive.
            Provide specific suggestions for optimization, along with explanations
            of how these changes can enhance the code's performance. The optimized
            code should maintain the same functionality as the original code while
            demonstrating improved efficiency.

            Here is the code
            ```{{filetype}}
            {{filecontent}}
            ```
          ]]
          prt.ChatNew(params, chat_prompt)
        end,
        ProofReader = function(prt, params)
          local chat_prompt = [[
          I want you to act as a proofreader. I will provide you with texts and
          I would like you to review them for any spelling, grammar, or
          punctuation errors. Once you have finished reviewing the text,
          provide me with any necessary corrections or suggestions to improve the
          text. Highlight the corrected fragments (if any) using markdown backticks.

          When you have done that subsequently provide me with a slightly better
          version of the text, but keep close to the original text.

          Finally provide me with an ideal version of the text.

          Whenever I provide you with text, you reply in this format directly:

          ## Corrected text:

          {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

          ## Slightly better text

          {slightly better text}

          ## Ideal text

          {ideal text}
          ]]
          prt.ChatNew(params, chat_prompt)
        end
      }
    })
  end
}

  --AI
    -- Add parrot.nvim
-- use {-- {{{
--   'frankroeder/parrot.nvim',
--   dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
--   config = function()
--     local Path = require("plenary.path")
--     if not Path then
--       vim.notify("Failed to load plenary.path module", vim.log.levels.ERROR)
--       return
--     end
--     local scan = require("plenary.scandir")
--     local yaml_ok, yaml = pcall(require, "yaml")
--     if not yaml_ok then
--       vim.notify("Warning: lua-yaml not found. Some functionality may be limited.", vim.log.levels.WARN)
--     end
--
--     local parrot = require("parrot")
--     parrot.setup {
--       providers = {
--         anthropic = {
--           api_key = os.getenv "ANTHROPIC_API_KEY",
--           endpoint = "https://api.anthropic.com/v1/messages",
--           topic_prompt = "You only respond with 3 to 4 words to summarize the past conversation.",
--           topic = {
--             model = "claude-3-haiku-20240307",
--             params = { max_tokens = 32 },
--           },
--           params = {
--             chat = { max_tokens = 4096 },
--             command = { max_tokens = 4096 },
--           },
--         },
--         ollama = {} -- provide an empty table to make provider available
--       },
--       user_input_ui = "native",
--       hooks = {
--             ProcessLargeDataset = function(prt, params)-- {{{
--               vim.notify("Starting ProcessLargeDataset hook", vim.log.levels.INFO)
--               
--               local Path = require("plenary.path")
--               if not Path then
--                 vim.notify("Failed to load plenary.path module", vim.log.levels.ERROR)
--                 return
--               end
--               vim.notify("Plenary Path module loaded successfully", vim.log.levels.INFO)
--               
--               local yaml_ok, yaml = pcall(require, "yaml")
--               if not yaml_ok then
--                 vim.notify("Error: lua-yaml is required for ProcessLargeDataset", vim.log.levels.ERROR)
--                 return
--               end
--
--               local args = vim.split(params.args or "", " ")
--               local input_path, output_path, depth, exclude = nil, nil, 1, {}
--               
--               for i, arg in ipairs(args) do
--                 if arg == "-i" and args[i+1] then
--                   input_path = args[i+1]
--                 elseif arg == "-o" and args[i+1] then
--                   output_path = args[i+1]
--                 elseif arg == "-d" and args[i+1] then
--                   depth = tonumber(args[i+1]) or 1
--                 elseif arg == "-e" and args[i+1] then
--                   table.insert(exclude, args[i+1])
--                 end
--               end
--
--               vim.notify("Parsed args: input=" .. tostring(input_path) .. ", output=" .. tostring(output_path) .. ", depth=" .. tostring(depth), vim.log.levels.DEBUG)
--
--               -- Set default paths relative to current buffer
--               local current_dir = vim.fn.expand("%:p:h")
--               
--               -- Handle wildcard input
--               local is_wildcard = input_path and input_path:match("/%*$")
--               if is_wildcard then
--                 input_path = input_path:sub(1, -2)  -- Remove the trailing *
--               end
--               
--               local function safe_path(path, default)
--                 if path then
--                   local p = Path:new(path)
--                   return p and p:absolute() or default
--                 end
--                 return default
--               end
--
--               input_path = safe_path(input_path, Path:new(current_dir, "input"):absolute())
--               output_path = safe_path(output_path, Path:new(current_dir, "output"):absolute())
--
--               vim.notify("Resolved paths: input=" .. tostring(input_path) .. ", output=" .. tostring(output_path), vim.log.levels.DEBUG)
--
--               -- Check if input_path exists
--               if not input_path or not vim.fn.isdirectory(tostring(input_path)) == 1 then
--                 vim.notify("Input path does not exist or is not a directory: " .. tostring(input_path), vim.log.levels.ERROR)
--                 return
--               end
--
--               -- Create output directory if it doesn't exist
--               if not output_path or vim.fn.isdirectory(tostring(output_path)) ~= 1 then
--                 vim.fn.mkdir(tostring(output_path), "p")
--               end
--
--               local function process_file(file_path, yaml_opts)
--                 vim.notify("Processing file: " .. file_path, vim.log.levels.INFO)
--                 
--                 local content
--                 do
--                   local input_file = io.open(file_path, "r")
--                   if not input_file then
--                     vim.notify("Failed to open input file: " .. file_path, vim.log.levels.ERROR)
--                     return
--                   end
--                   
--                   content = input_file:read("*all")
--                   input_file:close()
--                 end
--                 
--                 if not content or content == "" then
--                   vim.notify("File is empty or couldn't be read: " .. file_path, vim.log.levels.WARN)
--                   return
--                 end
--                 
--                 vim.notify("File content length: " .. #content, vim.log.levels.DEBUG)
--                 
--                 vim.notify("File path: " .. file_path, vim.log.levels.DEBUG)
--                 vim.notify("Input path: " .. tostring(input_path), vim.log.levels.DEBUG)
--                 vim.notify("Output path: " .. tostring(output_path), vim.log.levels.DEBUG)
--
--                 local relative_path = Path:new(file_path):make_relative(input_path)
--                 vim.notify("Relative path: " .. tostring(relative_path), vim.log.levels.DEBUG)
--
--                 if not relative_path then
--                   vim.notify("Failed to create relative path for: " .. file_path, vim.log.levels.ERROR)
--                   return
--                 end
--
--                 local output_file_path = Path:new(output_path, relative_path)
--                 vim.notify("Output file path: " .. tostring(output_file_path), vim.log.levels.DEBUG)
--
--                 if not output_file_path then
--                   vim.notify("Failed to create output file path", vim.log.levels.ERROR)
--                   return
--                 end
--
--                 -- Manually add the .yaml suffix
--                 local output_file_path_str = tostring(output_file_path) .. ".yaml"
--                 vim.notify("Output file path with suffix: " .. output_file_path_str, vim.log.levels.DEBUG)
--
--                 output_file_path = Path:new(output_file_path_str)
--
--                 if not output_file_path then
--                   vim.notify("Failed to create new Path object with .yaml suffix", vim.log.levels.ERROR)
--                   return
--                 end
--
--                 vim.notify("Final output file path: " .. tostring(output_file_path), vim.log.levels.DEBUG)
--                 
--                 local output_file = io.open(tostring(output_file_path), "a+")
--                 if not output_file then
--                   vim.notify("Failed to open output file: " .. tostring(output_file_path), vim.log.levels.ERROR)
--                   return
--                 end
--
--                 -- Check if file already has content and position at the end
--                 output_file:seek("end")
--                 local file_size = output_file:seek()
--                 local continuation = file_size > 0
--                 
--               -- Add this new section for YAML structure prompt
--               local yaml_structure = params.yaml_structure or vim.fn.input("Enter desired YAML structure (e.g., summary, details, etc.): ")
--               if yaml_structure == "" then
--                 vim.notify("No YAML structure provided. Using default structure.", vim.log.levels.WARN)
--                 yaml_structure = "content"
--               end
--
--               -- Replace the existing process_chunk function with this updated version
--             local function process_chunk(chunk, is_continuation)
--               vim.notify("Processing chunk, continuation: " .. tostring(is_continuation), vim.log.levels.DEBUG)
--               
--               -- Attempt AI processing (keeping this for future use if AI becomes available)
--               local success, result = pcall(prt.Prompt, {args = chunk}, prt.ui.Target.popup, model_obj, nil, template)
--               
--               -- If AI processing fails or returns nil/empty, use fallback processing
--               if not success or not result or result == "" then
--                 vim.notify("AI processing failed or returned empty result, using fallback processing", vim.log.levels.WARN)
--                 
--                 -- Fallback: create a simple YAML structure
--                 local yaml_result = "summary:\n"
--                 local lines = {}
--                 for line in chunk:gmatch("[^\r\n]+") do
--                   table.insert(lines, line)
--                 end
--                 
--                 -- Combine repeated lines
--                 local current_line = ""
--                 local count = 0
--                 for _, line in ipairs(lines) do
--                   if line == current_line then
--                     count = count + 1
--                   else
--                     if count > 0 then
--                       yaml_result = yaml_result .. string.format("  - %s (repeated %d times)\n", current_line, count + 1)
--                     end
--                     current_line = line
--                     count = 0
--                   end
--                 end
--                 if count > 0 then
--                   yaml_result = yaml_result .. string.format("  - %s (repeated %d times)\n", current_line, count + 1)
--                 end
--                 
--                 return yaml_result .. "\n# EOF\n", true
--               end
--
--               -- If we somehow get here with a valid result from AI, use it
--               if type(result) == "string" then
--                 if result:match("# EOF\n$") then
--                   return result:gsub("# EOF\n$", ""), true
--                 else
--                   return result, false
--                 end
--               end
--
--               -- If we get here, something unexpected happened
--               vim.notify("Unexpected result from processing", vim.log.levels.ERROR)
--               return nil, true
--             end
--
--                 output_file:close()
--                 vim.notify("Processed " .. file_path .. " and saved to " .. tostring(output_file_path), vim.log.levels.INFO)
--               end
--
--               -- Function to get list of files to process
--               local function get_files_to_process()
--                 vim.notify("Getting files to process", vim.log.levels.DEBUG)
--                 if is_wildcard or vim.fn.isdirectory(tostring(input_path)) == 1 then
--                   -- If input_path was a wildcard or is a directory
--                   return vim.fn.globpath(tostring(input_path), "*", false, true)
--                 elseif vim.fn.filereadable(tostring(input_path)) == 1 then
--                   -- If input_path is a file
--                   return {tostring(input_path)}
--                 else
--                   vim.notify("Invalid input path: " .. tostring(input_path), vim.log.levels.ERROR)
--                   return {}
--                 end
--               end
--
--               -- Get YAML formatting preferences
--               local yaml_format = vim.fn.input("Enter YAML formatting preferences (e.g., indent = 2, line_width = 80): ", "indent = 2, line_width = 80")
--               vim.notify("YAML format input: " .. yaml_format, vim.log.levels.DEBUG)
--
--               local yaml_opts
--               local yaml_load_success, yaml_load_result = pcall(function()
--                 -- Convert "key: value" to "key = value" for Lua syntax
--                 local lua_format = yaml_format:gsub("(%w+):%s*", "%1 = ")
--                 local fn, err = load("return {" .. lua_format .. "}")
--                 if not fn then
--                   error("Failed to parse YAML options: " .. tostring(err))
--                 end
--                 return fn()
--               end)
--
--               if yaml_load_success then
--                 yaml_opts = yaml_load_result
--               else
--                 vim.notify("Error loading YAML options: " .. tostring(yaml_load_result), vim.log.levels.ERROR)
--                 return
--               end
--
--               if yaml_opts == nil then
--                 vim.notify("Invalid YAML formatting options provided.", vim.log.levels.ERROR)
--                 return
--               end
--
--               -- Print the YAML options (for debugging)
--               vim.notify("Processing dataset with options: " .. vim.inspect(yaml_opts), vim.log.levels.INFO)
--
--               local files = get_files_to_process()
--               vim.notify("Files to process: " .. vim.inspect(files), vim.log.levels.DEBUG)
--               
--               for _, file in ipairs(files) do
--                 local should_process = true
--                 for _, pattern in ipairs(exclude) do
--                   if file:match(pattern) then
--                     should_process = false
--                     break
--                   end
--                 end
--                 if should_process then
--                   process_file(file, yaml_opts)
--                 else
--                   vim.notify("Skipping excluded file: " .. file, vim.log.levels.INFO)
--                 end
--               end
--
--               vim.notify("All files processed.", vim.log.levels.INFO)
--             end,-- }}}
--               },
--     }
--   end,
-- }-- }}}
--
  use {
    'luk400/vim-jukit',
    config = function()
      -- Any additional vim-jukit setup can go here
    end
  }
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'ibhagwan/fzf-lua', branch = 'main'}
  use 'nvim-tree/nvim-web-devicons'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'vhda/verilog_systemverilog.vim'  -- Enhanced SystemVerilog support
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
