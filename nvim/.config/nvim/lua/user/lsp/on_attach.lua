local on_attach = {}
local current_folder = (...):gsub("%.on_attach$", "")

local get_on_attach_extension = function(client_name)
	local server_extensions = require(current_folder .. ".server_extensions")
	return server_extensions[client_name].on_attach
end

local common_on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local map = vim.keymap.set
	map("n", "<leader>gd", vim.lsp.buf.definition, opts)
	map("n", "K", vim.lsp.buf.hover, opts)

	-- run any extensions for this server/client
	local has_extension, extended_on_attach = pcall(get_on_attach_extension, client.name)
	if has_extension then
		extended_on_attach(client, bufnr)
	end
end

on_attach.setup = function()
	-- check if this server has extensions to the common on_attach
	return common_on_attach
end

return on_attach
