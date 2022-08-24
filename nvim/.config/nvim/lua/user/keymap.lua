local keymap = {}

keymap.setup = function()
	local opts = { noremap = true, silent = true }
	local term_opts = { silent = true }
	local map = vim.api.nvim_set_keymap

	-- leader
	map("", "<Space>", "<Nop>", opts)
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	map("n", "qq", ":qa!<cr>", opts)
	map("n", "qw", ":wq<cr>", opts)

	-- navigation
	map("n", "<C-h>", "<C-w>h", opts)
	map("n", "<C-j>", "<C-w>j", opts)
	map("n", "<C-k>", "<C-w>k", opts)
	map("n", "<C-l>", "<C-w>l", opts)

	-- Navigate buffers
	map("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
	map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

	-- buffers
	map("n", "<C-s>", "<cmd>lua vim.api.nvim_command('write')<cr>", opts)
	map("n", "<C-w>", "<cmd>lua vim.api.nvim_command('close')<cr>", opts)

	-- telescope
	map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
	map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
	map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)

	-- nvim tree
	map("n", "<leader>t", "<cmd>lua require('nvim-tree').toggle()<cr>", opts)

	-- reload luasnips
	map("n", "<leader>rr", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>", opts)

	map("n", "<C-Up>", ":resize -2<CR>", opts)
	map("n", "<C-Down>", ":resize +2<CR>", opts)
	map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
	map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
end

return keymap
