local settings = {}
local current_folder = (...):gsub("%.settings$", "")

local get_settings_extension = function(server_name)
	local settings_extensions = require(current_folder .. ".settings_extensions")
	return settings_extensions[server_name].settings
end

settings.setup = function(server)
	-- check if this server has extensions to the common settings
	-- return common_settings
	-- common settings
	local settings = {}

	local has_extension, extended_settings = pcall(get_settings_extension, server)
	if has_extension then
		local settings_extension = extended_settings(server)
		for k, v in pairs(settings_extension) do
			settings[k] = v
		end

		return settings
	end

	return settings
end

return settings
