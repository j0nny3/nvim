vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

require('telescope').setup{
  defaults = {
    follow = true,
  },pickers = {
    find_files = {
      follow = true,   -- explicitly follow symlinks
    },
    live_grep = {
      follow = true,
    },
  },
}
-- ----------------------
-- lsp
-- ----------------------
local lspconfig = require('lspconfig')
lspconfig.gdscript.setup{}

local cwd = vim.fn.getcwd()

if cwd:match("card_battle") then
    lspconfig.gdscript.setup({ cmd = { "nc", "127.0.0.1", "6005" } })
elseif cwd:match("cardbattle_server") then
    lspconfig.gdscript.setup({ cmd = { "nc", "127.0.0.1", "6008" } })
end

-- write breakpoint to new line
vim.api.nvim_create_user_command('GodotBreakpoint', function()
    vim.cmd('normal! obreakpoint' )
    vim.cmd('write' )
end, {})
vim.keymap.set('n', '<leader>b', ':GodotBreakpoint<CR>')

-- delete all breakpoints in current file
vim.api.nvim_create_user_command('GodotDeleteBreakpoints', function()
    vim.cmd('g/breakpoint/d')
end, {})
vim.keymap.set('n', '<leader>BD', ':GodotDeleteBreakpoints<CR>')

-- search all breakpoints in project
vim.api.nvim_create_user_command('GodotFindBreakpoints', function()
    vim.cmd(':grep breakpoint | copen')
end, {})
vim.keymap.set('n', '<leader>BF', ':GodotFindBreakpoints<CR>')

