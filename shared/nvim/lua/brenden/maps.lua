local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- keymap.set('n', '+', '<C-a>')
-- keymap.set('n', '-', '<C-x>')

-- Escape in insert mode
keymap.set('i', 'df', '<esc>')

-- Registers
--yank selection to clipboard
keymap.set('n', '<leader>cy', '"+y')
keymap.set('v', '<leader>cy', '"+y')
keymap.set('n', '<leader>cY', '"+Y')
keymap.set('v', '<leader>cY', '"+Y')
-- paste clipboard
keymap.set('n', '<leader>cp', '"+p')
keymap.set('n', '<leader>cP', '"+P')
-- paste most recent yank, 'd', 'x', etc. doesn't overwrite
keymap.set('n', '<leader>py', '"0p')
keymap.set('n', '<leader>Py', '"0P')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save all
keymap.set('n', '<leader>w', ':w<CR>')

-- Rename
keymap.set('n', '<leader>rs', ':%s/<c-r><c-w>/&/g<left><left>')
keymap.set('n', '<leader>rn', ':%s/\\<<c-r><c-w>\\>/&/g<left><left>')

-- Close buffer
keymap.set('n', '<leader>q', ':q<CR>')
keymap.set('n', '<leader>!', ':q!<CR>')

-- Tab creation/navigation
keymap.set('n', '<leader>tn', ':tabedit')
keymap.set('n', '<leader>tq', ':tabclose<CR>')
keymap.set('n', '<leader>th', 'gT')
keymap.set('n', '<leader>tl', 'gt')

-- Split window
keymap.set('n', '<leader>sh', ':split<Return><C-w>w')
keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<leader><Space>', '<C-w>w')
keymap.set('', '<leader>h', '<C-w>h')
keymap.set('', '<leader>k', '<C-w>k')
keymap.set('', '<leader>j', '<C-w>j')
keymap.set('', '<leader>l', '<C-w>l')

-- Resize window
keymap.set('n', '<leader>rl', '<C-w><')
keymap.set('n', '<leader>rh', '<C-w>>')
keymap.set('n', '<leader>rk', '<C-w>+')
keymap.set('n', '<leader>rj', '<C-w>-')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
