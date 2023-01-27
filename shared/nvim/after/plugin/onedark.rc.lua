-- Lua
require('onedark').setup {
  style = 'dark',
  transparent = 'true',

  lualine = {
    transparent = 'true'
  },
  highlights = {
    visual = { bg = '#171821', fmt = 'bold' }, --bg = '#fbf1c7' #5a626f
    cursorLine = { bg = '#171821', fmt = 'bold' },
  },
}
require('onedark').load()
