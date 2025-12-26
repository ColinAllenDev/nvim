local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

-- Rebalance Splits
autocmd("VimResized", {
    callback = function()
        vim.cmd("wincmd =")
    end,
    desc = "Equalize Splits",
})

-- Highlight Yank
autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
    pattern = "*",
})

-- Enter Terminal
autocmd("TermOpen", {
    pattern = "term://*toggleterm#*",
    callback = function()
        vim.keymap.set("t", "<Esc>", "<cmd>ToggleTerm<CR>", { buffer = true, noremap = true, silent = true })
    end,
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
usercmd("CppToCStyleComment", [[%s@//\s*\(.\{-}\)\s*$@/* \1 */@]], {})

-- Filesystem/Buffers Tree
usercmd("NeotreeSplit", function()
    vim.cmd("Neotree toggle filesystem position=left")
    vim.cmd("split")
    vim.cmd("Neotree toggle source=buffers position=current")
end, {})

-- Format
vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
