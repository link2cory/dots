local keymap = {}

keymap.setup = function()
  local opts = { noremap = true, silent = true }
  local term_opts = { silent = true }
  local map = vim.api.nvim_set_keymap

  -- leader
  map("", "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- buffers
  map("n", "<C-s>", "<cmd>lua vim.api.nvim_command('write')<cr>", opts)
  map("n", "<C-w>", "<cmd>lua vim.api.nvim_command('close')<cr>", opts)

  -- telescope
  map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
  map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
end

return keymap
