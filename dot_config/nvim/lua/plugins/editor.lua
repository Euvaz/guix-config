return {
    {
        "windwp/nvim-autopairs",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function()
            local autopairs = require("nvim-autopairs")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

            autopairs.setup({})
        end,
    },
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
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
}

