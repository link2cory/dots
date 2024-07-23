local everblush = require("everblush")
local colors = {}
local hi = vim.highlight.create

colors.setup = function()
	--everblush.setup({ nvim_tree = { contrast = false } })
	-- vim.cmd("colorscheme everblush")

	local comment = "#404749"
	local contrast = "#161d1f"
	local background = "#141b1e"
	local foreground = "#dadada"
	local cursorline = "#2c333"
	local cursor = "#dadada"
	local color0 = "#232a2d"
	local color1 = "#e57474"
	local color2 = "#8ccf7e"
	local color3 = "#e5c76b"
	local color4 = "#67b0e8"
	local color5 = "#c47fd5"
	local color6 = "#6cbfbf"
	local color7 = "#b3b9b8"
	local color8 = "#3b4244"
	local color9 = "#ef7d7d"
	local color10 = "#6bc568"
	local color11 = "#f4d67a"
	local color12 = "#71baf2"
	local color13 = "#ce89df"
	local color14 = "#67cbe7"
	local color15 = "#bdc3c2"

	-- everblush theme does not include many highlight groups
	-- vim.api.nvim_set_hl(0, "PMenu", { bg = color13, fg = "#dadada" })
	vim.api.nvim_set_hl(0, "TSComment", { fg = "#404749" })
	vim.api.nvim_set_hl(0, "@float", { fg = "#e5c76b" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#404749" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b3b9b8" })

	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#e57474" })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#e5c76b" })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#b3b9b8" })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#8ccf7e" })
	vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#8ccf7e", bg = "None" })

	-- vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "#181f21", fg = "#ffffff" })
	-- vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "#181f21", fg = "#ffffff" })
	-- vim.api.nvim_set_hl(0, "DiagnosticInfo", { bg = "#181f21", fg = "#ffffff" })
	-- vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "#181f21", fg = "#ffffff" })
	--
	vim.api.nvim_set_hl(0, "CursorLine", { bg = color0 })
end

return colors
