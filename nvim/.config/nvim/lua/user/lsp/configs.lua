local configs = {}
local current_folder = (...):gsub('%.configs$', '')
local capabilities = require(current_folder .. ".capabilities")
local on_attach = require(current_folder .. ".on_attach")
local null_ls = require(current_folder .. ".null_ls")

configs.setup = function()
  local status_ok, lspconfig = pcall(require, "lspconfig")
  if not status_ok then
    return
  end

  local servers = {
    "sumneko_lua",
  }

  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      on_attach = on_attach.setup(server),
      capabilities = capabilities.setup()
    })
  end
  null_ls.setup()
end

return configs
