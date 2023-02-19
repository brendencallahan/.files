local tterm    = require('toggleterm')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
    cmd = "lazygit",
    direction = 'float',
    float_opts = {
      border = 'curved'
    },
    hidden = true,
  })

function _Lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })

tterm.setup({
  direction = 'float',
  float_opts = {
    border = 'curved'
  },
  shade_terminals = false,
})

vim.cmd [[
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><leader>tt <Cmd>exe v:count1 . "ToggleTerm"<CR>
]]

vim.cmd [[
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><leader>tq <C-d>
]]

vim.cmd [[nnoremap <silent><leader>tt <Cmd>exe v:count1 . "ToggleTerm"<CR>]]
