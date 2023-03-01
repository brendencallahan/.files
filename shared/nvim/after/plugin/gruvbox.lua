-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {
    dark0 = '#2d2c35',
  },
  overrides = {
    IndentBlanklineContextStart = { sp = '#c79194' },
    IndentBlanklineContextChar = { fg = '#c79194' },
    IndentBlanklineChar = { fg = 'NONE' },
    Visual = { bg = '#171821', bold = true },
    CursorLine = { bg = '#171821' },
    CursorLineNr = { fg = '#c79194', bg = 'NONE', bold = true },
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
    -- DiagnosticVirtualTextError = { bg = '#2d2c35' },
    -- DiagnosticVirtualTextWarn = { bg = '#2d2c35' },
    -- DiagnosticVirtualTextInfo = { bg = '#2d2c35' },
    -- DiagnosticVirtualTextHint = { bg = '#2d2c35' },
    Delimiter = { fg = '#45878a' },
    MatchParen = { fg = '#45878a', bg = '#171821' },
    Comment = { italic = true },
  },
  dim_inactive = false,
  transparent_mode = true,
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
