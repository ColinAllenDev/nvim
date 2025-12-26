return {
  	"nvim-tree/nvim-tree.lua",
  	cmd = "NvimTreeFindFileToggle",
  	opts = {
  	  	sync_root_with_cwd = true,
  	  	view = {
  	  	  	adaptive_size = true,
  	  	    width = 30,
  	  	},
  	  	git = {
  	  	  	ignore = false, 
  	  	},
  	  	renderer = {
  	  	  	indent_markers = {
  	  	    	enable = false,
  	  	    	inline_arrows = true,
  	  	  	},
  	  	  	root_folder_label = false,
  	  	},
	},
}
