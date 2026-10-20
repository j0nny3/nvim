require("nvim-treesitter.configs").setup({
  ensure_installed = { "vim", "lua", "vimdoc", "html", "css", "java", "python", "gdscript" },
  highlight = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- automatically jump forward to textobj
      keymaps = {
        ["aa"] = "@parameter.outer",  -- a parameter including commas
        ["ia"] = "@parameter.inner",  -- inner parameter, no commas
      },
    },
  },
})
