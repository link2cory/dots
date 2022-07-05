local null_ls = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup = function() 
  local status_ok, server = pcall(require, "null-ls")
  if not status_ok then
    return
  end
  local formatting = server.builtins.formatting
  server.setup({
    sources = {
      formatting.stylua
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.formatting_sync()
          end,
        })
      end
    end
  })
end

return null_ls
