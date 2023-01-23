local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<leader>gc",
    -- Open file/folder in git repository
    browse = "<leader>go",
  }
})
