-- This file can be loaded by calling `require('plugins')` from your init.lua

local reload_grp = vim.api.nvim_create_augroup("ReloadPluginConfig", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*/nvim/lua/plugins.lua",
	command = "source <afile> | PackerCompile",
	desc = "Automatically recompile package loader whenever plugins config file is changed",
	group = reload_grp
})

return require('packer').startup(function(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim', opt = true }
	-- Custom statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = false },
		config = function() require('lualine').setup {
				options = {
					theme = 'auto',
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = { 'filename' },
					lualine_x = { 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' }
				},
			}
		end
	}
	-- Seamless navigation between tmux panes and vim windows
	use 'christoomey/vim-tmux-navigator'
	-- Git integration
	use 'tpope/vim-fugitive'
	-- Show lines changed from last commit in sign column
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('gitsigns').setup() end
	}
	-- Fuzzy file finder and more
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	-- Latex compilation and preview
	use {
		'lervag/vimtex',
		ft = { 'tex', 'latex' },
		config = function()
			vim.g.vimtex_view_method = 'zathura'
		end
	}
	-- Smart syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('nvim-treesitter.configs').setup {
				highlight = {
					enable = true,
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced lift time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = 'o',
						toggle_hl_groups = 'i',
						toggle_injected_languages = 't',
						toggle_anonymous_nodes = 'a',
						toggle_language_display = 'I',
						focus_language = 'f',
						unfocus_language = 'F',
						update = 'R',
						goto_node = '<cr>',
						show_help = '?',
					},
				}
			}
		end
	}
	use 'nvim-treesitter/playground'
	-- Language server integration
	use {
		'neovim/nvim-lspconfig',
		ft = { 'c', 'cpp', 'rust', 'python', 'lua' },
		config = function()
			local lsp = require('lspconfig')
			lsp.rust_analyzer.setup {
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
			}
			lsp.clangd.setup {}
			lsp.pyright.setup {}
			lsp.sumneko_lua.setup {
				settings = {
					Lua = {
						runtime = {
							-- neovim uses luajit
							version = 'LuaJIT',
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global.
							globals = { 'vim' },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data
						telemetry = {
							enable = false,
						},
					}
				}
			}
		end
	}
end)
