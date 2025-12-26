return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { 
		{"antosha417/nvim-lsp-file-operations", opts = {} },
		{"s1n7ax/nvim-window-picker", opts = {} }
	},
	lazy = false,
	opts = {
		auto_clean_after_session_restore = true,
		close_if_last_window = true,
		popup_border_style = "NC",
		sources = { "filesystem", "buffers", "document_symbols" },
		source_selector = {
			winbar = false,
			sources = {
				{ source = "filesystem" },
				{ source = "buffers" },
				{ source = "document_symbols" },
			}
		},
		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				-- Linux
				vim.fn.jobstart({"xdg_open", path}, {detach = true})
				-- MacOS
				--vim.fn.jobstart({"open", path}, {detach = true})
			end
		},
		default_component_configs = {
			modified = {
				symbol = '•'
			},
			name = {
				highlight_opened_files = false
			},
			icon = {
				folder_closed 		= "",
				folder_open 		= '',
				folder_empty 		= '',
				folder_empty_open 	= '',
			},
			indent = {
				with_markers = false,
				with_expanders = true,
			},
		},
		window = {
			mappings = {
				["<esc>"] = "close_window",
			}
		},
		filesystem = { 
			enable_git_status = false,
			git_status_async = false,
			open_files_do_not_replace_types = { "terminal", "Trouble", "edgy" },
			window = {
				position = "left",
				width = 30,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["O"] = "system_open",
					["p"] = { "toggle_preview", config = { use_float = true } },
					["<C-S-j>"] = { "scroll_preview", config = { direction = -10 } },
					["<C-S-k>"] = { "scroll_preview", config = { direction = 10 } },
					["<C-r>"] = "refresh",
				},
			},
			filtered_items = {
				visible = false,
				show_hidden_count = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_ignored = true,
				ignore_files = {
					".ignore"
				},
				hide_by_name = {
					".DS_Store",
					".git",
					".cache",
					".github",
					"lazy-lock.json"
				},
			},
		},
	},
}
