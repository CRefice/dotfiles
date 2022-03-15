-- This file can be loaded by calling `require('plugins')` from your init.lua

-- Automatically recompile package loader whenever this file is changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Advanced, customizable statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require('lualine').setup() end
	}
	-- Seamless navigation between tmux panes and vim windows
	use 'christoomey/vim-tmux-navigator'
	-- Horizon colorscheme
	use 'ntk148v/vim-horizon'
	-- Git integration
	use 'tpope/vim-fugitive'
	-- Show lines changed from last commit in sign column
	use 'airblade/vim-gitgutter'
	-- Fuzzy file finder
	use {
		'junegunn/fzf.vim',
		config = function()
			-- Customize fzf colors to match color scheme with termguicolors
			vim.g.fzf_colors = { 
				fg =      {'fg', 'Normal'},
				bg =      {'bg', 'Normal'},
				hl =      {'fg', 'Comment'},
				['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
				['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
				['hl+'] = {'fg', 'Statement'},
				pointer = {'fg', 'Identifier'},
				info =    {'fg', 'Comment'},
				prompt =  {'fg', 'Function'},
				gutter =  {'bg', 'LineNr'},
				marker =  {'fg', 'Function'},
				spinner = {'fg', 'Label'},
			}
		end
	}
	-- Latex compilation and preview
	use {
		'lervag/vimtex',
		ft = { 'tex', 'latex' },
		config = function() 
			vim.g.vimtex_view_method = 'zathura'
		end
	}
	-- Language server integration
	use {
		'neovim/nvim-lspconfig',
		ft = { 'c', 'cpp', 'rust', 'python' },
		config = function() 
			local lsp = require('lspconfig')
			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
				vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
			end
			local flags = {
				-- This will be the default in neovim 0.7+
				debounce_text_changes = 150,
			}

			lsp.rust_analyzer.setup {
				on_attach = on_attach,
				settings = {
					["rust-analyzer"] = {
						assist = {
							importGranularity = "module",
							importPrefix = "by_self",
						},
						checkOnSave = {
							command = "clippy"
						}
					}
				},
				flags = flags
			}
			lsp.clangd.setup { on_attach = on_attach, flags = flags }
			lsp.pyright.setup { on_attach = on_attach, flags = flags }
		end
	}
end)
