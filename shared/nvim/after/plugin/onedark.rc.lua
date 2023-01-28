-- Lua
require('onedark').setup {
  style = 'dark',
  transparent = 'true',

  lualine = {
    transparent = 'true'
  },
  highlights = {
    Visual = { bg = '#171821', fmt = 'bold' }, --bg = '#fbf1c7' #5a626f
    CursorLine = { bg = '#171821', fmt = 'bold' },
    Terminal = { bg = 'NONE', fg = 'NONE' },
    Pmenu = { bg = 'NONE', fg = 'NONE' },
    PmenuSbar = { bg = 'NONE', fg = 'NONE' },
    PmenuSel = { bg = 'NONE', fg = 'NONE' },
    PmenuThumb = { bg = 'NONE', fg = 'NONE' },
    WildMenu = { bg = 'NONE', fg = 'NONE' },
    NormalFloat = { bg = 'NONE', fg = 'NONE' },
    FloatBorder = { bg = 'NONE', fg = 'NONE' },
  },
}
require('onedark').load()

-- Floating windows prettier :)
-- vim.api.nvim_set_hl(0, "PmenuSel", {  bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "PmenuThumb", {  bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "PmenuSbar", {  bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "PMenu", {  bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "Visual", { bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "WildMenu", { bg = "NONE", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "FloatBorder", {  bg = "NONE", fg = "NONE"})
--vim.api.nvim_set_hl(0, "CmpItemMenu", {  bg = "#2d2c35", fg = "NONE"})
--vim.api.nvim_set_hl(0, "CmpItemAbbr", {  bg = "#2d2c35", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {  bg = "#2d2c35", fg = "NONE"})
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {  bg = "#2d2c35", fg = "NONE"})
