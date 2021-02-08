-- Enable true color
if vim.fn.exists('+termguicolors') == 1 then
     vim.api.nvim_set_option('termguicolors', true)
end
if vim.fn.has('persistent_undo') == 1 then
     vim.api.nvim_buf_set_option(0, 'undofile', true)
end 

vim.cmd('colorscheme moonfly')
vim.api.nvim_set_var('moonflyCursorColor', 1)
