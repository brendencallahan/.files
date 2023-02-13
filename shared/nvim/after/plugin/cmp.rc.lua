local status, cmp = pcall(require, "cmp")
if (not status) then return end
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
    completion = cmp.config.window.bordered({
    }),
    documentation = cmp.config.window.bordered({
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
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
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
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
    completion = cmp.config.window.bordered({
    }),
    documentation = cmp.config.window.bordered({
    }),
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  window = {
    completion = cmp.config.window.bordered({
    }),
    documentation = cmp.config.window.bordered({
    }),
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tailwindcss'].setup {
  capabilities = capabilities
}
require('lspconfig')['cssls'].setup {
  capabilities = capabilities
}
require('lspconfig')['pylsp'].setup {
  capabilities = capabilities
}
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}
require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities
}

vim.cmd [[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]]
