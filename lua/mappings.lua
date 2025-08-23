require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gr", vim.lsp.buf.references, { desc = "LSP references" })
-- map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "<leader>dn",function()
  local line = vim.diagnostic.get_next().lnum
  vim.api.nvim_win_set_cursor(0, {line+1, 0})
end)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
