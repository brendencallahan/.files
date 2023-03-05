local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

packer.startup(function(use)
  -- use 'folke/zen-mode.nvim'
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-surround'
  use 'akinsho/toggleterm.nvim'

  -- Colors/Menus
  use {
    'rebelot/kanagawa.nvim',
    commit = '476eb22'
  }
  use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  use 'mechatroner/rainbow_csv'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'NvChad/nvim-colorizer.lua'    -- Preview colors (like hex code as background)
  use {
    'nvim-tree/nvim-tree.lua',       -- File explorer
    requires = {
      'kyazdani42/nvim-web-devicons' -- icons
    }
  }
  use 'lukas-reineke/indent-blankline.nvim' -- Highlights vertical bars indicating scope
  -- use 'echasnovski/mini.nvim' -- Underline occurences of word

  -- Status lines/Live grep
  use 'akinsho/bufferline.nvim'       -- Menu for buffer navigation
  use 'nvim-lualine/lualine.nvim'     -- Statusline on bottom
  use 'nvim-telescope/telescope.nvim' -- Popup menu for ripgrepping

  -- Debugger
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use 'jay-babu/mason-nvim-dap.nvim'

  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Language server
  use 'williamboman/mason.nvim'           -- Automagically setup lsp servers
  use 'williamboman/mason-lspconfig.nvim' -- help automagic work
  use 'jay-babu/mason-null-ls.nvim'
  use 'nvim-lua/plenary.nvim'             -- helper lua functions for plugins
  use 'onsails/lspkind.nvim'              -- VSCode like icons for lsp
  use 'glepnir/lspsaga.nvim'              -- LSP UIs

  -- Autocompletion
  use 'neovim/nvim-lspconfig'               -- easier configs
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- display function signatures (params)
  use 'hrsh7th/cmp-nvim-lsp'                -- neovim's LSP
  use 'hrsh7th/cmp-path'                    -- file paths
  use 'hrsh7th/cmp-buffer'                  -- buffer words
  use 'hrsh7th/cmp-cmdline'                 -- command line
  use 'hrsh7th/nvim-cmp'                    -- Completion

  -- Convenient 'dumb' autocomplete
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use {
    'numToStr/Comment.nvim',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  }
  use 'lewis6991/gitsigns.nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end
  }

  -- Markdown previewer
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use 'lervag/vimtex'

  -- Alternative to cmp-nvim-lsp-signature-help
  -- use 'ray-x/lsp_signature.nvim'

  -- (free) Alternative to copilot
  -- Be sure to run :Codeium Auth
  -- use { 'Exafunction/codeium.vim',
  -- config = function()
  -- Change '<C-g>' here to any keycode you like.
  -- vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  -- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  -- end }
  if Packer_bootstrap then
    packer.sync()
  end
end)

-- vim.api.nvim_exec(
--   [[
--   augroup packer_ide_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]],
--   false
-- )
