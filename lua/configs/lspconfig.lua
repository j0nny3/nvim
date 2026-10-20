require("nvchad.configs.lspconfig").defaults()

local servers = { "jdtls", "ts_ls", "pyright", "sonarlint-language-server" }
-- "html", "cssls", "java_language_server"

vim.lsp.enable(servers)
