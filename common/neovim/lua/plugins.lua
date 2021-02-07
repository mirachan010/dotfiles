-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    use 'vim-jp/vimdoc-ja.git'
    use 'lambdalisue/fern.vim'
    use 'lambdalisue/fern-git-status.vim'
    use {'itchyny/lightline.vim',
        config = function()
--            vim.cmd('let g:lightline={\'colorscheme\':\'moonfly\'}')
        end
    }
    -- use {
    --    'glepnir/galaxyline.nvim',
    --    branch = 'main',
    -- your statusline
    -- config = function() require'my_statusline' end,
    -- some optional icons
    -- requires = {'kyazdani42/nvim-web-devicons', opt = true}
    -- }
    use 'Shougo/deoplete.nvim'
    use {'bluz71/vim-moonfly-colors'}
    use{'skanehira/code2img.vim'}
    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config=function()
            require 'nvim-treesitter.install'.compilers = { "gcc" }
            require'nvim-treesitter.configs'.setup {
                indent = {
                    enable = true
                },
                highlight = {
                    enable = true,
                    disable = {
                        'ruby',
                        'c_sharp',
                        'vue',
                    }
                },
            }
        end,
    }
    use{'nvim-lua/popup.nvim'}
    use{'nvim-lua/plenary.nvim'}
    use{'nvim-telescope/telescope.nvim'}
    use 'neovim/nvim-lspconfig'
    use {'hrsh7th/nvim-compe',
        config=function()
            require'compe'.setup { enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'enable';
                throttle_time = 80;
                source_timeout = 200;
                incomplete_delay = 400;
                allow_prefix_unmatch = false;
                source = {
                    path = true;
                    buffer = true;
                    calc = true;
                    vsnip = true;
                    nvim_lsp = true;
                    nvim_lua = true;
                    spell = true;
                    tags = true;
                    snippets_nvim = true;
                };
            }

            --for nvim-compe
            vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()',        { noremap = true, silent = true, expr = true})
            vim.api.nvim_set_keymap('i', '<CR>',      'compe#confirm(\'<CR>\')', { noremap = true, silent = true, expr = true})
            vim.api.nvim_set_keymap('i', '<C-e>',     'compe#close(\'<C-e>\')',  { noremap = true, silent = true, expr = true})
        end,
    }


    -- Simple plugins can be specified as strings
    -- use '9mm/vim-closer'

    -- Lazy loading:
    -- Load on specific commands
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on an autocommand event
    -- use {'andymass/vim-matchup', event = 'VimEnter *'}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    -- use {
    -- 'w0rp/ale',
    -- ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    -- cmd = 'ALEEnable',
    -- config = 'vim.cmd[[ALEEnable]]'
    -- }

    -- Plugins can have dependencies on other plugins
    -- use {
    -- 'haorenW1025/completion-nvim',
    -- -- opt = true,
    -- requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
    -- }

    -- Plugins can also depend on rocks from luarocks.org:
    -- use {
    -- 'my/supercoolplugin',
    -- rocks = {'lpeg', {'lua-cjson', '2.1.0'}}
    -- }

    -- You can specify rocks in isolation
    -- use_rocks 'penlight'
    -- use_rocks {'lua-resty-http', 'lpeg'}

    -- Local plugins can be included
    -- use '~/projects/personal/hover.nvim'

    -- Plugins can have post-install/update hooks
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}


    -- Post-install/update hook with call of vimscript function with argument
    -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

    -- Use specific branch, dependency and run lua file after load
    -- use {
    -- 'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    -- requires = {'kyazdani42/nvim-web-devicons'}
    -- }

    -- Use dependency and run lua function after load
    -- use {
    -- 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    -- config = function() require('gitsigns').setup() end
    -- }

    -- You can specify multiple plugins in a single call
    -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

    -- -- You can alias plugin names
    -- use {'dracula/vim', as = 'dracula'}
end)
