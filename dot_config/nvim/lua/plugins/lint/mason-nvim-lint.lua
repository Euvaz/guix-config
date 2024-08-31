return {
  "rshkarin/mason-nvim-lint",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint"
  },
  config = function()
    local mason = require("mason")
    mason.setup()

    local lint = require("lint")

    local mason_nvim_lint = require("mason-nvim-lint")
    mason_nvim_lint.setup({
      ensure_installed = {
        "ansible-lint", -- Ansible
        "hadolint", -- Dockerfile
        "markdownlint", -- Markdown
        "pylint", -- Python
        "revive", -- Go
        "selene", -- Lua
        "shellcheck", -- Bash
        "stylelint", -- CSS
        "tflint", -- Terraform
        "yamllint" -- YAML
      },
      automatic_installation = false
    })
  end
}
