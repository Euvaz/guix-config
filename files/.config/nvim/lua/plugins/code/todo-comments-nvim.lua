---@type LazySpec
return {
  "folke/todo-comments.nvim",
  event = { "BufNewFile", "BufReadPost", "BufWritePost "},
  cmd = { "TodoFzfLua", "TodoLocList", "TodoQuickFix", "TodoTelescope", "TodoTrouble" },
  opts = {}
}
