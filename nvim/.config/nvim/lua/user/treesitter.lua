local treesitter = {}

treesitter.setup = function()
	local status_ok, configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end

	configs.setup({
		ensure_installed = {
     "lua",
     "php",
     "javascript",
     "typescript",
     "html",
     "css",
     "json"
   },
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },
	})
end

return treesitter
