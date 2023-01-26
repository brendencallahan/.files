-- Lua
require('onedark').setup {
  style = 'dark',
  transparent = 'true',

  lualine = {
    transparent = 'true'
  },
  highlights = {
    visual = { bg = '#fbf1c7', fmt = 'bold' }, --bg = '#fbf1c7'
    cursorLine = { fg = '#fbf1c7' },
  },
}
require('onedark').load()
