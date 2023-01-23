local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

-- local function telescope_buffer_dir()
--   return vim.fn.expand('%:p:h')
-- end

-- local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["t"] = actions.select_tab,
        ["h"] = actions.select_horizontal,
        ["v"] = actions.select_vertical
      },
    },
  },
  --extensions = {
  --  file_browser = {
  --    initial_mode = "normal",
  --    theme = "dropdown",
  --    -- disables netrw and use telescope-file-browser in its place
  --    hijack_netrw = true,
  --    mappings = {
  --      -- your custom insert mode mappings
  --      ["n"] = {
  --        -- your custom normal mode mappings
  --        ["a"] = fb_actions.create,
  --        ["r"] = fb_actions.rename,
  --        ["d"] = fb_actions.remove,
  --        ["c"] = fb_actions.copy,
  --        ["m"] = fb_actions.move,
  --        ["u"] = fb_actions.goto_parent_dir,
  --      },
  --    },
  --  },
  --},
}

--telescope.load_extension("file_browser")

vim.keymap.set('n', '<leader>rf',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', '<leader>rl', function()
  builtin.live_grep()
end)
-- vim.keymap.set('n', '<leader>gb', function()
--   builtin.buffers()
-- end)
vim.keymap.set('n', '<leader>rh', function()
  builtin.help_tags()
end)
vim.keymap.set('n', '<leader>rr', function()
  builtin.resume()
end)
vim.keymap.set('n', '<leader>rd', function()
  builtin.diagnostics()
end)
--vim.keymap.set("n", "<leader>f", function()
--  telescope.extensions.file_browser.file_browser({
--    path = "%:p:h",
--    cwd = telescope_buffer_dir(),
--    respect_gitignore = false,
--    hidden = true,
--    grouped = true,
--    -- previewer = false,
--    initial_mode = "normal",
--    layout_config = { height = 20 }
--  })
-- end)
