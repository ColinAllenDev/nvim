return { 
	"zootedb0t/citruszest.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		option = {
			transparent = false,
			bold = true
		},
	},
	config = function() vim.cmd.colorscheme "citruszest" end
}
