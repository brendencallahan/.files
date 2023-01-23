local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
}

vim.keymap.set('n', '<leader>zm', '<cmd>ZenMode<cr>', { silent = true })
