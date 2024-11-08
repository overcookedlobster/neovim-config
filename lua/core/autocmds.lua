local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Use `d` (delimiter) for targets.vim block text objects
vim.cmd[[
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'd': {'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}]},
    \ })
]]

-- Enter/leave insert mode when entering/leaving a terminal
autocmd("BufEnter", {
  pattern = "term://*",
  command = "startinsert",
})

autocmd("BufLeave", {
  pattern = "term://*",
  command = "stopinsert",
})

-- SystemVerilog-specific autocommands
local sv_group = augroup("SystemVerilog", { clear = true })

autocmd("FileType", {
  pattern = "systemverilog",
  group = sv_group,
  callback = function()
    require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath('config') .. "/LuaSnip/sv/"})
    -- Add other SystemVerilog-specific setup here
  end,
})
local tab_switching = false

vim.api.nvim_create_autocmd("TabLeave", {
  callback = function()
    tab_switching = true
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {"*.sv", "*.v"},
  callback = function()
    if tab_switching then
      -- ignore diagnostic updates on tab switch
      tab_switching = false
    else
      -- perform diagnostic updates
      vim.diagnostic.show()
      require("utils").refresh_diagnostics()
    end
  end,
})
