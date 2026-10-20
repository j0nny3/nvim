require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gr", vim.lsp.buf.references, { desc = "LSP references" })
-- map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "<leader>dn", function()
  local diag = vim.diagnostic.get_next()
  if diag then
    vim.api.nvim_win_set_cursor(0, { diag.lnum + 1, 0 })
  end
end)
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })

map("i", "<C-v>", "<C-r>+")
map("c", "<C-v>", "<C-r>+")
map("n", "<C-v>", "<C-r>+")

if vim.g.neovide then
    local change_scale = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end

    -- Zoom in / out / reset
    map("n", "<C-+>", function() change_scale(1.25) end, { desc = "Zoom in" })
    map("n", "<C-->", function() change_scale(1 / 1.25) end, { desc = "Zoom out" })
    map("n", "<C-0>", function() vim.g.neovide_scale_factor = 1.0 end, { desc = "Reset zoom" })
end

-- random utility
map({ "n" }, "<M-.>", "@:", { desc = "repeat last command" })
--map("n", "<leader>j", ":w<CR>:!java -cp \"target/classes;target/test-classes;$(mvn dependency:build-classpath -Dmdep.outputFile=/dev/stdout -q -DincludeScope=test)\" org.junit.platform.console.ConsoleLauncher --select-class %:t:r<CR>", { desc = "run java test class" })

--git bindings
local gitsigns = require "gitsigns"
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git preview hunk" })
map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git reset hunk" })
map("n", "<leader>gb", gitsigns.blame_line, { desc = "git blame line" })
