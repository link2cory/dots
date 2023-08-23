local plugins = {}

plugins.setup = function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "Everblush/nvim", as = "everblush" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"nvim-telescope/telescope.nvim",
    tag = '0.1.1',
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim" } },
	})
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", run = ":TSUpdate" })
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim", requires = "williamboman/mason-lspconfig" })
	use({ "williamboman/mason-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "bb19d790e139713eaddbcd8fd8ee58a23d290bda" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
  use({ "tpope/vim-fugitive"})
	use({
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	})
	use({ "lewis6991/gitsigns.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "numToStr/Comment.nvim" })
	-- use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "windwp/nvim-autopairs" })
	use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "rmagatti/auto-session" })
use {
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-phpunit"
  }
}
use {
    'Equilibris/nx.nvim',
    requires = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require("nx").setup {}
    end
}
end

return plugins
