-- Configuring bufferline
require("bufferline").setup{}
local bufferline = require('bufferline')
bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.slant
    }
})
vim.o.background = "dark" -- or "light" for light mode
