return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            local toggleterm = require("toggleterm")
            toggleterm.setup({
                open_mapping = [[<C-\>]],
                close_on_exit = true,
                direction = "float",
                float_opts = {
                    border = "curved",
                    width  = 160,
                    height = 30,
                    winblend = 10,
                },
            })
        end,
    },
}

