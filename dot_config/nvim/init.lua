local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup("plugins")

-- Disable Shortmessage
vim.opt.shortmess:append("I")

-- Line Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive Searching
vim.opt.ignorecase = true

-- Case-sensitive When Uppercase is Provided
vim.opt.smartcase = true

-- Adjusting Spacing
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Scroll Functionality
vim.opt.mouse = "a"

-- Theming
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Colorscheme
vim.cmd.colorscheme "catppuccin"

local map = function(key)
  -- Get extra options
  local opts = { noremap = true }
  for i, v in pairs(key) do
    if type(i) == "string" then opts[i] = v end
  end

  -- Support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

map { "n", "<Leader>,<space>", "<Cmd>nohlsearch<CR>" }

