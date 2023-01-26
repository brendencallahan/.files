local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#2d2c35',
      title_bg = '#2d2c35'
    }
  },
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "h",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-d>",
    scroll_up = "<C-u>",
  },
  definition_action_keys = {
    quit = 'q',
    close = '<Esc>',
  },
  rename_action_keys = {
    quit = '<C-c>',
    exec = '<CR>'
  }
})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>pl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>ph', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>d', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<leader>k', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', '<leader>pd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>pD', '<Cmd>Lspsaga goto_definition<CR>', opts)
--vim.keymap.set('n', '<leader>rnl', '<Cmd>Lspsaga rename<CR>', opts)
--vim.keymap.set('n', '<leader>rng', '<Cmd>Lspsaga rename ++project<CR>', opts)
vim.keymap.set({ 'n', 't' }, '<leader>tt', '<Cmd>Lspsaga term_toggle<CR>', opts)

-- code action
local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })
