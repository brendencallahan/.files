local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- keymap.set('n', '+', '<C-a>')
-- keymap.set('n', '-', '<C-x>')

-- Registers
--yank selection to clipboard
keymap.set('n', '<leader>yc', '"+y')
keymap.set('v', '<leader>yc', '"+y')
keymap.set('n', '<leader>Yc', '"+Y')
keymap.set('v', '<leader>Yc', '"+Y')
-- paste clipboard
keymap.set('n', '<leader>pc', '"+p')
keymap.set('n', '<leader>Pc', '"+P')
-- paste most recent yank, 'd', 'x', etc. doesn't overwrite
keymap.set('n', '<leader>py', '"0p')
keymap.set('n', '<leader>Py', '"0P')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save all
keymap.set('n', '<leader>w', ':w<CR>')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>')

-- Rename
keymap.set('n', '<leader>rnl', ':%s/<c-r><c-w>/<c-r><c-w>')
keymap.set('n', '<leader>rng', ':%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i')

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
