---@type LazySpec
return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  lazy = false,
  keys = {
    {"<Leader>bc", "<Cmd>BufferClose<CR>"},
    {"<Leader>bh", "<Cmd>BufferPrevious<CR>"},
    {"<Leader>bl", "<Cmd>BufferNext<CR>"}
  },
  opts = {}
}
