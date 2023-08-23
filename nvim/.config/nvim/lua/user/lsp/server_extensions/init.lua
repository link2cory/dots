local server_extensions = {}

-- server_extensions.lua_ls = {
-- 	on_attach = function(client, bufnr) end,
-- }

server_extensions.rust_analyzer = {
  on_attach = function(client, bufnr)
    print('rust analyuzer on attach')
  end
  -- settings = {
  --
  -- }
}
return server_extensions
