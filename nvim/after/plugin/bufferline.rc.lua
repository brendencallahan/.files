local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#2d2c35',
      bg = '#2d2c35',
    },
    separator_selected = {
      fg = '#2d2c35',
      bg = '#374057',
    },
    background = {
      fg = '#657b83',
      bg = '#2d2c35'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bg = '#374057',
      bold = true,
    },
    fill = {
      bg = '#2d2c35'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
