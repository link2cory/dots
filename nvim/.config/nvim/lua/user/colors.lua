local everblush = require("everblush")
local colors = {}
local hi = vim.highlight.create

colors.setup = function()
	everblush.setup({ nvim_tree = { contrast = true } })

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
	local color14 = "##67cbe7"
	local color15 = "#bdc3c2"

	-- everblush theme does not include many highlight groups
	hi("PMenu", { guibg = "#181f21", guifg = "#dadada" })
	hi("TSComment", { guifg = "#404749" })
	hi("LineNr", { guifg = "#404749" })

	hi("DiagnosticError", { guifg = "#e57474" })
	hi("DiagnosticWarn", { guifg = "#e5c76b" })
	hi("DiagnosticInfo", { guifg = "#b3b9b8" })
	hi("DiagnosticHint", { guifg = "#8ccf7e" })

	-- hi("DiagnosticError", { guibg = "#181f21", guifg = "#ffffff" })
	-- hi("DiagnosticWarn", { guibg = "#181f21", guifg = "#ffffff" })
	-- hi("DiagnosticInfo", { guibg = "#181f21", guifg = "#ffffff" })
	-- hi("DiagnosticHint", { guibg = "#181f21", guifg = "#ffffff" })
	--
	hi("CursorLine", { guibg = color0 })
end

return colors
