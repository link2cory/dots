local current_folder = (...):gsub("%.init$", "")
local mason = require(current_folder .. ".mason")
local configs = require(current_folder .. ".configs")
local diagnostics = require(current_folder .. ".diagnostics")
local lsp = {}

lsp.setup = function()
	mason.setup()
	configs.setup()
	diagnostics.setup()
end

return lsp
