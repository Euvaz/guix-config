return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local mason = require("mason")
            mason.setup()

            local lspconfig = require("lspconfig")

            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = {
                    "ansiblels",
                    "bashls",
                    "clangd",
                    "dockerls",
                    "gopls",
                    "marksman",
                    "pyright",
                    "lua_ls",
                    "terraformls",
                    "texlab",
                    "yamlls"
                },
                automatic_installation = false,
            })
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup {}
                end,
                terraformls = function()
                    lspconfig.terraformls.setup({
                        filetypes = { "terraform" },
                        root_dir = lspconfig.util.root_pattern("main.tf")
                    })
                end
            })
        end,
        keys = {
            { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
            { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>" },
            { "gr", "<Cmd>lua vim.lsp.buf.references()<CR>" },
            { "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>" },
            { "<Cmd>lua vim.lsp.buf.hover()<CR>" },
            { "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>" },
            { "<C-n>", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" },
            { "<C-p>", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
            { "<Leader>a", "<Cmd>lua vim.lsp.buf.format()<CR>" },
        },
    },
}
