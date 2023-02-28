-- require("nightfox").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   options = {
--     transparent = true, -- Enable this to disable setting the background color
--     terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--     styles = {
--       -- Style to be applied to different syntax groups
--       -- Value is any valid attr-list value for `:help nvim_set_hl`
--       comments = 'NONE',
--       conditionals = 'NONE',
--       constants = 'NONE',
--       functions = 'NONE',
--       keywords = 'NONE',
--       numbers = 'NONE',
--       operators = 'NONE',
--       strings = 'NONE',
--       types = 'NONE',
--       variables = 'NONE',
--     },
--     inverse = {
--       match_paren = false,
--     },
--     modules = {
--       cmp = true,
--       dap_ui = true,
--       gitsigns = true,
--       lsp_saga = true,
--       nvimtree = true,
--       telescope = true,
--     }
--   },
--   specs = {
--     all = {
--       syntax = {
--         -- comment = 'NONE',
--       },
--     }
--   },
--   groups = {
--     all = {
--       IndentBlanklineContextStart = { sp = '#9388ce' },
--       IndentBlanklineContextChar = { fg = '#9388ce' },
--       IndentBlanklineChar = { fg = 'NONE' },
--       MatchParen = { fg = '#9388ce' },
--       Visual = { bg = '#171821' },
--       CursorLine = { bg = '#171821' },
--       Terminal = { bg = '#2d2c35' },
--       Pmenu = { bg = '#2d2c35' },
--       PmenuSbar = { bg = '#2d2c35' },
--       PmenuSel = { bg = '#2d2c35' },
--       PmenuThumb = { bg = '#2d2c35' },
--       WildMenu = { bg = '#2d2c35' },
--       Normal = { bg = '#2d2c35' },
--       NormalFloat = { bg = '#2d2c35' },
--       FloatBorder = { bg = '#2d2c35' },
--       DiagnosticVirtualTextError = { bg = '#2d2c35' },
--       DiagnosticVirtualTextWarn = { bg = '#2d2c35' },
--       DiagnosticVirtualTextInfo = { bg = '#2d2c35' },
--       DiagnosticVirtualTextHint = { bg = '#2d2c35' },
--     }
--   },
-- })
--
-- -- Lua
-- vim.cmd [[colorscheme nightfox]]
