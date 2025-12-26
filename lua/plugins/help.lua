return {
	"folke/which-key.nvim",
	dependencies = { "folke/snacks.nvim" },
  	event = "VeryLazy",
  	opts = {
    	preset = "helix",
    	icons = {
      		rules = false,
    	},
    	spec = {
      		{ "<leader>?", "<cmd>lua Snacks.picker.keymaps()<CR>", desc = "List Keymaps" },
      		-- Dashboard
      		{ "<leader>;", "<cmd>Dashboard<CR>", desc = "Open Dashboard" },
      		{ "<leader>f", group = "fzf" },

    	},
  	},
}
