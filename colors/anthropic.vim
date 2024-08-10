" Vim color file
" Maintainer: Your Name
" Last Change: 2023

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="anthropic"

lua << EOF
local lush = require('lush')
local theme = require('lush_theme.anthropic')
local spec = lush.compile(theme)

for group, colors in pairs(spec) do
  local fg = colors.fg and type(colors.fg) == "table" and colors.fg.hex and "guifg=" .. colors.fg.hex or ""
  local bg = colors.bg and type(colors.bg) == "table" and colors.bg.hex and "guibg=" .. colors.bg.hex or ""
  local gui = colors.gui or ""
  
  if fg ~= "" or bg ~= "" or gui ~= "" then
    vim.api.nvim_command(string.format("hi %s %s %s %s", group, fg, bg, gui))
  end
end
EOF
