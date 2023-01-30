local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

telescope.setup {
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["t"] = actions.select_tab,
        ["h"] = actions.select_horizontal,
        ["v"] = actions.select_vertical
      },
    },
  },
}
-- Grep files
vim.keymap.set('n', '<leader>rf',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
-- Grep live
vim.keymap.set('n', '<leader>rg', function()
  builtin.live_grep()
end)
-- Grep tags
vim.keymap.set('n', '<leader>rt', function()
  builtin.help_tags()
end)
-- Grep resume
vim.keymap.set('n', '<leader>rr', function()
  builtin.resume()
end)
-- Grep diagnostics
vim.keymap.set('n', '<leader>rd', function()
  builtin.diagnostics()
end)
-- vim.keymap.set('n', '<leader>gb', function()
--   builtin.buffers()
-- end)
