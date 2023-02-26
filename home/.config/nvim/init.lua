vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("plugins")

-- Disable Shortmessage
vim.opt.shortmess:append('I')

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
vim.opt.mouse = 'a'

-- Theming
vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.api.nvim_create_user_command('PackerInstall', function()
    vim.cmd([[packadd packer.nvim]])
	require('plugins').install()
end, { bang = true })
vim.api.nvim_create_user_command('PackerUpdate', function()
	vim.cmd([[packadd packer.nvim]])
	require('plugins').update()
end, { bang = true })
vim.api.nvim_create_user_command('PackerSync', function()
	vim.cmd([[packadd packer.nvim]])
	require('plugins').sync()
end, { bang = true })
vim.api.nvim_create_user_command('PackerClean', function()
	vim.cmd([[packadd packer.nvim]])
	require('plugins').clean()
end, { bang = true })
vim.api.nvim_create_user_command('PackerCompile', function()
	vim.cmd([[packadd packer.nvim]])
	require('plugins').compile()
end, { bang = true })

local map = function(key)
  -- Get extra options
  local opts = { noremap = true }
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
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

map {'n', '<Leader>,<space>', '<Cmd>nohlsearch<CR>'}
