-- vim.lsp.set_log_level("debug")
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  'ﴯ', -- Class
  '', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '' -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.tailwindcss.setup {capabilities = capabilities}

nvim_lsp.cssls.setup {capabilities = capabilities}

nvim_lsp.pylsp.setup {
  filetypes = {"python"},
  cmd = {"pyright-langserver", "--stdio"},
  capabilities = capabilities
}

nvim_lsp.rust_analyzer.setup {
  filetypes = {"rust"},
  cmd = {"rustup", "run", "stable", "rust-analyzer"},
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx", "typescript",
    "typescriptreact", "typescript.tsx"
  },
  cmd = {"typescript-language-server", "--stdio"},
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      format = {enable = false},
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}

-- Make it look pretty :)
vim.lsp.handlers['textdocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
      virtual_text = {spacing = 2, prefix = "●"}
    })

vim.lsp.handlers['textdocument/signaturehelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
      virtual_text = {spacing = 2, prefix = "●"}
    })

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      border = 'rounded',
      underline = true,
      update_in_insert = false,
      virtual_text = {spacing = 2, prefix = "●"},
      severity_sort = true
    })

-- Diagnostic symbols in the sign column (gutter)
local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

vim.diagnostic.config({
  virtual_text = {prefix = '●'},
  update_in_insert = true,
  float = {
    source = "always" -- Or "if_many"
  }
})
