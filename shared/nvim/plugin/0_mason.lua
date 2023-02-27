local status, mason = pcall(require, "mason")
local mason_dap = require('mason-nvim-dap')
if (not status) then return end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
local status3, null_ls = pcall(require, "null-ls")
if (not status3) then return end
local status4, mason_null_ls = pcall(require, "mason-null-ls")
if (not status4) then return end

mason.setup()

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.black,
    null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.diagnostics.eslint_d.with({
    --   diagnostics_format = '[eslint] #{m}\n(#{c})'
    -- }),
    null_ls.builtins.diagnostics.zsh
  },
  -- ensure_installed = {
  --     },
}

mason_null_ls.setup({
  ensure_installed = {
    -- Opt to list sources here, when available in mason.
    'prettierd',
    'black',
    'gitsigns',
    -- 'eslint_d'
  },
  automatic_installation = true,
  automatic_setup = false,
})

mason_dap.setup({
  ensure_installed = {
    'python',
    'cppdbg',
    'bash',
  },
  automatic_setup = true
})

mason_dap.setup_handlers()

mason_lspconfig.setup {
  ensure_installed = {
    "tailwindcss",
    "jsonls",
    "html",
    "cssls",
    "texlab",
    "pyright",
    "rust_analyzer",
    "prismals",
    -- "tsserver",
    "lua_ls",
    "bashls",
  },
  automatic_installation = { exclude = { "tsserver" } }
}

local opts = { noremap = true, silent = true }

-- Format on keypress
vim.keymap.set('n', '<leader>fs', function() vim.lsp.buf.format { async = true } end, opts)

-- ensure_installed = {
--   "gitsigns",
--   "black",
--   "cpptools",
--   "css-lsp",
--   "debugpy",
--   "eslint_d",
--   "html-lsp",
--   "json-lsp",
--   "lua-language-server",
--   "markdownlint",
--   "prettierd",
--   "prisma-language-server",
--   "pyright",
--   "rust-analyzer",
--   "tailwindcss-language-server",
--   "texlab",
--   "typescript-language-server",
-- }
