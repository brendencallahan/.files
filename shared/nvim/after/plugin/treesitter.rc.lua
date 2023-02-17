local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  auto_install = false,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "c",
    "css",
    "d",
    "dockerfile",
    "gitignore",
    "html",
    "javascript",
    "json",
    -- "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "prisma",
    "python",
    "regex",
    "rust",
    "sql",
    "tsx",
    "toml",
    "typescript",
    "yaml",
  },
}
