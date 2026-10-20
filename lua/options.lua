require "nvchad.options"

-- add yours here!

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.guifont = { "JetBrainsMono Nerd Font Mono", ":h14" }
vim.o.tabstop = 4        -- A tab character equals 4 spaces
vim.o.shiftwidth = 4     -- Indent/outdent 4 spaces
vim.o.expandtab = true   -- Convert tabs to spaces
vim.o.softtabstop = 4    -- Pressing Tab inserts 4 spaces
vim.o.autoindent = true  -- Keep the same indent on new lines
vim.o.smartindent = true -- Smart auto-indenting for code
vim.wo.colorcolumn = "150"
vim.opt.textwidth = 150

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
