return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        auto_restore = false,
        suppressed_dirs = { "~/", "/", "~/.config" },
        post_restore_cmds = { "Neotree action=show" },
        pre_save_cmds = { "Neotree action=close" },
    },
}
