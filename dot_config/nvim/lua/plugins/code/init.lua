local plugins_group = "plugins.code."

return {
  require(plugins_group .. "nvim-autopairs"),
  require(plugins_group .. "nvim-treesitter"),
  require(plugins_group .. "todo-comments-nvim"),
  require(plugins_group .. "trouble-nvim"),
}

