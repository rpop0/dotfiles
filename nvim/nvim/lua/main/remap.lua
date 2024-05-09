vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File list"})


-- Allows moving selected blocks in visual mode up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When joining the line below with J, cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the center when jumping with CTRL+d/u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Leader P deletes a highligted word without yanking it.
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste over selection without yanking"})
vim.keymap.set("x", "<leader>x", "\"_d", { desc = "Delete selection without yanking."})

-- Leader y yanks into system clipboard
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank selection into system clipboard."})
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank line into system clipboard"})
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank into system clipboard"})


vim.keymap.set("n", "Q", "<nop>")

-- Start replacing word you are on
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace current word'})


vim.keymap.set('n', '<C-W>1', '1<C-W>w', {desc = "Window 1"})
vim.keymap.set('n', '<C-W>2', '2<C-W>w', {desc = "Window 2"})
vim.keymap.set('n', '<C-W>3', '3<C-W>w', {desc = "Window 3"})
vim.keymap.set('n', '<C-W>4', '4<C-W>w', {desc = "Window 4"})
vim.keymap.set('n', '<C-W>5', '5<C-W>w', {desc = "Window 5"})
vim.keymap.set('n', '<C-W>6', '6<C-W>w', {desc = "Window 6"})
vim.keymap.set('n', '<C-W>7', '7<C-W>w', {desc = "Window 7"})
vim.keymap.set('n', '<C-W>8', '8<C-W>w', {desc = "Window 8"})
vim.keymap.set('n', '<C-W>9', '9<C-W>w', {desc = "Window 9"})

