require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "none"
  },
  padding = ' ',
  hi_parameter = 'LspReferenceText',
  hint_enable = false -- for panda emoji next to parameters
})
