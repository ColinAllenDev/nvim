local icons = require("ui.icons")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = { { import = "plugins" } },
    checker = { enabled = true, frequency = 3600 },
    install = { colorscheme = { "citruszest" } },
    change_detection = { enabled = false, notify = false },
    ui = {
        border = "rounded",
        icons = {
            cmd = icons.ui.BoxChecked,
            config = icons.ui.Gear,
            event = icons.ui.Pacman,
            ft = icons.kind.File,
            init = icons.ui.BoxChecked,
            import = icons.ui.SignIn,
            keys = icons.kind.Key,
            lazy = icons.ui.Timer,
            loaded = icons.ui.Check,
            not_loaded = icons.ui.Hourglass,
            runtime = icons.ui.Fire,
            source = icons.ui.Code,
            start = icons.ui.BoxChecked,
            task = icons.ui.Spanner,
        },
    },
})
