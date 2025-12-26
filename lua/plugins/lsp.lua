return {
	-- Default LSP Configs
	{ "neovim/nvim-lspconfig" },
	-- LSP Notifications
	{ 
		"j-hui/fidget.nvim", 
		opts = { 
			notification = { 
				window = { winblend = 0 } 
			}, 
		}, 
	},
	-- LSP Package Manager
	{ 
		"mason-org/mason.nvim", 
		opts = {}, 
		dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" } 
	},
	-- LSP Context in Status Bar
	{
		"SmiteshP/nvim-navic",
  		dependencies = { "neovim/nvim-lspconfig" },
  		event = "LspAttach",
  		opts = {}
	}
}
