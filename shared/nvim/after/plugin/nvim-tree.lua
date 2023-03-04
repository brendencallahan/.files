-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = 'right',
    width = 20,
    preserve_window_proportions = true,
    adaptive_size = false,
    mappings = {
      list = {
        { key = "o", action = "cd" },
        { key = "v", action = "vsplit" },
        { key = "h", action = "split" },
        { key = "t", action = "tabnew" },
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = false,
    highlight_opened_files = 'icon',
    indent_width = 1,
    icons = {
      webdev_colors = true,
    }
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>ff', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<leader>fl', ':NvimTreeResize -5<CR>')
vim.keymap.set('n', '<leader>fh', ':NvimTreeResize +5<CR>')

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
