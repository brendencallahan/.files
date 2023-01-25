-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = 'right',
    width = 15,
    adaptive_size = false,
    mappings = {
      list = {
        { key = "o", action = "cd" },
        { key = "<C-v>", action = "vsplit" },
        { key = "<C-h>", action = "split" },
        { key = "<C-t>", action = "tabnew" },
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = false,
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>ff', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<leader>fl', ':NvimTreeResize -5<CR>')
vim.keymap.set('n', '<leader>fh', ':NvimTreeResize +5<CR>')
