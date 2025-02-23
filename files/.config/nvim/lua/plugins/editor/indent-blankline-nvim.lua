---@type LazySpec
return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufNewFile", "BufReadPost", "BufWritePost" },
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {}
}
