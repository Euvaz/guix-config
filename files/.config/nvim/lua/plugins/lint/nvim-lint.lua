---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  event = { "BufNewFile", "BufReadPost", "BufWritePost" },
  opts = {
    events = { "BufReadPost", "BufWritePost", "InsertLeave" },
    linters_by_ft = {
      ansible = { "ansible-lint" },
      dockerfile = { "hadolint" },
      markdown = { "markdownlint "},
      python = { "pylint" },
      go = { "revive" },
      lua = { "selene" },
      bash = { "shellcheck "},
      css = { "stylelint" },
      terraform = { "tflint" },
      yaml = { "yamllint" }
    }
  },
  config = function(_, opts) end
}
