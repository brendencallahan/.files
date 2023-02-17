local ls = require 'luasnip'
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local types = require 'luasnip.util.types'
ls.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = false,
})

ls.add_snippets("all", {
  -- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
  -- \item as necessary by utilizing a choiceNode.
  s("expand", {t("this is a snippet")}),
}, {
  key = "all",
})
