local status, nt = pcall(require, "nvim-tree")
if (not status) then return end

nt.setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "t", action = "tabnew" },
        { key = "ss", action = "split" },
        { key = "sv", action = "vsplit" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  }
}

vim.keymap.set('n', ';a', ':NvimTreeToggle<CR>')
