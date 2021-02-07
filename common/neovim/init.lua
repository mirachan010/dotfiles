vim.api.nvim_set_option('encoding', 'utf-8')
vim.api.nvim_set_option('fileencodings', 'utf-8,cp932,sjis')

vim.api.nvim_set_var('python3_host_prog', 'c:\\Python39\\python.exe')

require('options')
require('keymap')
require('plugins')

require('color')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
