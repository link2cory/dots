local current_folder = (...):gsub('%.init$', '')
local manager = require(current_folder .. ".manager")
local plugin_list = require(current_folder .. ".plugins")

local plugins = {}
plugins.setup = function()
  local packer = manager.setup()

  packer.startup(plugin_list.setup)

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end

return plugins
