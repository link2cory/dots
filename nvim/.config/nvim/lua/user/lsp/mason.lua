local mason = {}

mason.setup = function()
	local status_ok, mason = pcall(require, "mason")
	if not status_ok then
		return
	end

	local status_ok, lspconfig = pcall(require, "mason-lspconfig")
	if not status_ok then
		return
	end

	mason.setup({
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗",
			},
		},
	})

	lspconfig.setup({
		automatic_installation = true,
	})
end

return mason
