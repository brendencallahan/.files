local status, lualine = pcall(require, "lualine")
if (not status) then return end
local custom_theme = require('lualine.themes.auto')

custom_theme.normal.c.bg = 'None'
custom_theme.insert.c = custom_theme.normal.c
custom_theme.visual.c = custom_theme.normal.c
custom_theme.command.c = custom_theme.normal.c
custom_theme.inactive.c = custom_theme.normal.c

lualine.setup {
  options = {
    icons_enabled = true,
    theme = custom_theme, --onedark
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {},
    -- globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff'
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      -- 'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    'nvim-tree',
    'nvim-dap-ui',
    'toggleterm'
  }
}
