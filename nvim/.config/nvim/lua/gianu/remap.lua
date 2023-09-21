-- This keymaps is borrowed from ThePrimeagen
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- usefull in vertical inserting where <C-c> and <ESC> works differently
vim.keymap.set("i", "<C-c>", "<ESC>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- This is GiaNU's Vim Configuration
-- vim:set ts=2 sts=2 sw=2 expandtab:
--

-- move this to remaps
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")

vim.keymap.set("n", "<leader><leader>", "<C-^>")
vim.keymap.set("n", ",,", "<C-^>")

-- Be a good vim user, do not use directional keys
vim.keymap.set("n", "<Left>", function() print("no!") end)
vim.keymap.set("i", "<Left>", function() print("no!") end)
vim.keymap.set("n", "<Right>", function() print("no!") end)
vim.keymap.set("i", "<Right>", function() print("no!") end)
vim.keymap.set("n", "<Up>", function() print("no!") end)
vim.keymap.set("i", "<Up>", function() print("no!") end)
vim.keymap.set("n", "<Down>", function() print("no!") end)
vim.keymap.set("i", "<Down>", function() print("no!") end)

vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<cr>")
