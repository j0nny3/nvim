require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function()
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    vim.opt.title = true
    vim.opt.titlestring = "" .. cwd
  end,
})
