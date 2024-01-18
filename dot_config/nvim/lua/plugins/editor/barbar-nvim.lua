return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    keys = {
      {"<Leader>bc", "<Cmd>BufferClose<CR>"},
      {"<Leader>bh", "<Cmd>BufferPrevious<CR>"},
      {"<Leader>bl", "<Cmd>BufferNext<CR>"},
    },
    opts = {},
  },
}

