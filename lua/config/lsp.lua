local icon = require("ui.icons").diagnostics
local lsp = vim.lsp
local map = vim.keymap.set

vim.diagnostic.config({
  underline = false,
  signs = {
    text = {
      icon.Error,
      icon.Warning,
      icon.Information,
      icon.Hint,
    },
    numhl = {
      "ErrorMsg",
      "WarningMsg",
    },
  },
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
  jump = { float = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Configure LSP On Attach",
  callback = function(args)
    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local navic = require("nvim-navic")

    if client:supports_method("textDocument/documentColor") then
      	vim.lsp.document_color.enable(true, args.buf)
    end

    if client:supports_method("textDocument/semanticTokens/full") then
      	client.server_capabilities.semanticTokensProvider = nil
    end

    if client:supports_method("textDocument/documentSymbol") then
    	navic.attach(client, bufnr)
    end
  end,
})

-- Enable LSP
vim.lsp.enable({
  "lua_ls",
  "clangd",
  -- "cssls",
  -- "html",
  -- "ts_ls",
  -- "basedpyright",
  -- "bashls",
  -- "jsonls",
  -- "ruff",
})
