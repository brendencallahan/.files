local keymap = vim.keymap
local silentOpts = { silent = true, nowait = true, noremap = true }
local loudOpts = { nowait = true, noremap = true }

-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Deleting character doesn't overwrite delete buffer
keymap.set('n', 'x', '"_x', silentOpts)
keymap.set('v', 'x', '"_x', silentOpts)

-- Termcodes (special characters + emojis)
vim.api.nvim_replace_termcodes('<C-U>', true, false, true)

-- Spell Check toggle
keymap.set('n', '<leader>s', function()
  vim.cmd [[
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
  ]]
end, loudOpts)
keymap.set('n', '<leader>S', 'z=', silentOpts)
-- Escape in insert mode
keymap.set('i', 'df', '<esc>', silentOpts)

-- Registers
--yank selection to clipboard
keymap.set('n', '<leader>cy', '"+y', silentOpts)
keymap.set('v', '<leader>cy', '"+y', silentOpts)
keymap.set('n', '<leader>cY', '"+Y', silentOpts)
keymap.set('v', '<leader>cY', '"+Y', silentOpts)
-- paste clipboard
keymap.set('n', '<leader>cp', '"+p', silentOpts)
keymap.set('n', '<leader>cP', '"+P', silentOpts)
-- paste most recent yank, 'd', 'x', etc. doesn't overwrite
keymap.set('n', '<leader>py', '"0p', silentOpts)
keymap.set('n', '<leader>Py', '"0P', silentOpts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', silentOpts)

-- Save all
keymap.set('n', '<leader>w', ':w<CR>', silentOpts)

-- Rename (with confirmation)
-- substring
keymap.set('n', '<leader>rs', ':%s/<c-r><c-w>/&/gc<left><left><left>', loudOpts)
-- word
keymap.set('n', '<leader>rn', ':%s/\\<<c-r><c-w>\\>/&/gc<left><left><left>', loudOpts)
--visual selection
keymap.set('v', 's', ':s//&/gc<left><left><left><left><left>', loudOpts)
-- disable highlighting until next search
keymap.set('n', '<CR>', ':noh<CR><CR>', silentOpts)

-- Close buffer
keymap.set('n', '<leader>q', ':q<CR>', silentOpts)
keymap.set('n', '<leader>!', ':q!<CR>', silentOpts)

-- Marks
keymap.set('n', '<leader>pn', '<C-I>', silentOpts)
keymap.set('n', '<leader>pp', '<C-o>', silentOpts)
keymap.set('n', '<leader>m', '`', loudOpts)
keymap.set('n', '<leader>mn', ':mark ', loudOpts)
keymap.set('n', '<leader>md', ':delmarks ', loudOpts)
keymap.set('n', '<leader>ml', ':marks<CR>', loudOpts)

-- Tab creation/navigation
keymap.set('n', '<leader>tn', ':tabedit<space>', loudOpts)
keymap.set('n', '<leader>tq', ':tabclose<CR>', silentOpts)
keymap.set('n', '<leader>th', 'gT', silentOpts)
keymap.set('n', '<leader>tl', 'gt', silentOpts)

-- Split window
keymap.set('n', '<leader>sh', ':split<Return><C-w>w', silentOpts)
keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', silentOpts)

-- Resize window
keymap.set('n', '<leader>rl', '<C-w><', silentOpts)
keymap.set('n', '<leader>rh', '<C-w>>', silentOpts)
keymap.set('n', '<leader>rk', '<C-w>+', silentOpts)
keymap.set('n', '<leader>rj', '<C-w>-', silentOpts)

-- Move window
keymap.set('n', '<leader>x', '<C-w>x', silentOpts)
keymap.set('n', '<leader>rL', '<C-w>L', silentOpts)
keymap.set('n', '<leader>rH', '<C-w>H', silentOpts)
keymap.set('n', '<leader>rK', '<C-w>K', silentOpts)
keymap.set('n', '<leader>rJ', '<C-w>J', silentOpts)

-- Move to window
keymap.set('n', '<leader><Space>', '<C-w>w', silentOpts)
keymap.set('', '<leader>h', '<C-w>h', silentOpts)
keymap.set('', '<leader>k', '<C-w>k', silentOpts)
keymap.set('', '<leader>j', '<C-w>j', silentOpts)
keymap.set('', '<leader>l', '<C-w>l', silentOpts)

-- LaTeX stuff
vim.cmd[[let g:tex_flavor='latex']]
vim.cmd[[let g:vimtex_view_method='general']]
vim.cmd[[let g:vimtex_quickfix_mode=0]]
vim.cmd[[set conceallevel=1]]
vim.cmd[[let g:tex_conceal='abdmg']]
