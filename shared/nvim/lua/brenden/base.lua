vim.cmd("autocmd!")

-- Floating windows prettier :)
vim.api.nvim_set_hl(0, "PmenuSel", {  bg = "#2d2c35", fg = "NONE"})
vim.api.nvim_set_hl(0, "PMenu", {  bg = "#2d2c35", fg = "NONE"})
vim.api.nvim_set_hl(0, "Normal", { bg = "#2d2c35", fg = "NONE"})
vim.api.nvim_set_hl(0, "FloatBorder", {  bg = "#2d2c35", fg = "NONE"})

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'


vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'nosplit'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

