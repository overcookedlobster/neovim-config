
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

-- Colors
use 'kepano/flexoki'
  use 'Shatur/neovim-ayu'
  -- use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'cideM/yui'
  use 'jsit/toast.vim'

  --AI
    -- Add parrot.nvim
use {-- {{{
  'frankroeder/parrot.nvim',
  dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  config = function()
    local Path = require("plenary.path")
    if not Path then
      vim.notify("Failed to load plenary.path module", vim.log.levels.ERROR)
      return
    end
    local scan = require("plenary.scandir")
    local yaml_ok, yaml = pcall(require, "yaml")
    if not yaml_ok then
      vim.notify("Warning: lua-yaml not found. Some functionality may be limited.", vim.log.levels.WARN)
    end

    local parrot = require("parrot")
    parrot.setup {
      providers = {
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
        ollama = {} -- provide an empty table to make provider available
      },
      user_input_ui = "native",
      hooks = {
ProcessLargeDataset = function(prt, params)
  vim.notify("Starting ProcessLargeDataset hook", vim.log.levels.INFO)
  
  local Path = require("plenary.path")
  if not Path then
    vim.notify("Failed to load plenary.path module", vim.log.levels.ERROR)
    return
  end
  vim.notify("Plenary Path module loaded successfully", vim.log.levels.INFO)
  
  local yaml_ok, yaml = pcall(require, "yaml")
  if not yaml_ok then
    vim.notify("Error: lua-yaml is required for ProcessLargeDataset", vim.log.levels.ERROR)
    return
  end

  local args = vim.split(params.args or "", " ")
  local input_path, output_path, depth, exclude = nil, nil, 1, {}
  
  for i, arg in ipairs(args) do
    if arg == "-i" and args[i+1] then
      input_path = args[i+1]
    elseif arg == "-o" and args[i+1] then
      output_path = args[i+1]
    elseif arg == "-d" and args[i+1] then
      depth = tonumber(args[i+1]) or 1
    elseif arg == "-e" and args[i+1] then
      table.insert(exclude, args[i+1])
    end
  end

  vim.notify("Parsed args: input=" .. tostring(input_path) .. ", output=" .. tostring(output_path) .. ", depth=" .. tostring(depth), vim.log.levels.DEBUG)

  -- Set default paths relative to current buffer
  local current_dir = vim.fn.expand("%:p:h")
  
  -- Handle wildcard input
  local is_wildcard = input_path and input_path:match("/%*$")
  if is_wildcard then
    input_path = input_path:sub(1, -2)  -- Remove the trailing *
  end
  
  local function safe_path(path, default)
    if path then
      local p = Path:new(path)
      return p and p:absolute() or default
    end
    return default
  end

  input_path = safe_path(input_path, Path:new(current_dir, "input"):absolute())
  output_path = safe_path(output_path, Path:new(current_dir, "output"):absolute())

  vim.notify("Resolved paths: input=" .. tostring(input_path) .. ", output=" .. tostring(output_path), vim.log.levels.DEBUG)

  -- Check if input_path exists
  if not input_path or not vim.fn.isdirectory(tostring(input_path)) == 1 then
    vim.notify("Input path does not exist or is not a directory: " .. tostring(input_path), vim.log.levels.ERROR)
    return
  end

  -- Create output directory if it doesn't exist
  if not output_path or vim.fn.isdirectory(tostring(output_path)) ~= 1 then
    vim.fn.mkdir(tostring(output_path), "p")
  end

  local function process_file(file_path, yaml_opts)
    vim.notify("Processing file: " .. file_path, vim.log.levels.INFO)
    
    local content
    do
      local input_file = io.open(file_path, "r")
      if not input_file then
        vim.notify("Failed to open input file: " .. file_path, vim.log.levels.ERROR)
        return
      end
      
      content = input_file:read("*all")
      input_file:close()
    end
    
    if not content or content == "" then
      vim.notify("File is empty or couldn't be read: " .. file_path, vim.log.levels.WARN)
      return
    end
    
    vim.notify("File content length: " .. #content, vim.log.levels.DEBUG)
    
    vim.notify("File path: " .. file_path, vim.log.levels.DEBUG)
    vim.notify("Input path: " .. tostring(input_path), vim.log.levels.DEBUG)
    vim.notify("Output path: " .. tostring(output_path), vim.log.levels.DEBUG)

    local relative_path = Path:new(file_path):make_relative(input_path)
    vim.notify("Relative path: " .. tostring(relative_path), vim.log.levels.DEBUG)

    if not relative_path then
      vim.notify("Failed to create relative path for: " .. file_path, vim.log.levels.ERROR)
      return
    end

    local output_file_path = Path:new(output_path, relative_path)
    vim.notify("Output file path: " .. tostring(output_file_path), vim.log.levels.DEBUG)

    if not output_file_path then
      vim.notify("Failed to create output file path", vim.log.levels.ERROR)
      return
    end

    -- Manually add the .yaml suffix
    local output_file_path_str = tostring(output_file_path) .. ".yaml"
    vim.notify("Output file path with suffix: " .. output_file_path_str, vim.log.levels.DEBUG)

    output_file_path = Path:new(output_file_path_str)

    if not output_file_path then
      vim.notify("Failed to create new Path object with .yaml suffix", vim.log.levels.ERROR)
      return
    end

    vim.notify("Final output file path: " .. tostring(output_file_path), vim.log.levels.DEBUG)
    
    local output_file = io.open(tostring(output_file_path), "a+")
    if not output_file then
      vim.notify("Failed to open output file: " .. tostring(output_file_path), vim.log.levels.ERROR)
      return
    end

    -- Check if file already has content and position at the end
    output_file:seek("end")
    local file_size = output_file:seek()
    local continuation = file_size > 0
    
local function process_chunk(chunk, is_continuation)
  vim.notify("Processing chunk, continuation: " .. tostring(is_continuation), vim.log.levels.DEBUG)
  
  local template = [[
    Process the following content and produce a YAML output. 
    If this is a continuation, append to the existing structure.
    Content:
    {{content}}
    
    Produce YAML output below. End with "# EOF" on a new line when complete:
  ]]
  
  if is_continuation then
    template = "Continue processing where you left off:\n" .. template
  end
  
  local model_obj = prt.get_model("command")
  if not model_obj then
    vim.notify("Failed to get command model", vim.log.levels.ERROR)
    return nil, true
  end
  
  vim.notify("Calling prt.Prompt", vim.log.levels.DEBUG)
  if type(prt.Prompt) ~= "function" then
    vim.notify("Error: prt.Prompt is not a function. Type: " .. type(prt.Prompt), vim.log.levels.ERROR)
    return nil, true
  end

  local success, result = pcall(prt.Prompt, {args = chunk}, prt.ui.Target.popup, model_obj, nil, template)
  if not success then
    vim.notify("Error in prt.Prompt: " .. tostring(result), vim.log.levels.ERROR)
    return nil, true
  end

  if result == nil then
    vim.notify("prt.Prompt returned nil, attempting fallback processing", vim.log.levels.WARN)
    -- Fallback: attempt to convert the chunk to YAML directly
    local yaml_result
    pcall(function()
      -- Attempt to parse the chunk as Lua table
      local chunk_table = load("return " .. chunk)()
      if type(chunk_table) == "table" then
        yaml_result = yaml.dump(chunk_table)
      else
        -- If not a table, create a simple key-value pair
        yaml_result = yaml.dump({content = chunk})
      end
    end)
    if yaml_result then
      return yaml_result .. "\n# EOF\n", true
    else
      vim.notify("Fallback processing failed", vim.log.levels.ERROR)
      return nil, true
    end
  end

  if type(result) ~= "string" then
    vim.notify("prt.Prompt returned non-string result: " .. vim.inspect(result), vim.log.levels.ERROR)
    return nil, true
  end

  if result:match("# EOF\n$") then
    return result:gsub("# EOF\n$", ""), true
  else
    return result, false
  end
end

    output_file:close()
    vim.notify("Processed " .. file_path .. " and saved to " .. tostring(output_file_path), vim.log.levels.INFO)
  end

  -- Function to get list of files to process
  local function get_files_to_process()
    vim.notify("Getting files to process", vim.log.levels.DEBUG)
    if is_wildcard or vim.fn.isdirectory(tostring(input_path)) == 1 then
      -- If input_path was a wildcard or is a directory
      return vim.fn.globpath(tostring(input_path), "*", false, true)
    elseif vim.fn.filereadable(tostring(input_path)) == 1 then
      -- If input_path is a file
      return {tostring(input_path)}
    else
      vim.notify("Invalid input path: " .. tostring(input_path), vim.log.levels.ERROR)
      return {}
    end
  end

  -- Get YAML formatting preferences
  local yaml_format = vim.fn.input("Enter YAML formatting preferences (e.g., indent = 2, line_width = 80): ", "indent = 2, line_width = 80")
  vim.notify("YAML format input: " .. yaml_format, vim.log.levels.DEBUG)

  local yaml_opts
  local yaml_load_success, yaml_load_result = pcall(function()
    -- Convert "key: value" to "key = value" for Lua syntax
    local lua_format = yaml_format:gsub("(%w+):%s*", "%1 = ")
    local fn, err = load("return {" .. lua_format .. "}")
    if not fn then
      error("Failed to parse YAML options: " .. tostring(err))
    end
    return fn()
  end)

  if yaml_load_success then
    yaml_opts = yaml_load_result
  else
    vim.notify("Error loading YAML options: " .. tostring(yaml_load_result), vim.log.levels.ERROR)
    return
  end

  if yaml_opts == nil then
    vim.notify("Invalid YAML formatting options provided.", vim.log.levels.ERROR)
    return
  end

  -- Print the YAML options (for debugging)
  vim.notify("Processing dataset with options: " .. vim.inspect(yaml_opts), vim.log.levels.INFO)

  local files = get_files_to_process()
  vim.notify("Files to process: " .. vim.inspect(files), vim.log.levels.DEBUG)
  
  for _, file in ipairs(files) do
    local should_process = true
    for _, pattern in ipairs(exclude) do
      if file:match(pattern) then
        should_process = false
        break
      end
    end
    if should_process then
      process_file(file, yaml_opts)
    else
      vim.notify("Skipping excluded file: " .. file, vim.log.levels.INFO)
    end
  end

  vim.notify("All files processed.", vim.log.levels.INFO)
end,
      },
    }
  end,
}-- }}}
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
