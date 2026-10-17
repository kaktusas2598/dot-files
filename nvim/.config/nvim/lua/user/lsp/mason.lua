local servers = {
  "lua_ls",
  "pyright",
  "cmake",
  "jsonls",
  "clangd",
  "phpactor",
  "gopls",
  "ts_ls",
  "eslint",
  "html",
  "cssls",
}

require("mason").setup({
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "tree-sitter-cli",
    "lua-language-server",
    "pyright",
    "cmake-language-server",
    "json-lsp",
    "clangd",
    "phpactor",
    "gopls",
    "typescript-language-server",
    "eslint-lsp",
    "html-lsp",
    "css-lsp",
  },
  run_on_start = true,
  start_delay = 0,
})

local handlers = require("user.lsp.handlers")

vim.lsp.config("*", {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})

for _, server in ipairs(servers) do
  local opts = {}
  local settings_ok, server_settings = pcall(require, "user.lsp.settings." .. server)
  if settings_ok then
    opts = server_settings
  end
  vim.lsp.config(server, opts)
end

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_enable = false,
})

-- Enable every configured server even when it is provided by the system
-- instead of Mason.
vim.lsp.enable(servers)
