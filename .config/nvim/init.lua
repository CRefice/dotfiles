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
vim.keymap.set('', 'j', 'gj', { remap = true })
vim.keymap.set('', 'k', 'gk', { remap = true })
-- Search with space
vim.keymap.set('', '<Space>', '/')
-- Quickly save and exit files
vim.keymap.set('', '<Leader>w', ':w<CR>')
vim.keymap.set('', '<Leader>q', ':qa<CR>')
vim.keymap.set('', '<Leader>x', ':xa<CR>')
-- Quickly disable highlighting of search term
vim.keymap.set('', '<Leader>n', ':nohlsearch<CR>', { silent = true })
-- Close the quickfix list
vim.keymap.set('', '<Leader>c', ':cclose<CR>', { silent = true })
vim.keymap.set('', '<Leader>h', ':TSHighlightCapturesUnderCursor<CR>', { silent = true })
-- Only enable the following mappings when lsp is active
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf, noremap = true, silent = true }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<C-p>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
	end
})

local telescope = require('telescope.builtin')
-- Pick a file in the current directory using telescope
vim.keymap.set('n', '<Leader>l', function() telescope.find_files() end, { silent = true })
-- Grep in the current directory using telescope to list results
vim.keymap.set('n', '<Leader>g', function() telescope.live_grep() end, { silent = true })

vim.cmd [[ colorscheme base16 ]]
