return {
	"stevearc/conform.nvim",
  	event = "LspAttach",
  	opts = {
    	formatters_by_ft = {
      	lua = { "stylua" },
		sh = { "shfmt" },
      	c = { "clang-tidy" },
      	--python = {
        --	"ruff_fix",
        --	"ruff_format",
        --	"ruff_organize_imports",
      	--},
      	--html = { "prettierd" },
      	--css = { "prettierd" },
      	--javascript = { "prettierd" },
      	--markdown = { "prettierd" },
      	--json = { "prettierd" },
      	--jsonc = { "prettierd" },
    	},
  	},
}
