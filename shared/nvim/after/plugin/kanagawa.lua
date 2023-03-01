-- setup must be called before loading the colorscheme
-- Default options:
local default_colors = require('kanagawa.colors').setup()

local my_colors = {
  bg = '#2d2c35',
  samuraiRed = default_colors.peachRed,
}

local overrides = {
  IndentBlanklineChar = { fg = 'NONE' },
  Visual = { bg = '#171821', bold = true },
  CursorLine = { bg = '#171821' },
  CursorLineNr = { bg = 'NONE', bold = true },
  SignColumn = { bg = '#2d2c35' },
  Terminal = { bg = '#2d2c35' },
  Pmenu = { bg = '#2d2c35' },
  PmenuSbar = { bg = '#2d2c35' },
  PmenuSel = { bg = '#2d2c35' },
  PmenuThumb = { bg = '#2d2c35' },
  WildMenu = { bg = '#2d2c35' },
  Normal = { bg = '#2d2c35' },
  NormalFloat = { bg = '#2d2c35' },
  FloatBorder = { bg = '#2d2c35' },
  DiagnosticError = { italic = false },
  -- DiagnosticUnderlineError = { undercurl = true, sp = colors.peachRed },
  DiagnosticWarn = { italic = false },
  DiagnosticInfo = { italic = false },
  DiagnosticHint = { italic = false },
  -- Delimiter = { fg = '#45878a', bold = false, italic = false },
  MatchParen = { fg = '#45878a', bg = '#171821', italic = false, bold = false },
  Comment = { italic = true },
  ["@text.emphasis"] = { italic = false },
  ["@tag"] = { link = "Keyword", italic = false },
}

require("kanagawa").setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = { italic = false },
  keywordStyle = { italic = false },
  statementStyle = { bold = true },
  typeStyle = { italic = false },
  variablebuiltinStyle = { italic = false },
  specialReturn = false, -- special highlight for the return keyword
  specialException = false,
  dimInactive = false,
  transparent = true,
  overrides = overrides,
  colors = my_colors,
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme kanagawa]])
