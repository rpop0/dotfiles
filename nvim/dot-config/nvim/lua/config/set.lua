vim.opt.nu = true
vim.opt.relativenumber = true

-- Execute .nvim.lua
vim.opt.exrc = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"


vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "set colorcolumn=120"
})

vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]

vim.g.loaded_python3_provider = 0

vim.g.mapleader = " "

vim.opt.spell = true

-- Set conceal level, primarily for orgmode
vim.opt.conceallevel = 2
vim.opt.jumpoptions = 'stack'
