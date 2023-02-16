local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>"
  },
  request_timeout = 2000,
  finder = {
    jump_to = "o",
    edit = "e",
    vsplit = "v",
    split = "h",
    tabe = "t",
    quit = "q",
  },
  definition = {
    edit = "<C-c>e",
    vsplit = "<C-c>v",
    split = "<C-c>h",
    tabe = "<C-c>t",
    quit = "q",
    close = "<Esc>",
  },
  code_action = {
    num_shortcut = true,
    key = {
      quit = { "q", "<Esc>" },
      exec = { "e", "<CR>" }
    }
  },
  -- Diagnostic
  diagnostic = {
    twice_into = false,
    show_code_action = true,
    show_source = true,
    keys = {
      exec_action = 'e',
      quit = 'q',
    },
  },
  -- Rename
  rename = {
    quit = '<Esc><Esc>',
    exec = '<CR>',
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = false
  },
  -- Outline
  outline = {
    win_position = 'left',
    win_with = '',
    win_width = 20,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = 'o',
      expand_collaspe = 'u',
      quit = '<Esc>',
    },
  },
  -- incoming calls
  callhierarchy = {
    show_detail = false,
    keys = {
      jump = 'o',
      edit = 'e',
      vsplit = 'v',
      split = 'h',
      tabe = 't',
      quit = 'q',
      expand_collaspe = 'u',
    },
  },
  ui = {
    winblend = 0,
    border = 'rounded',
    colors = {
      normal_bg = '#2d2c35',
      title_bg = '#2d2c35'
    }
  },
})

-- Jump diagnostics
vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')

-- Hover
vim.keymap.set('n', '<leader>pf', '<Cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', '<leader>prl', '<Cmd>Lspsaga rename<CR>')
vim.keymap.set('n', '<leader>prg', '<cmd>Lspsaga rename ++project<CR>')
vim.keymap.set('n', '<leader>pd', '<Cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', '<leader>pgd', '<Cmd>Lspsaga goto_definition<CR>')
vim.keymap.set('n', '<leader>pt', '<Cmd>Lspsaga peek_type_definition<CR>')
vim.keymap.set('n', '<leader>pgt', '<Cmd>Lspsaga goto_type_definition<CR>')
vim.keymap.set('n', '<leader>pb', '<Cmd>Lspsaga show_buf_diagnostics<CR>')
vim.keymap.set('n', '<leader>pl', '<Cmd>Lspsaga show_line_diagnostics<CR>')
vim.keymap.set('n', '<leader>pc', '<Cmd>Lspsaga show_cursor_diagnostics<CR>')
vim.keymap.set('n', '<leader>ph', '<Cmd>Lspsaga hover_doc ++quiet<CR>')
vim.keymap.set('n', '<leader>pH', '<Cmd>Lspsaga hover_doc ++keep<CR>')
vim.keymap.set('n', '<leader>po', '<Cmd>Lspsaga outline<CR>')
vim.keymap.set('n', '<leader>ps', '<Cmd>Lspsaga signature_help<CR>')
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
-- vim.keymap.set({ 'n', 't' }, '<leader>tt', '<Cmd>Lspsaga term_toggle<CR>')

-- code action
local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })
