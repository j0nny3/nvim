require("nvchad.configs.lspconfig").defaults()
require("java").setup()
require("lspconfig").jdtls.setup {}
local servers = { "pyright" }
-- "html", "cssls"
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
