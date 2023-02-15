vim.g.mapleader = ',' -- remap leader key to space
vim.keymap.set('n', '<leader>p', vim.cmd.Ex) -- open netrw
vim.keymap.set('n', '<leader>w', '<cmd>w!<cr>') -- shortcut for save
vim.keymap.set('n', '<leader>q', '<cmd>q!<cr>', {silent = true}) -- shortcut for quit
vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>', {silent = true}) -- shortcut for buffers
vim.keymap.set('n', '<leader>f', '<cmd>Rg<cr>', {silent = true}) -- shortcut for grep
vim.keymap.set('n', '<c-p>', '<cmd>Files<cr>', {silent = true}) -- shortcut for fuzzy finder
vim.keymap.set('i', 'jj', '<esc>') -- shortcut for Esc
vim.keymap.set('n', '<space>f', vim.lsp.buf.format, {silent = true})

-- vim.api.nvim_create_autocmd("BufWritePre", {pattern = {"*.tf", "*.json", "*.yml"}, callback = function () vim.lsp.buf.format({ async = false }) end})
