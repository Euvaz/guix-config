local packer = nil

local function init()
    if packer == nil then
        packer = require('packer')
        packer.init()
    end

    local use = packer.use
    packer.reset()

    use('wbthomason/packer.nvim')

    use({
        'nvim-treesitter/nvim-treesitter',
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                ensure_installed = {
                    'bash',
                    'cpp',
                    'dockerfile',
                    'go',
                    'hcl',
                    'markdown',
                    'python',
                    'latex',
                    'lua',
                    'yaml'
                },
                sync_install = false,
                autotag = {
                    enable = true,
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    })
    use({
        'RRethy/nvim-base16',
        config = function()
            vim.cmd [[colorscheme base16-oceanicnext]]
        end
    })
    use({
        'windwp/nvim-autopairs',
        requires = 'hrsh7th/nvim-cmp',
        config = function()
            local autopairs = require('nvim-autopairs')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')

            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

            autopairs.setup({})
        end,
    })
    use({
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            local gitsigns = require('gitsigns')
            gitsigns.setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol',
                    delay = 500,
                },
            })
        end,
    })
    use({
        'ray-x/lsp_signature.nvim',
        config = function()
            require('lsp_signature').setup()
        end,
    })
    use({
        'onsails/lspkind.nvim',
        config = function()
            local lspkind = require('lspkind')
            lspkind.init({
                mode = 'symbol_text',
            })
        end,
    })
    use({
        'williamboman/mason.nvim',
        config = function()
            local mason = require('mason')

            mason.setup()
        end,
    })
    use({
        'williamboman/mason-lspconfig.nvim',
        requires = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            local mason = require('mason')
            mason.setup()

            local lspconfig = require('lspconfig')

            local mason_lspconfig = require('mason-lspconfig')
            mason_lspconfig.setup({
                ensure_installed = {
                    'ansiblels',
                    'bashls',
                    'clangd',
                    'dockerls',
                    'gopls',
                    'marksman',
                    'pyright',
                    'lua_ls',
                    'terraformls',
                    'texlab',
                    'yamlls'
                },
                automatic_installation = false,
            })

            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local capabilities = cmp_nvim_lsp.default_capabilities()

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                terraformls = function()
                    lspconfig.terraformls.setup({
                        capabilities = capabilities,
                        filetypes = { "hcl" },
                        root_dir = lspconfig.util.root_pattern('main.tf')
                    })
                end
            })

            vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
            vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
            vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>')
            vim.keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
            vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
            vim.keymap.set('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
            vim.keymap.set('n', '<C-n>', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
            vim.keymap.set('n', '<C-p>', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
            vim.keymap.set('n', '<Leader>a', '<Cmd>lua vim.lsp.buf.format()<CR>')
        end,
    })
    use({
        'jay-babu/mason-null-ls.nvim',
        requires = {
            'williamboman/mason.nvim',
            'jose-elias-alvarez/null-ls.nvim',
        },
        config = function()
            local mason_null_ls = require('mason-null-ls')
            local null_ls = require('null-ls')

            mason_null_ls.setup({
                ensure_installed = {
                    'stylua',
                    'black',
                    'gitlint',
                },
                automatic_setup = false,
            })
            mason_null_ls.setup_handlers()

            null_ls.setup()
        end,
    })
    use({
        'jayp0521/mason-nvim-dap.nvim',
        requires = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        config = function()
            local mason_nvim_dap = require('mason-nvim-dap')

            mason_nvim_dap.setup({
                ensure_installed = {
                    'python',
                },
                automatic_setup = true,
            })
            mason_nvim_dap.setup_handlers()
        end,
    })
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local luasnip = require('luasnip')
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
                    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
                    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
                    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'text_symbol',
                        maxwidth = 80,
                    }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'neorg' },
                },
            })
        end,
    })
    use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            local nvim_tree = require('nvim-tree')

            nvim_tree.setup()

            vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>')
            vim.keymap.set('n', '<Leader>r', '<Cmd>NvimTreeRefresh<CR>')
            vim.keymap.set('n', '<Leader>g', '<Cmd>NvimTreeFindFile<CR>')

            vim.cmd([[highlight NvimTreeFolderIcon guibg=blue]])
        end,
    })
    use({
        'kwkarlwang/bufresize.nvim',
        config = function()
            local bufresize = require('bufresize')
            bufresize.setup()
        end,
    })
    use({
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown'}
    })
    use({
    'lervag/vimtex',
        config = function()
            vim.g.vimtex_compiler_latexmk_engines = {
                _ = '-xelatex'
            }
        end
    })
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins
