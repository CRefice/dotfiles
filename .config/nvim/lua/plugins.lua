return {
	{
		-- Custom statusline
		'nvim-lualine/lualine.nvim',
		opts = {
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
		},
	},
	-- Fancy icons in statusbar and other UI elements
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	-- Seamless navigation between tmux panes and vim windows
	'christoomey/vim-tmux-navigator',
	-- Git integration
	'tpope/vim-fugitive',
	{
		-- Show lines changed from last commit in sign column
		'lewis6991/gitsigns.nvim',
		config = true,
	},
	{
		-- Fuzzy file finder and more
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			-- Pick a file in the current directory using telescope
			{ '<leader>ff', '<cmd>Telescope find_files<cr>' },
			-- Grep in the current directory using telescope to list results
			{ '<leader>fg', '<cmd>Telescope live_grep<cr>', silent = true },
			-- Look between buffers
			{ '<leader>fb', '<cmd>Telescope buffers<cr>' },
		},
	},
	{
		-- Latex compilation and preview
		'lervag/vimtex',
		ft = { 'tex', 'latex' },
		init = function()
			vim.g.vimtex_view_method = 'zathura'
		end
	},
	{
		-- Smart syntax highlighting
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/playground',
		},
		main = 'nvim-treesitter.configs',
		opts = {
			ensure_installed = { 'c', 'cpp', 'rust', 'python', 'lua', 'javascript', 'typescript' },
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@function.call.outer",
						["ic"] = "@function.call.inner",
					},
					-- You can choose the select mode (default is charwise 'v')
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						['@parameter.outer'] = 'v', -- charwise
						['@function.outer'] = 'V', -- linewise
						['@class.outer'] = '<c-v>', -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true of false
					include_surrounding_whitespace = true,
				},
			},
		},
	},
	{
		-- Language server integration
		'neovim/nvim-lspconfig',
		ft = { 'c', 'cpp', 'rust', 'python', 'lua', 'javascript', 'typescript', 'nix' },
		config = function()
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = true,
                        check = {
							command = "clippy",
                        },
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true
						},
					}
				},
			})
			vim.lsp.config("lua_ls", {
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
			})
            vim.lsp.enable("rust_analyzer")
            vim.lsp.enable("clangd")
            vim.lsp.enable("pyright")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("nixd")
		end
	}
}
