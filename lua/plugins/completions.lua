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
                selection = { preselect = false, auto_insert = true },
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                border = "bold",
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "kind", gap = 1 },
                    },
                },
            },
            documentation = {
                auto_show = true,
                window = { border = "bold" },
            },
        },
        appearance = {
            kind_icons = require("ui.icons").kind,
        },
        keymap = {
            preset = "enter",
            ["<C-y>"] = { "select_and_accept" },
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
-- Autocompletion
-- {
-- 	"hrsh7th/nvim-cmp",
-- 	version = false,
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"hrsh7th/cmp-path",
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-omni",
-- 		"hrsh7th/cmp-cmdline",
-- 		"L3MON4D3/LuaSnip",
-- 		"saadparwaiz1/cmp_luasnip",
-- 		"onsails/lspkind.nvim",
-- 		"windwp/nvim-autopairs",
-- 	},
-- 	opts = function()
-- 		local cmp = require("cmp");
-- 		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- 		local lspkind = require("lspkind")
--
-- 		cmp.setup {
-- 			enabled = function()
-- 				local disabled = false
-- 				disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
-- 				disabled = disabled or (vim.fn.reg_recording() ~= '')
-- 				disabled = disabled or (vim.fn.reg_executing() ~= '')
-- 				disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
-- 				return not disabled
-- 			end,
-- 			snippet = {
-- 				expand = function(args)
-- 					require('luasnip').lsp_expand(args.body)
-- 				end
-- 			},
-- 			sources = {
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" },
-- 				{ name = "path" },
-- 				{ name = "buffer", keyword_length = 2 },
-- 			},
-- 			completion = {
-- 				keyword_length = 1,
-- 				completeopt = "menu"
-- 			},
-- 			window = {
-- 				completion = cmp.config.window.bordered(),
-- 				documentation = cmp.config.window.bordered(),
-- 			},
-- 			formatting = {
-- 				format = lspkind.cmp_format({
-- 					mode = "symbol",
-- 					maxwidth = { menu = 50, abbr = 50 },
-- 					ellipsis_char = "...",
-- 					show_labelDetails = true,
-- 					before = function (entry, vim_item)
-- 						return vim_item
-- 					end
-- 				})
-- 			},
-- 			mapping = cmp.mapping.preset.insert {
-- 				["<C-j>"] = function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_next_item()
-- 					else
-- 						fallback()
-- 					end
-- 				end,
-- 				["<C-k>"] = function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_prev_item()
-- 					else
-- 						fallback()
-- 					end
-- 				end,
-- 				["<C-S-j>"] = function(fallback)
-- 					if cmp.visible() then
-- 						cmp.mapping.scroll_docs(-4)
-- 					else
-- 						fallback()
-- 					end
-- 				end,
-- 				["<C-S-k>"] = function(fallback)
-- 					if cmp.visible() then
-- 						cmp.mapping.scroll_docs(4)
-- 					else
-- 						fallback()
-- 					end
-- 				end,
-- 				["<CR>"] = cmp.mapping.confirm { select = true },
-- 				--["<Esc>"] = cmp.mapping.close(),
-- 			}
-- 		}
--
-- 		cmp.event:on(
-- 			"confirm_done",
-- 			cmp_autopairs.on_confirm_done()
-- 		)
--
-- 		cmp.setup.cmdline("/", {
-- 			mapping = cmp.mapping.preset.cmdline(),
-- 			sources = {
-- 				{ name = "buffer" }
-- 			}
-- 		})
--
-- 		cmp.setup.cmdline(":", {
-- 			mapping = cmp.mapping.preset.cmdline(),
-- 			sources = cmp.config.sources({
-- 				{ name = "path" }
-- 			}, {
-- 				{ name = "cmdline" },
-- 			}),
-- 			matching = { disallow_symbol_nonprefix_matching = false },
-- 		})
-- 	end
-- },
