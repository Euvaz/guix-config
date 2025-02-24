---@type LazySpec
return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    event = { "BufNewFile", "BufReadPost", "BufWritePost "},
    cmd = { "TodoFzfLua", "TodoLocList", "TodoQuickFix", "TodoTelescope", "TodoTrouble" },
    config = function()
        local todo_comments = require("todo-comments")
        todo_comments.setup({
            keywords = {
                FIX = { icon = "* ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = "> ", color = "info" },
                HACK = { icon = "! ", color = "warning" },
                WARN = { icon = "# ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = "^ ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "~ ", color = "hint", alt = { "INFO" } },
                TEST = { icon = "? ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } }
            }
        })
    end
}
