return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        init = function()
            if vim.fn.argc(-1) == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                    if stat and stat.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        deactivate = function()
            vim.cmd([[Neotree close]])
        end,
        opts = {
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            window = {
                mappings = {
                    ["<space>"] = "none",
                },
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        },
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
                end,
            },
            { "<leader>e", "<leader>fe", remap = true },
            {
                "<leader>ge",
                function()
                    require("neo-tree.command").execute({ source = "git_status", toggle = true })
                end,
            },
            {
                "<leader>be",
                function()
                    require("neo-tree.command").execute({ source = "buffers", toggle = true })
                end,
            },
        },
    },
}

