require('devald')
vim.cmd.colorscheme('edge')

--
-- vim.g.fzf_layout = {
--   window = {
--     width = 0.4,
--     height = 0.3,
--     relative = 'v:true',
--     yoffset = 1.0
--   }
-- }
--
-- vim.g.fzf_preview_window = {}
-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'
--
-- vim.cmd([[
--   autocmd BufReadPost *
--     \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
--     \ |   exe "normal! g`\""
--     \ | endif
-- ]])
--
-- vim.cmd([[
--   autocmd VimResized * wincmd =
-- ]])
--
-- vim.g.loaded_python3_provider = 0
-- vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_node_provider = 0
-- vim.g.loaded_perl_provider = 0