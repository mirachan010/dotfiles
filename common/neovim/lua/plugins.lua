-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd[[command! PackerInstall packadd packer.nvim | lua require'plugins'.install()]]
vim.cmd[[command! PackerUpdate packadd packer.nvim | lua require'plugins'.update()]]
vim.cmd[[command! PackerSync packadd packer.nvim | lua require'plugins'.sync()]]
vim.cmd[[command! PackerClean packadd packer.nvim | lua require'plugins'.clean()]]
vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'plugins'.compile()]]

local packer = nil
local function init()
    if packer == nil then
        packer = require('packer')
        packer.init({
            display={
                open_fn = require'packer.util'.float,
            }
        })
    end
    local use = packer.use
    packer.reset()

    use{
        'wbthomason/packer.nvim',
        opt = true
    }
    use{
        'thinca/vim-quickrun'
    }
    use'monaqa/dial.nvim'
    use {
        'kristijanhusak/line-notes.nvim',
        config=function()
            require'line-notes'.setup({
                path = vim.fn.expand('~/AppData/Local/nvim-data/line-notes.json'),
                icon = ''
            })
        end
    }
    use {
        'tkmpypy/chowcho.nvim',
        config=function()
            require('chowcho').setup {
                text_color = '#FFFFFF',
                bg_color = '#555555',
                active_border_color = '#0A8BFF',
                border_style = 'rounded' -- 'default', 'rounded',
            }
        end
    }
    use {
        'windwp/nvim-autopairs',
        event='InsertEnter *',
        config=function()
            require('nvim-autopairs').setup()
            -- skip it, if you use another global object
            _G.MUtils= {}
            vim.g.completion_confirm_key = ""
            MUtils.completion_confirm=function()
                if vim.fn.pumvisible() ~= 0  then
                    if vim.fn.complete_info()["selected"] ~= -1 then
                        vim.fn["compe#confirm"]()
                        return require('nvim-autopairs').esc("<c-y>")
                    else
                        vim.defer_fn(function()
                            vim.fn["compe#confirm"]("<cr>")
                        end, 20)
                        return require('nvim-autopairs').esc("<c-n>")
                    end
                else
                    return require('nvim-autopairs').check_break_line_char()
                end
            end
            vim.api.nvim_set_keymap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
        end
    }
    use 'vim-jp/vimdoc-ja'
    use{
        'lambdalisue/gina.vim', opt = true,
        cmd = {'Gina'},
    }
    use{
        'bluz71/vim-moonfly-colors'
    }
    use{
        'itchyny/lightline.vim',
        disable=true,
        config = function()
            vim.api.nvim_set_var('lightline', { colorscheme = 'moonfly' })
        end
    }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require'statusline' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use{
        'skanehira/code2img.vim'
    }
    -- Post-install/update hook with neovim command
    use {
        'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
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
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- 範囲選択を開始します。
                        init_selection = "gnn",
                        -- 1つ上のnodeにn 択範囲を拡大します。
                        node_incremental = "grn",
                        -- 1つ上のスコープに選択範囲を拡大します。
                        scope_incremental = "grc",
                        -- 1つ下のnodeに選択範囲を縮小します。
                        node_decremental = "grm",
                    },
                },
                textobjects = {
                    -- `ip` や `ap` のようにtextobjectを選択します。
                    select = {
                        enable = true,
                        keymaps = {
                            ["af"] = "f@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    -- 前後のtextobjectに移動します。
                    move = {
                        enable = true,
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                    -- 関数の引数の位置を交換します。
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                    -- textobject全体をfloating windowを使って表示します。
                    lsp_interop = {
                        enable = true,
                        peek_definition_code = {
                            ["df"] = "@function.outer",
                            ["dF"] = "@class.outer",
                        },
                    },
                },
                refactor = {
                    -- カーソルの下にあるsymbolの定義位置に移動したり、
                    -- 定義されているsymbol一覧を表示します。
                    navigation = {
                        enable = true,
                        keymaps = {
                            -- 定義に移動します。
                            goto_definition = "gnd",
                            -- 定義一覧を表示します。
                            list_definitions = "gnD",
                            -- 定義一覧を本の目次のようにネストがわかるように表示します。
                            list_definitions_toc = "gO",
                            -- カーソル下のsymbolの前後の利用位置に移動します。
                            goto_next_usage = "<a-*>",
                            goto_previous_usage = "<a-#>",
                        },
                    },
                    -- カーソルの下にあるsymbolをrenameします。
                    smart_rename = {
                        enable = true,
                        keymaps = {
                            -- `grr` でrename処理が開始できます。
                            smart_rename = "grr",
                        },
                    },
                    -- カーソルの下にあるsymbolをhighlightします。
                    highlight_definitions = { enable = true },
                    -- カーソルが存在するスコープ全体をhighlightします。
                    highlight_current_scope = { enable = true },
                },

                -- 括弧の色をネストごとに変更します。
                rainbow = {
                    enable = true
                },

            }
        end,
        requires = {
            {'nvim-treesitter/nvim-treesitter-textobjects'},
            {'nvim-treesitter/nvim-treesitter-refactor'},
            {'p00f/nvim-ts-rainbow'},
            {'romgrk/nvim-treesitter-context', opt = true},
            {'ElPiloto/sidekick.nvim', opt = true},
        }
    }
    use{
        'nvim-telescope/telescope.nvim',
        config=function()
            require('telescope').setup{
                defaults={
                    borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                }
            }
        end,
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        }
    }
    use {
        'neovim/nvim-lspconfig',
        config=function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            require'lspconfig'.pyright.setup{
                capabilities = capabilities,
            }
        end
    }
    use 'alexaandru/nvim-lspupdate'
    use {
        'hrsh7th/nvim-compe',
        config=function()
            require'compe'.setup {
                enabled = true;
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
        requires = {
            {
                'hrsh7th/vim-vsnip',
                config = function()
                    -- NOTE: You can use other key to expand snippet.
                    -- Expand
                    vim.api.nvim_set_keymap('i', '<C-k>',  'vsnip#expandable()  ? \'<Plug>(vsnip-expand)\'         : \'<C-j>\'', { noremap = true, expr = true})
                    vim.api.nvim_set_keymap('s', '<C-k>',  'vsnip#expandable()  ? \'<Plug>(vsnip-expand)\'         : \'<C-j>\'', { noremap = true, expr = true})
                    --  Expand or jump
                    vim.api.nvim_set_keymap('i', '<C-l>', 'vsnip#available(1)  ? \'<Plug>(vsnip-expand-or-jump)\' : \'<C-l>\'', { noremap = true, expr = true})
                    vim.api.nvim_set_keymap('s', '<C-l>', 'vsnip#available(1)  ? \'<Plug>(vsnip-expand-or-jump)\' : \'<C-l>\'', { noremap = true, expr = true})
                    -- Jump forward or backward
                    vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#jumpable(1)   ? \'<Plug>(vsnip-jump-next)\'      : \'<Tab>\'', { noremap = true, expr = true})
                    vim.api.nvim_set_keymap('s', '<Tab>', 'vsnip#jumpable(1)   ? \'<Plug>(vsnip-jump-next)\'      : \'<Tab>\'', { noremap = true, expr = true})
                    vim.api.nvim_set_keymap('i', '<S-Tab>', 'vsnip#jumpable(-1)  ? \'<Plug>(vsnip-jump-prev)\'      : \'<S-Tab>\'', { noremap = true, expr = true})
                    vim.api.nvim_set_keymap('s', '<S-Tab>', 'vsnip#jumpable(-1)  ? \'<Plug>(vsnip-jump-prev)\'      : \'<S-Tab>\'', { noremap = true, expr = true})
                    -- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
                    -- See https://github.com/hrsh7th/vim-vsnip/pull/50
                    vim.api.nvim_set_keymap('n', 's', '<Plug>(vsnip-select-text)', {noremap = false})
                    vim.api.nvim_set_keymap('x', 's', '<Plug>(vsnip-select-text)', {noremap = false})
                    vim.api.nvim_set_keymap('n', 'S', '<Plug>(vsnip-cut-text)', {noremap = false})
                    vim.api.nvim_set_keymap('x', 'S', '<Plug>(vsnip-cut-text)', {noremap = false})
                    -- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
                    vim.api.nvim_set_var('vsnip_filetypes', {})
                    vim.api.nvim_set_var('vsnip_filetypes', {javascriptreact = 'javascript'})
                    vim.api.nvim_set_var('vsnip_filetypes', {typescriptreact = 'typescript'})
                end,
                requires = {
                    'hrsh7th/vim-vsnip-integ'
                }
            }
        }
    }

    use {
        'lambdalisue/fern.vim',
        requires = {
            {
                'lambdalisue/fern-renderer-nerdfont.vim',
                config=function()
                    vim.api.nvim_set_var('fern#renderer', 'nerdfont')
                end,
                requires='lambdalisue/nerdfont.vim'
            },
            {
                'lambdalisue/fern-git-status.vim',
                config = function()
                    vim.api.nvim_set_var('fern_git_status#disable_ignored', 1)
                end
            },
            'lambdalisue/fern-mapping-git.vim',
            'lambdalisue/fern-bookmark.vim'
        }
    }
    use{
        'Yggdroot/indentLine',
        config = function()
            vim.api.nvim_set_var('loaded_indentLine', 1)
        end
    }
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end
})

return plugins
