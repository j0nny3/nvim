require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gr", vim.lsp.buf.references, { desc = "LSP references" })
-- map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "<leader>dn",function()
  local diag = vim.diagnostic.get_next()
  if diag then
  vim.api.nvim_win_set_cursor(0, {diag.lnum+1, 0})
  end
end)
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
