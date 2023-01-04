-- START DEFINE MAP FUNCTION --
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
-- END MAP FUNCTION --

-- START CUSTOM KEYBINDS --
map {'n','<Leader>,<space>', '<Cmd>nohlsearch<CR>'}

-- END CUSTOM KEYBINDS --

