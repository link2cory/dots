local plugins = {}

plugins.setup = function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "everblush/everblush.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" })
  use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim" } } })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/nvim-lsp-installer" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "hrsh7th/nvim-cmp" }) 
	use({ "hrsh7th/cmp-buffer" }) 
	use({ "hrsh7th/cmp-path" }) 
	use({ "saadparwaiz1/cmp_luasnip" }) 
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
  use({ "folke/lua-dev.nvim", config = function() require('lua-dev').setup() end })
end

return plugins
