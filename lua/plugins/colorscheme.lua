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
        		FloatBorder = { fg = "#FFAA54", bg = "NONE" },
        	 	WinSeparator = { fg = "#767C77" },
        	}
        })
    	-- Set colorscheme
        vim.cmd.colorscheme("citruszest")
    end,
}
