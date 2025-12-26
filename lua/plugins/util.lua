return {
	-- Comment Utility
	{ "numToStr/Comment.nvim", opts = {} },
	-- Icon Picker
	{
		"2KAbhishek/nerdy.nvim",
		dependencies = { "folke/snacks.nvim" },
		cmd = "Nerdy",
		opts = {
			add_default_keybindings = false,
			copy_to_clipboard = true,
		},
		keys = {
			{ 
				"<leader>fi", 
		  		"<cmd>Nerdy<cr>", 
		  		desc = "Find Icons",
	  		},
		}
	},
	-- Material Icons
	{ 
		"DaikyXendo/nvim-material-icon", 
		lazy = true 
	},
  	{
    	"brenoprata10/nvim-highlight-colors",
    	event = { "BufReadPost", "BufNewFile" },
    	opts = {
      		exclude_filetypes = {
        		"lazy",
      	  	},
    	},
  	},
  	{
    	"nvim-treesitter/nvim-treesitter-context",
    	cmd = "TSContextToggle",
    	opts = {
      	  	enable = false,
      	  	zindex = 10,
    	},
  	},
  	{
    	"altermo/ultimate-autopair.nvim",
    	event = { "InsertEnter" },
    	branch = "v0.6",
    	opts = {},
  	},
}
