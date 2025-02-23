---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufNewFile", "BufReadPost", "BufWritePost" },
    config = function()
        local nvim_treesitter = require("nvim-treesitter.configs")
        nvim_treesitter.setup({
            ensure_installed = {
                "bash",
                "cue",
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
                "yaml"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end,
    build = ":TSUpdate"
}
