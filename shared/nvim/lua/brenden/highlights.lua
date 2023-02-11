vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 0
vim.opt.background = 'dark'

-- highlight yanked text for 250ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=250})
  augroup END
]]


