local M = {}

M.setup = function(colors)
	local hi = setmetatable({},
		{
			__newindex = function(_, name, config)
				vim.api.nvim_set_hl(0, name, config)
			end,
			-- Shorthand for highlight group linking:
			-- hi.Normal = hi.ModeMsg
			__index = function(_, name)
				return { link = name }
			end
		})

	-- Interface elements
	hi.Normal = { fg = colors.base05, bg = colors.base00 }
	hi.CursorLine = { bg = colors.base01 }
	hi.LineNr = { fg = colors.base03 }
	hi.CursorLineNr = { fg = colors.base06, bold = true }
	hi.SignColumn = { bg = colors.base00 }
	hi.IncSearch = hi.TermCursor
	hi.Search = { fg = colors.base02, bg = colors.base0A }
	hi.Visual = { bg = colors.base02 }
	hi.Error = { fg = colors.base08 }

	hi.Folded = { fg = colors.base03, bg = colors.base01, italic = true }
	hi.FoldColumn = { bg = colors.base01 }

	hi.Directory = { fg = colors.base0D }
	hi.Question = { fg = colors.base0C, bold = true }
	hi.NonText = { fg = colors.base0D }
	hi.Title = { fg = colors.base0A, bold = true }
	hi.Underlined = { fg = colors.base09, underline = true }

	-- Floating menus
	hi.Pmenu = { bg = colors.base01 }
	hi.PmenuSel = { bg = colors.base03 }
	hi.PmenuSbar = { bg = colors.base03 }

	-- Diffmode
	hi.DiffAdd = { fg = colors.base0B, bold = true }
	hi.DiffDelete = { fg = colors.base08, bold = true }
	hi.DiffChange = { fg = colors.base0E, bold = true }
	hi.DiffText = { fg = colors.base0E, bg = colors.base03, bold = true }

	hi.Todo = { fg = colors.base0A, bg = colors.base01, bold = true }
	hi.WarningMsg = { fg = colors.base08, bg = colors.base01, bold = true }
	hi.ErrorMsg = { bg = colors.base08, fg = colors.base06 }
	hi.MatchParen = { bg = colors.base03, bold = true }

	-- Syntax
	hi.Identifier = { fg = colors.base07 }
	hi.Comment = { fg = colors.base03, italic = true }
	hi.Function = { fg = colors.base0D, bold = true }
	hi.Type = { fg = colors.base0A }
	hi.Operator = { fg = colors.base0A }
	hi.Constant = { fg = colors.base09 }
	hi.String = { fg = colors.base0B }
	hi.PreProc = { fg = colors.base08 }

	hi.Statement = { fg = colors.base0E, bold = true }
	hi.Special = { fg = colors.base0A }
	hi.Delimiter = { fg = colors.base05 }

	-- TreeSitter groups
	hi["@function.call"] = { fg = colors.base0D, bold = false }
	hi["@method"] = hi["@function.call"]
	hi["@variable.builtin"] = { fg = colors.base09 }
	hi["@punctuation"] = { fg = colors.base04 }
	hi["@string.escape"] = { fg = colors.base0C }
	hi["@namespace"] = { fg = colors.base0C }

	-- Diagnostics
	hi.DiagnosticError = { fg = colors.base08, bold = true }
	hi.DiagnosticUnderlineError = { sp = colors.base08, undercurl = true }
	hi.DiagnosticWarn = { fg = colors.base09, bold = true }
	hi.DiagnosticUnderlineWarn = { sp = colors.base09, undercurl = true }
	hi.DiagnosticInfo = { fg = colors.base05, bold = true }
	hi.DiagnosticUnderlineInfo = { sp = colors.base05, undercurl = true }
	hi.DiagnosticHint = { fg = colors.base0C, bold = true }
	hi.DiagnosticUnderlineHint = { sp = colors.base0C, undercurl = true }

	hi.SpellBad = hi.DiagnosticUnderlineError
	hi.SpellRare = hi.DiagnosticUnderlineWarn
	hi.SpellLocal = hi.DiagnosticUnderlineHint
	hi.SpellCap = hi.DiagnosticUnderlineHint
end

M.colors = require('base16-colors')

return M
