return require 'packer'.startup(function(use)

    -- Packer Can Manage Itself
    use 'wbthomason/packer.nvim'

    -- LSP Installer
    use {
        'williamboman/nvim-lsp-installer',
        requires = 'neovim/nvim-lspconfig',
        config = function()
        local lspconfig = require 'lspconfig'
        local lsp_installer = require 'nvim-lsp-installer'
        local server_array = { 'ansiblels', 'bashls', 'clangd', 'dockerls', 'gopls', 'marksman', 'pyright', 'sumneko_lua',  'terraformls', 'texlab', 'yamlls'}
        local lsp_installer_servers = require 'nvim-lsp-installer.servers'

        -- Install Missing Language Servers
        for _, server in ipairs(server_array) do
            local ok, server_instance = lsp_installer_servers.get_server(server)
            if ok then
                if not server_instance:is_installed() then
                    server_instance:install()
                end
            end
        end

        lsp_installer.on_server_ready(function(server)
            local server_settings = {  }

            if server_settings[server] then
                server:setup(server_settings[server])
            else
                server:setup {}
            end
            vim.cmd [[do User LspAttachBuffers]]
        end)

        local opts = { noremap = true }
        vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<C-f>', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end
    }

    -- Lua Engine Plugin
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip'
    },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local cmp_nvim_lsp = require 'cmp_nvim_lsp'
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

            local luasnip = require 'luasnip'
            local cmp = require 'cmp'
            cmp.setup{
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
                ['<CR>'] = cmp.mapping.confirm{behavior = cmp.ConfirmBehavior.Replace, select = true},
                ['<Tab>'] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
                elseif luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
                else
                    fallback()
                end
            end,
                ['<S-Tab>'] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
                elseif luasnip.jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
                else
                    fallback()
                end
            end,
            },
            formatting = {
                deprecated = true,
                format = function(_, vim_item)
                local lspkind = require 'lspkind'
                vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
                return vim_item
            end,
            },
            sources = {
                {name = 'nvim_lsp'},
                {name = 'luasnip'},
            },
        }
    end
  }

    -- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
                    "bash",
                    "cpp",
                    "dockerfile",
                    "go",
                    "hcl",
                    "markdown",
                    "python",
                    "latex",
                    "lua",
                    "yaml"
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

    -- File Browsing
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
        local nvim_tree = require 'nvim-tree'

        nvim_tree.setup{
            disable_netrw = true,
            hijack_netrw = true,
        }

        local opts = { noremap = true }
        vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', opts)
        vim.api.nvim_set_keymap('n', '<Leader>r', '<Cmd>NvimTreeRefresh<CR>', opts)
        vim.api.nvim_set_keymap('n', '<Leader>g', '<Cmd>NvimTreeFindFile<CR>', opts)
    end
    }

    -- Quote/Bracket Auto-Completion
    use 'jiangmiao/auto-pairs'

    -- Git Declarations
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    -- Base16 Theme
    use 'chriskempson/base16-vim'

    -- Markdown Preview
    use {
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
      ft = {'markdown'}
    }

    -- LaTeX Preview
    use {
    'lervag/vimtex',
    config = function ()
        vim.g.vimtex_compiler_latexmk_engines = {
            _ = '-xelatex'
        }
    end,
    }
  end
)
