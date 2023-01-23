local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<leader>gc",
    quit_blame = "q",
    diff = "<leader>gd",
    diff_close = "<leader>gD",
    -- Open file/folder in git repository
    browse = "<leader>go",
  }
})
