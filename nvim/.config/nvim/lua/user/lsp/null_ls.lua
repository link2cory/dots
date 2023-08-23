local null_ls = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local util = require("vim.lsp.util")

null_ls.setup = function()
	local status_ok, server = pcall(require, "null-ls")
	if not status_ok then
		return
	end
	local formatting = server.builtins.formatting
	server.setup({
		debug = true,
		sources = {
			formatting.stylua,
			formatting.prettier,
		},
		on_attach = function(client, bufnr)
			print(client.name)
			if client.supports_method("textDocument/formatting") then
				print("ehhlo")
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						local params = util.make_formatting_params({})
						client.request("textDocument/formatting", params, nil, bufnr)
					end,
				})
			end
		end,
	})

	-- testing
	local helpers = require("null-ls.helpers")
	server.register({
		method = server.methods.FORMATTING,
		filetypes = { "php" },
		generator = helpers.formatter_factory({
			command = "docker",
			args = {
				"exec",
				"-i",
				"laradock-workspace-1", -- todo: don't hard-code this
				"vendor/bin/php-cs-fixer",
				"fix",
				"--no-interaction",
				"--quiet",
				-- "tests/Unit/Jobs/Pipeline/Process/AggregateTest.php",
				"$FILENAME",
			},
			to_stdin = false,
			to_temp_file = true,
			from_temp_file = true,
			check_exit_code = function(code, stderr)
				if code ~= 0 then
					vim.schedule(function()
						vim.notify(stderr)
					end)
					return true
				else
					return true
				end
			end,
		}),
	})
end

return null_ls
