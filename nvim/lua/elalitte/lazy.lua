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
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-commentary',
  'ctrlpvim/ctrlp.vim',
  'mattn/emmet-vim',
  'scrooloose/syntastic',
  'vim-scripts/AutoComplPop',
  'storyn26383/vim-vue',
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
}
}
require("lazy").setup(plugins, opts)