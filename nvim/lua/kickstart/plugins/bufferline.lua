return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {}
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        themeable = true,
        numbers = 'none',
        separator_style = 'slant',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
        -- indicator = {
        --   style = 'underline',
        -- },
      },
      highlights = {
        buffer_selected = {
          fg = '#ff0000',
          bg = '#24283B',
          bold = true,
          italic = true,
        },
      },
    }
  end,
  -- vim.o.background = "dark" -- or "light" for light mode
}
