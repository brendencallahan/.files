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
    Terminal = { bg = '#2d2c35' },
    Pmenu = { bg = '#2d2c35' },
    PmenuSbar = { bg = '#2d2c35' },
    PmenuSel = { bg = '#2d2c35' },
    PmenuThumb = { bg = '#2d2c35' },
    WildMenu = { bg = '#2d2c35' },
    Normal = { bg = '#2d2c35' },
    NormalFloat = { bg = '#2d2c35' },
    FloatBorder = { bg = '#2d2c35' },
    DiagnosticVirtualTextError = { bg = "NONE" },
    DiagnosticVirtualTextWarn = { bg = "NONE" },
    DiagnosticVirtualTextInfo = { bg = "NONE" },
    DiagnosticVirtualTextHint = { bg = "NONE" },
  },
}
require('onedark').load()


-- vim.cmd[[hi def IlluminatedWordText gui=NONE guibg=#171821]]
-- vim.cmd[[hi def IlluminatedWordRead gui=NONE guibg=#171821]]
-- vim.cmd[[hi def IlluminatedWordWrite gui=NONE guibg=#171821]]

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
