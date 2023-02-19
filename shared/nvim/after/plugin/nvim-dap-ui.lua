local dapui = require('dapui')
local dap = require('dap')

dapui.setup()

vim.keymap.set('n', '<leader>do', function() dapui.open() end)

vim.keymap.set('n', '<leader>dq', function() dapui.close() end)

vim.keymap.set('n', '<leader>dt', function() dapui.toggle() end)

-- vim.keymap.set('n', '<leader>df', function() dapui.float_element() end)

vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)

vim.keymap.set('n', '<leader>dsi', function() dap.step_into() end)

vim.keymap.set('n', '<leader>dso', function() dap.step_over() end)

vim.keymap.set('n', '<leader>dc', function() dap.continue() end)

-- Open/Close automagically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
