vim.opt.termguicolors = true -- use advanced colors
vim.opt.number = true -- show lines numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.showmatch = true -- show search interactively
vim.bo.autoindent = true -- All the follow is for auto indenting
vim.bo.expandtab = true
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.smartindent = true
vim.bo.modeline = false
vim.opt.backspace = [[indent,eol,start]]
vim.opt.hidden = true -- don't show message when go to another buffer if buffer isn't saved
vim.opt.lazyredraw = true -- don't recharge page on macro, etc.
vim.opt.splitbelow = true -- split new window down
vim.opt.splitright = true -- split new window right
vim.wo.cursorline = true -- show actual cursorline
vim.bo.synmaxcol = 4000 -- wrap line only after 4000 chars
vim.o.list = true -- Show non printed characters
vim.o.listchars = 'tab:>~,eol:↵' -- Set non printed character values
vim.o.colorcolumn = "82" -- Color xxx colum
vim.o.wrap = false -- don't wrap lines at end of window
-- vim.cmd[[highlight ColorColumn ctermbg=0 guibg=lightgrey]] -- Color of column
vim.o.clipboard = [[unnamed,unnamedplus]] -- to copy/paste to/from system
vim.o.timeoutlen = 300 -- timeout to wait between keys combination
vim.o.completeopt = [[menuone,noinsert,noselect]] -- options for automatic completion

-- from primegean
vim.opt.hlsearch = false
vim.opt.incsearch = true -- highlight interactive search
vim.opt.scrolloff = 8 -- move screen if less than 8 lines up or down
