return	{
	"stevearc/overseer.nvim",
	opts = {
		dap = false,
	},
	keys = {
		{ "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Run Task"},
		{ "<leader>rl", "<cmd>OverseerRestart<cr>", desc = "Restart Last Task"},
		{ "<leader>rt", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List"},
		{ "<C-r>", "<cmd>OverseerRun<cr>", desc = "Run Task"},
	},
	config = function()
		local overseer = require("overseer")
		local task_list = require("overseer.task_list")

		vim.api.nvim_create_user_command("OverseerRestart", function()
			local tasks = overseer.list_tasks({ sort = task_list.sort_finished_recently })	
			if vim.tbl_isempty(tasks) then
				vim.notify("No tasks found", vim.log.levels.WARN)
			else
				local most_recent = tasks[1]
				overseer.run_action(most_recent, "restart")
			end
		end, {})
	end,
}
