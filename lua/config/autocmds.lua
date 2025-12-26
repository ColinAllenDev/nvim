local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

-- Startup Event
autocmd('VimEnter', {
	callback = function() 
		vim.cmd("Neotree toggle reveal source=filesystem position=left")
	end 
})

-- Rebalance Splits
autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
  desc = "Equalize Splits",
})

-- Highlight Yank
autocmd('TextYankPost', {
	callback = function()
		vim.hl.on_yank()
	end,
	pattern = "*"
})

-- Enter Terminal
autocmd("TermOpen", {
	pattern = "term://*toggleterm#*",
	callback = function()
		vim.keymap.set("t", "<Esc>", '<cmd>ToggleTerm<CR>', { buffer = true, noremap = true, silent = true})
	end
})

-- Don't continue comments
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})



-- Update statusline highlight.
autocmd("ColorScheme", {
	callback = require("ui.highlight").statusline_highlight,
})

-- Enable tressitter features
autocmd("FileType", {
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

--- User Commands ---
-- C++ -> C Comment Style --
usercmd('CppToCStyleComment', [[%s@//\s*\(.\{-}\)\s*$@/* \1 */@]], {})

-- Filesystem/Buffers Tree
usercmd("NeotreeSplit", function() 
	vim.cmd('Neotree toggle filesystem position=left')
	vim.cmd('split')
	vim.cmd('Neotree toggle source=buffers position=current')
end, {})


