local lush = require('lush')
local hsl = lush.hsl

-- Color Palette
local colors = {
  bg_000 = hsl("#f0ede6"),  -- Updated main background color
--  bg_000 = hsl("#2b2b2b"),
  bg_100 = hsl("#f5f5f5"),
  bg_400 = hsl("#e0e0e0"),
  bg_500 = hsl("#d0d0d0"),
  border_200 = hsl("#cccccc"),
  border_300 = hsl("#b3b3b3"),
  text_100 = hsl("#000000"),
  text_200 = hsl("#333333"),
  text_300 = hsl("#666666"),
  text_400 = hsl("#999999"),
  text_500 = hsl("#b3b3b3"),
  accent_pro_000 = hsl("#4a90e2"),
  accent_pro_100 = hsl("#3a7bd5"),
  accent_pro_200 = hsl("#2c5fb3"),
  accent_secondary_100 = hsl("#6fcf97"),
  oncolor_100 = hsl("#ffffff"),
}

-- Define your theme
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- UI elements
    Normal       { fg = colors.text_100, bg = colors.bg_000 },
    LineNr       { fg = colors.text_100, bg = colors.bg_000 },
    CursorLine   { bg = colors.bg_400 },
    Visual       { bg = colors.bg_000 },
    Search       { fg = colors.oncolor_100, bg = colors.accent_pro_000 },
    IncSearch    { fg = colors.oncolor_100, bg = colors.accent_pro_100 },
    StatusLine   { fg = colors.text_100, bg = colors.border_200 },
    StatusLineNC { fg = colors.text_300, bg = colors.bg_400 },
    VertSplit    { fg = colors.border_300, bg = colors.bg_000 },

    -- Syntax highlighting
    Comment      { fg = colors.text_300 },
    Constant     { fg = colors.accent_pro_200 },
    String       { fg = colors.accent_secondary_100 },
    Identifier   { fg = colors.accent_pro_000 },
    Function     { fg = colors.accent_pro_100 },
    Statement    { fg = colors.accent_pro_200 },
    PreProc      { fg = colors.accent_pro_000 },
    Type         { fg = colors.accent_secondary_100 },
    Special      { fg = colors.accent_pro_100 },

    -- Common syntax groups
    sym"@variable"      { Identifier },
    sym"@function"      { Function },
    sym"@function.call" { Function },
    sym"@operator"      { Statement },
    sym"@keyword"       { Statement },
    sym"@number"        { Constant },
    sym"@boolean"       { Constant },
    sym"@string"        { String },
    sym"@method"        { Function },
    sym"@property"      { Identifier },

    -- Additional UI elements
    Pmenu        { bg = colors.bg_100, fg = colors.text_200 },
    PmenuSel     { bg = colors.accent_pro_000, fg = colors.oncolor_100 },
    PmenuSbar    { bg = colors.bg_400 },
    PmenuThumb   { bg = colors.accent_pro_100 },
    
    TabLine      { bg = colors.bg_100, fg = colors.text_300 },
    TabLineSel   { bg = colors.bg_000, fg = colors.text_100 },
    TabLineFill  { bg = colors.bg_400 },

    Folded       { bg = colors.bg_100, fg = colors.text_300 },
    FoldColumn   { bg = colors.bg_000, fg = colors.text_400 },

    DiffAdd      { bg = colors.accent_secondary_100.lighten(50), fg = colors.text_200 },
    DiffChange   { bg = colors.accent_pro_000.lighten(50), fg = colors.text_200 },
    DiffDelete   { bg = colors.accent_pro_200.lighten(50), fg = colors.text_200 },
    DiffText     { bg = colors.accent_pro_100, fg = colors.oncolor_100 },

    SpellBad     { gui = "undercurl", sp = colors.accent_pro_200 },
    SpellCap     { gui = "undercurl", sp = colors.accent_pro_000 },
    SpellRare    { gui = "undercurl", sp = colors.accent_secondary_100 },
    SpellLocal   { gui = "undercurl", sp = colors.accent_pro_100 },
  }
end)

-- Debug information
for group, colors in pairs(theme) do
  print(group, vim.inspect(colors))
end

return theme
