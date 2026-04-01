vim.cmd('packadd nvim.undotree')
vim.keymap.set("n", "<leader>u", vim.cmd.Undotree, { desc = "Undotree"})
