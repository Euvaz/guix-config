---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufNewFile", "BufReadPost", "BufWritePost "},
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 500
    }
  }
}
