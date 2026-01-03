---@type vim.lsp.Config
return {
    cmd = {
        "clangd",
        "--background-index",
        "--header-insertion=never",
        "--clang-tidy",
    },
}
