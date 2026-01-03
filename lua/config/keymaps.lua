vim.g.mapleader = " "
local map = vim.keymap.set

-- Save File
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selected visual line up" })
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selected visual line down" })
-- Indent selected line(s) in visual mode
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- LSP
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP - Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP - Go to definition" })
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP - Hover definition" })

-- Clear search highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Visual block
map("n", "<C-b>", "<C-v>", { noremap = true, desc = "Enter visual-block mode" })

-- Redo
--map("n", "U", "<C-r>", { noremap = true, desc = "Redo" })

-- Split Windows
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- Switch Windows
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Terminal Mode Navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "switch window left" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "switch window right" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "switch window down" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "switch window up" })

-- Cursor
map({ "n", "v" }, "q", "b", { noremap = true, desc = "Jump backwards to start of a word" })
map({ "n", "v" }, "<S-q>", "<ESC>^", { desc = "Move cursor to start of line" })
map({ "n", "v" }, "<S-e>", "<End>", { desc = "Move cursor to end of line" })

-- Prevent Typo with Q and W aliases
vim.cmd([[
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W') ? 'w' : 'W')
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q') ? 'q' : 'Q')
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa') ? 'qa' : 'Q')
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ') ? 'wq' : 'WQ')
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq') ? 'wq' : 'Wq')
cnoreabbrev <expr> wQ ((getcmdtype() is# ':' && getcmdline() is# 'wQ') ? 'wQ' : 'wQ')
]])

--- Plugin Keymaps ---
-- Toggle File Tree
map(
    "n",
    "<leader>e",
    "<Cmd>Neotree toggle source=filesystem<CR>",
    { desc = "Toggle File Explorer" }
)
map("n", "<leader>b", "<Cmd>Neotree toggle reveal source=buffers position=right<CR>", { desc = "Toggle Buffer List" })

-- Toggle terminal
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal (Floating)" })
map("n", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
