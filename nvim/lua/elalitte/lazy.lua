-- Use Lazy.nvim for plugin management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}

-- Lazy.nvim plugin list
local plugins = {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-commentary',
  'ctrlpvim/ctrlp.vim',
  'mattn/emmet-vim',
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'ellisonleao/gruvbox.nvim', priority = 1000 },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "vue", "yaml", "typescript", "sql", "php", "json", "bash" },
          sync_install = false,
          highlight = { enable = true },
        indent = { enable = true },
        })
    end
  },
  {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
  },
  {
    "ggandor/leap.nvim",
    init = function() require("leap").set_default_keymaps() end
  },
}
require("lazy").setup(plugins, opts)
