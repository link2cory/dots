local capabilities = {}

capabilities.setup = function()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  if not status_ok then
    return capabilities
  end

  local updated_capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  return updated_capabilities
end

return capabilities
