-- Keys mapping
vim.keymap.set("n", "<C-n>", ":bn<CR>") -- Next buffer
vim.keymap.set("n", "<C-b>", ":bp<CR>") -- Previous buffer
vim.keymap.set("n", "0", "^") -- 0 to go to the beginning of line
vim.keymap.set("n", "<C-q>", "ddkP") -- bubble line up
vim.keymap.set("n", "<C-w>", "ddp") -- bubble line down 
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- back to middle when page up
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- back to middle when page down 
-- vim.keymap.set({"n", "v", "i"}, "<C-h>", "<C-w>h") -- go to left window
-- vim.keymap.set({"n", "v", "i"}, "<C-j>", "<C-w>j") -- go to left window
-- vim.keymap.set({"n", "v", "i"}, "<C-k>", "<C-w>k") -- go to left window
-- vim.keymap.set({"n", "v", "i"}, "<C-l>", "<C-w>l") -- go to left window

-- From primegean
vim.g.mapleader = " " -- leader key on space
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- go to Ex page
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- bubble lines down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- bubble lines up in visual mode
vim.keymap.set("n", "J", "mzJ`z") -- add next line behind this one
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- go down with middle screen
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- go up with middle screen
vim.keymap.set("n", "n", "nzzzv") -- search next and middle screen
vim.keymap.set("n", "N", "Nzzzv") -- search last and middle screen
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste register without losing it
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- yank in system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- only in vim normal mode
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete to the void register
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete to the void register
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace all occurences
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- chmod execute the file (bash)
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/elalitte/lazy.lua<CR>"); -- open lazy file to install plugins
vim.keymap.set("n", "<leader><leader>", function() -- source file
    vim.cmd("so")
end)

-- maison
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>") -- toogle nvim.tree

