--- System ---
-- Enable mouse mode (can be useful for resizing splits)
vim.o.mouse = "a"
-- Save undo history
vim.o.undofile = true
-- Number of commands to remember
vim.o.history = 100
-- Raise dialog to confirm action (like quitting without saving)
vim.o.confirm = true
-- Length of time to wait for a mapped sequence
vim.opt.timeoutlen = 500
-- Length of time to wait before triggering the plugin
vim.opt.updatetime = 300
-- Hide blank characters
vim.opt.fillchars = { eob = " " }
-- Allow external config
vim.opt.exrc = true
-- Swapfile
vim.o.swapfile = false
-- Disable default file browser
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- System clipboard
vim.o.clipboard = "unnamedplus"
-- What is saved in a session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- Minimum number of lines to keep above and below the cursor
vim.o.scrolloff = 4
-- Options for insert mode completions
vim.opt.completeopt = { "menu", "popup" }

--- UI ----
-- Statusline configuration
vim.opt.statusline = "%{%v:lua.require'ui.statusline'.draw()%}"
-- Statuscolumn configuration
vim.opt.statuscolumn = "%{%v:lua.require'ui.statuscolumn'.draw()%}"
-- Windowbar configuration
vim.opt.winbar = "%{%v:lua.require'ui.winbar'.draw()%}"
-- Enable 24-bit true colors in terminal emulator
vim.o.termguicolors = true
-- Enable dark theme
vim.o.background = "dark"
-- Displays sign column in number column when needed
vim.o.signcolumn = "yes"
-- Preview substitutions live as you type
vim.o.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- Show line numbers
vim.o.number = true
-- Show relative number
vim.o.relativenumber = true
-- Set column width to 2 digits
vim.o.numberwidth = 2
-- Only last window has status line
vim.o.laststatus = 3
-- Disable show mode (it's already on the status line)
vim.o.showmode = false
-- Split windows spawn right of current window
vim.o.splitright = true
-- Split windows spawn below current window
vim.o.splitbelow = true
-- Maintain code view when splitting
vim.opt.splitkeep = "screen"
-- Popup menu height
vim.opt.pumheight = 10
-- Window title
vim.opt.title = true

--- Text & Formatting ---
-- Enable nerd font
vim.g.have_nerd_font = true
-- Tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
-- Indentation
vim.o.autoindent = true
vim.o.backspace = "indent,eol,start"
vim.o.copyindent = true
vim.o.preserveindent = true
-- Wrapping
vim.o.wrap = true
-- Every wrapped line will continue visually indented
vim.o.breakindent = true
-- Which keys can move to next line when cursor is at eol
vim.o.whichwrap = "<>[]hl"
-- Case sensitive searching
vim.o.smartcase = true

--- LSP ---
vim.diagnostic.config({
    update_in_insert = true,
})
