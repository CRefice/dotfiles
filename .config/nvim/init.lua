--[[ General interface and editor options --]]
-- Enable persistent undo
vim.opt.undofile = true
-- Show line numbers
vim.opt.number = true
-- Highlight line the cursor is on
vim.opt.cursorline = true
-- Don't show current mode on the last line,
-- as it will be shown by the status line
vim.opt.showmode = false
-- Only use case sensitive search with uppercase characters
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Yank to clipboard when a yank buffer is not specified
vim.opt.clipboard:append('unnamedplus')
-- Set visual length of tabs to 4 characters,
-- and ensure that tabs are always inserted as such.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Enable mouse scrolling in all modes
vim.opt.mouse = 'a'
-- Do not show completion preview window
vim.opt.completeopt:remove('preview')

--[[ Mappings and shortcuts --]]
-- Set map leader to easily accessible char
vim.g.mapleader = ","
-- Navigate by visual lines rather than file lines
vim.api.nvim_set_keymap('', 'j', 'gj', {})
vim.api.nvim_set_keymap('', 'k', 'gk', {})
-- Search with space
vim.api.nvim_set_keymap('', '<Space>', '/', { noremap = true })
-- Quickly save and exit files
vim.api.nvim_set_keymap('', '<Leader>w', ':w<CR>', {})
vim.api.nvim_set_keymap('', '<Leader>q', ':qa<CR>', {})
vim.api.nvim_set_keymap('', '<Leader>x', ':xa<CR>', {})
-- Quickly disable highlighting of search term
vim.api.nvim_set_keymap('', '<Leader>n', ':nohlsearch<CR>', { silent = true })
-- Close the quickfix list
vim.api.nvim_set_keymap('', '<Leader>c', ':cclose<CR>', { silent = true })
-- Pick a file in the current directory using FZF
vim.api.nvim_set_keymap('', '<Leader>l', ':Files<CR>', {})
-- Grep in the current directory using FZF to list results
vim.api.nvim_set_keymap('', '<Leader>g', ':Rg<CR>', {})

_ = require('plugins')

--[[ Colorscheme --]]
-- Enable 24-bit color codes in the terminal (required by horizon colorscheme)
vim.opt.termguicolors = true
vim.cmd('colorscheme horizon')
