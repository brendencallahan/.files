local ls = require 'luasnip'
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep
-- local types = require 'luasnip.util.types'

ls.add_snippets("tex", {
  s({ trig = ";a", snippetType = "autosnippet" },
    {
      t("\\alpha"),
    }
  ),
  s({ trig = ";b", snippetType = "autosnippet" },
    {
      t("\\beta"),
    }
  ),
  s({ trig = ";g", snippetType = "autosnippet" },
    {
      t("\\gamma"),
    }
  ),
  -- Examples of complete snippets using fmt and fmta
  s({ trig = ";in", dscr = "Inline math mode", snippetType = "autosnippet" },
    fmta(
      "$<>$",
      { i(1) }
    )
  ),
  -- \texttt
  s({ trig = ";tt", dscr = "Normal text in math mode", snippetType = "autosnippet" },
    fmta(
      "\\texttt{<>}",
      { i(1) }
    )
  ),
  -- \frac
  s({ trig = ";ff", dscr = "Fraction", snippetType = "autosnippet" },
    fmt(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2)
      },
      { delimiters = "<>" } -- manually specifying angle bracket delimiters
    )
  ),
  -- Equation
  s({ trig = ";el", dscr = "Multiline math mode with label", snippetType = "autosnippet" },
    fmta(
      [[
       \begin{equation}
           <>
       \end{equation}
     ]],
      { i(1) }
    )
  ),
  s({ trig = ";enl", dscr = "Multiline math mode with no label", snippetType = "autosnippet" },
    fmta(
      [[
      \[
           <>
      \]
     ]],
      { i(1) }
    )
  ),
})
