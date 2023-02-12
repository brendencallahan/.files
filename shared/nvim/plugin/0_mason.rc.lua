local status, mason = pcall(require, "mason")
local mason_dap = require('mason-nvim-dap')
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
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

lspconfig.setup {
  automatic_installation = true
}
