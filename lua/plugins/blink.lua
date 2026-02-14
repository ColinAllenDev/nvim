return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    build = "cargo build --release",
    event = "LspAttach",
    opts = {
        sources = {
            default = { "lazydev", "lsp", "snippets", "path", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                cmdline = {
                	min_keyword_length = function(ctx)
                		if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
                			return 3
                		end
                		return 0
                	end
                }
            },
        },
        completion = {
            list = {
                selection = { preselect = true, auto_insert = true },
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                border = "bold",
                draw = {
                	padding = { 0, 1 },
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
                window = { border = "bold", position = "right" },
            },
            ghost_text = { enabled = false },
        },
        appearance = {
            kind_icons = require("ui.icons").kind,
        },
        keymap = {
            preset = "enter",
            ["<C-y>"] = { "select_and_accept" },
            ["<C-j>"] = { "select_next", 'fallback' },
            ["<C-k>"] = { "select_prev", 'fallback' },
        },
        cmdline = { 
        	keymap = {
        		['<Tab>'] = { 'accept' },
    			['<CR>'] = { 'accept_and_enter', 'fallback' },
        	},
        	completion = { menu = { auto_show = true } },
        },
        signature = { enabled = true },
    },
}

