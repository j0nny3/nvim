require("nvchad.configs.lspconfig").defaults()

require("java").setup()

local servers = { "html", "cssls" ,"jdtls","pyright"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
