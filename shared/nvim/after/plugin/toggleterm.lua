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
  -- direction = 'float',
  float_opts = {
    border = 'curved'
  },
  shade_terminals = false,
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  vim.keymap.set('t', '<leader>tq', [[<C-d>]], opts)
  vim.keymap.set('t', '<leader>tt', [[<Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>]], opts)
  vim.keymap.set('t', '<leader>tv', [[<Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>]], opts)
  vim.keymap.set('t', '<leader>th', [[<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd [[nnoremap <silent><leader>tt <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>]]
vim.cmd [[nnoremap <silent><leader>tv <Cmd>exe v:count1 . "ToggleTerm size=40 direction=vertical"<CR>]]
vim.cmd [[nnoremap <silent><leader>th <Cmd>exe v:count1 . "ToggleTerm size=10 direction=horizontal"<CR>]]
