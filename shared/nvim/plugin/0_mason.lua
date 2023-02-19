local status, mason = pcall(require, "mason")
local mason_dap = require('mason-nvim-dap')
if (not status) then return end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup()

mason_dap.setup({
  ensure_installed = {
    'python',
    'cppdbg',
  },
  automatic_setup = true
})

mason_dap.setup_handlers()

mason_lspconfig.setup {
  automatic_installation = true
}

local opts = { noremap = true, silent = true }

-- Format on keypress
vim.keymap.set('n', '<leader>fs', function() vim.lsp.buf.format { async = true } end, opts)
