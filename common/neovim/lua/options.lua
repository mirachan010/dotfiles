vim.cmd('set expandtab')
vim.cmd('set fileencoding=utf-8')
vim.cmd('set shiftwidth=4')
vim.cmd('set smartindent')
vim.cmd('set tabstop=4')
vim.cmd('set undofile')
vim.cmd('set fileformat=unix')
vim.cmd('set cursorline')
vim.cmd('set list')
vim.cmd('set number')
vim.cmd('set nowrap')
-- function BufOptions()
--      vim.api.nvim_buf_set_option(0, 'expandtab', true)
--      vim.api.nvim_buf_set_option(0, 'fileencoding', 'utf-8')
--      vim.api.nvim_buf_set_option(0, 'shiftwidth', 4)
--      vim.api.nvim_buf_set_option(0, 'smartindent', true)
--      vim.api.nvim_buf_set_option(0, 'undofile', true)
--      vim.api.nvim_buf_set_option(0, 'tabstop', 5)
--      vim.api.nvim_buf_set_option(0, 'fileformat', 'unix')
-- end
-- function WinOptions()
--     vim.api.nvim_win_set_option(0, 'cursorline', true)
--     vim.api.nvim_win_set_option(0, 'list', true)
--     vim.api.nvim_win_set_option(0, 'number', true)
--     vim.api.nvim_win_set_option(0, 'wrap', false)
-- end
-- BufOptions()
-- WinOptions()

vim.api.nvim_set_option('ambiwidth', 'double')
vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('autoread', true)
vim.api.nvim_set_option('background', 'dark')
vim.api.nvim_set_option('backspace', 'indent,eol,start')
vim.api.nvim_set_option('backup', false)
vim.api.nvim_set_option('clipboard', 'unnamedplus,unnamed')
vim.api.nvim_set_option('cmdwinheight', 5)
vim.api.nvim_set_option('completeopt', 'menu,menuone,noselect')
vim.api.nvim_set_option('confirm', true)
vim.api.nvim_set_option('emoji', true)
vim.api.nvim_set_option('equalalways', false)
vim.api.nvim_set_option('helpheight', 12)
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('history', 1000)
vim.api.nvim_set_option('hlsearch', true)
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('incsearch', true)
vim.api.nvim_set_option('laststatus', 2)
vim.api.nvim_set_option('listchars', 'tab:»-,extends:»,precedes:«,nbsp:%,eol:↲,trail:~')
vim.api.nvim_set_option('previewheight', 8)
vim.api.nvim_set_option('showcmd', true)
vim.api.nvim_set_option('smartcase', true)
vim.api.nvim_set_option('splitbelow', true)
vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('swapfile', false)
vim.api.nvim_set_option('synmaxcol', 0)
vim.api.nvim_set_option('ttimeout', true)
vim.api.nvim_set_option('ttimeoutlen', 10)
vim.api.nvim_set_option('updatetime', 100)
vim.api.nvim_set_option('whichwrap', 'b,s,h,l,<,>,[,]')
vim.api.nvim_set_option('wildmenu', true)
vim.api.nvim_set_option('wrapscan', true)
vim.api.nvim_set_option('writebackup', true)
