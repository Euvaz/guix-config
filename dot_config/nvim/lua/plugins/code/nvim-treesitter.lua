return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local nvim_treesitter = require("nvim-treesitter.configs")
            nvim_treesitter.setup({
                ensure_installed = {
                    "bash",
                    "css",
                    "dockerfile",
                    "gitignore",
                    "go",
                    "hcl",
                    "html",
                    "json",
                    "latex",
                    "lua",
                    "markdown",
                    "python",
                    "scss",
                    "sql",
                    "templ",
                    "toml",
                    "vim",
                    "xml",
                    "yaml",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
