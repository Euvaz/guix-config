local plugins_group = "plugins.editor."

return {
  require(plugins_group .. "barbar-nvim"),
  require(plugins_group .. "gitsigns-nvim"),
  require(plugins_group .. "indent-blankline-nvim"),
  require(plugins_group .. "oil-nvim"),
  require(plugins_group .. "telescope-nvim"),
}

