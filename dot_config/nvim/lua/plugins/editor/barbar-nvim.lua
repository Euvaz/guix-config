---@type LazySpec
return {
  "romgrk/barbar.nvim",
  event = "BufAdd",
  keys = {
    {"<A-c>", "<Cmd>BufferClose<CR>"},
    {"<A-,>", "<Cmd>BufferPrevious<CR>"},
    {"<A-.>", "<Cmd>BufferNext<CR>"}
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {}
}
