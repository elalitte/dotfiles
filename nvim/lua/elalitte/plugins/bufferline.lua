-- Configuring bufferline
require("bufferline").setup{}
local bufferline = require('bufferline')
bufferline.setup({
    options = {
	themeable = true,
	numbers = "none",
        style_preset = bufferline.style_preset.slant,
	separator_style = "slant",
    	offsets = {
    	    {
    	        filetype = "NvimTree",
    	        text = "File Explorer",
    	        highlight = "Directory",
    	        separator = true -- use a "true" to enable the default, or set your own character
    	    }
    	},
	-- highlights = {
	-- 	fill = {
	-- 		guifg = { attribute = "fg", highlight = "#ff0000" },
	-- 		guibg = { attribute = "bg", highlight = "#ff0000" },
	-- 	},
	-- 	separator = {
	-- 		guifg = { attribute = "bg", highlight = "TabLine" },
	-- 		guibg = { attribute = "bg", highlight = "TabLine" },
	-- 	},
	-- 	separator_selected = {
	-- 		guifg = { attribute = "bg", highlight = "Normal" },
	-- 		guibg = { attribute = "bg", highlight = "Normal" },
	-- 	},
	-- 	buffer_selected = { bg = 'NONE', bold = true, italic = false },
	-- },
    },
})
vim.o.background = "dark" -- or "light" for light mode
