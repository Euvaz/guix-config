return {
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 500,
                },
            })
        end,
    },
}

