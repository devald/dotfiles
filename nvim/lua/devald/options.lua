vim.opt.clipboard = 'unnamedplus' -- use global clipboard
vim.opt.colorcolumn = '81' -- show column limit
vim.opt.cursorline = true -- highlight cursor line
vim.opt.expandtab = true -- use spaces to insert a Tab
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- use treesitter as foldexpr
vim.opt.foldmethod = 'expr' -- use foldexpr
vim.opt.ignorecase = true -- search case insensitive
vim.opt.laststatus = 3 -- show single statusline only
vim.opt.mouse = 'n' -- scroll with mouse in Normal mode
vim.opt.number = true -- show line numbers
vim.opt.pumheight = 10 -- show 10 items in the popup menu
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.scrolloff = 10 -- 10 lines keep above and below to the cursor
vim.opt.shiftwidth = 2 -- indent 2 spaces
vim.opt.showmode = false -- don't show mode
vim.opt.sidescroll = 10 -- 10 lines keep left and right to the cursor
vim.opt.smartcase = true -- search case sensitive if pattern has upper case characters
vim.opt.splitbelow = true -- horizontal window split to bottom
vim.opt.splitright = true -- vertical window split to right
vim.opt.swapfile = false -- don't use swapfile
vim.opt.tabstop = 2 -- insert 2 spaces for a Tab
vim.opt.termguicolors = true -- enable 24-bit RGB color
vim.opt.undofile = true -- saves undo history to an undo file
