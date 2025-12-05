return {
  -- {
  --   "rcasia/neotest-java",
  --   ft = "java",
  --   dependencies = {
  --     "mfussenegger/nvim-jdtls",
  --     "mfussenegger/nvim-dap", -- for the debugger
  --     "rcarriga/nvim-dap-ui", -- recommended
  --     "theHamsta/nvim-dap-virtual-text", -- recommended
  --   },
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("neotest").setup {
  --       adapters = {
  --         require "neotest-java" {
  --           -- config here
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        path_display = { "truncate" }, -- or "truncate"
      })
      return opts
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-CR>",
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false }, -- keep panel disabled
      }
    end,
  },
  {
    "nvim-java/nvim-java",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "java",
        "python",
        "gdscript",
      },
    },
  },
}
