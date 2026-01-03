return {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    config = function()
    	-- Configure colorscheme
    	require("citruszest").setup({
        	option = {
            	transparent = false,
            	bold = true,
        	},
        	style = {
        	 	WinSeparator = { fg = "#767C77" },
        		FloatBorder = { fg = "#FFAA54", bg = "NONE" },
        		NeoTreeTitleBar = { bg = "#FFAA54" },
        	}
        })
    	-- Set colorscheme
        vim.cmd.colorscheme("citruszest")
    end,
}
