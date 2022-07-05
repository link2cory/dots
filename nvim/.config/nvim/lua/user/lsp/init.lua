local current_folder = (...):gsub("%.init$", "")
local installer = require(current_folder .. ".installer")
local configs = require(current_folder .. ".configs")
local diagnostics = require(current_folder .. ".diagnostics")
local lsp = {}

lsp.setup = function()
	installer.setup()
	configs.setup()
	diagnostics.setup()
end

return lsp
