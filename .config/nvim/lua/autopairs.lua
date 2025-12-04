local _M = {}

local surrounds = {
	["("] = ")",
	["["] = "]",
	["{"] = "}",
	["<"] = ">",
	["\""] = "\"",
	["'"] = "'",
}

function _M.setup()
	for pre, post in pairs(surrounds) do
		vim.keymap.set('i', pre, pre .. post .. "<cmd>normal! h<cr>")
	end
end

return _M
