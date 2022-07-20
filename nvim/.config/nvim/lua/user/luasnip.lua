local m = {}
m.setup = function()
	local status_ok, ls = pcall(require, "luasnip")
	if not status_ok then
		return
	end

	local types = require("luasnip.util.types")

	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "<-", "Error" } },
				},
			},
		},
	})

	ls.add_snippets("all", { ls.snippet("test", { ls.text_node("test snippet") }) })

	ls.snippets = {
		all = {
			--ls.snippet("test", { ls.text_node("test snippet") }),
			ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
		},
		lua = {},
	}

	vim.keymap.set({ "i", "s" }, "<c-p>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { noremap = true, silent = true })
end
return m
