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
  '', -- Snippet
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

local statusTwo, cmp = pcall(require, "cmp")
if (not statusTwo) then return end
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

local function formatForTailwindCSS(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
    if r then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
      end
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs( -4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item = formatForTailwindCSS(entry, vim_item)
        return vim_item
      end
    })
  }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.tailwindcss.setup { capabilities = capabilities }

nvim_lsp.jsonls.setup {
  filetypes = { "json", "jsonc" },
  cmd = { "vscode-json-language-server", "--stdio" },
  capabilities = capabilities,
}

nvim_lsp.html.setup {
  filetypes = { "html" },
  cmd = { "vscode-html-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  filetypes = { "css", "scss", "less", "html",
    "javascriptreact", "javascript.jsx",
    "typescriptreact", "typescript.tsx" },
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.ltex.setup {
  filetypes = { "bib", "gitcommit", "org", "plaintex",
    "rst", "rnoweb", "tex", "pandoc" },
  cmd = { "ltex-ls"}
}

nvim_lsp.pyright.setup {
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.rust_analyzer.setup {
  filetypes = { "rust" },
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  capabilities = capabilities
}

nvim_lsp.prismals.setup {
  filetypes = { "prisma" },
  cmd = { "prisma-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx", "typescript",
    "typescriptreact", "typescript.tsx"
  },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          tab_width = "2",
          continuation_indent = "2",
        }
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' }
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
    virtual_text = { spacing = 2, prefix = "●" }
  })

vim.lsp.handlers['textdocument/signaturehelp'] =
  vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
    virtual_text = { spacing = 2, prefix = "●" }
  })

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    border = 'rounded',
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 2, prefix = "●" },
    severity_sort = true
  })

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  update_in_insert = true,
  float = {
    source = "always" -- Or "if_many"
  }
})

vim.cmd [[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]]
