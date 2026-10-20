-- Force 4 spaces for specific filetypes that override it
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java", "lua", "javascript", "html", "css", "json", "yaml", "markdown" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
    vim.wo.breakindent = true
    vim.wo.breakindentopt = "shift:4"
  end,
})


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

require "options"
require "autocmds"
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")


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
