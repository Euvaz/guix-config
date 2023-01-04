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
vim.cmd [[colorscheme base16-oceanicnext]]
vim.opt.termguicolors = true
vim.opt.background = 'dark'

