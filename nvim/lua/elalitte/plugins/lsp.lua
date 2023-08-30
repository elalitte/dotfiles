local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'bashls',
    'dockerls',
    'docker_compose_language_service',
    'eslint',
    'jsonls',
    'lua_ls',
    'tailwindcss',
    'volar',
    'yamlls',
  }
})

lsp.setup()
