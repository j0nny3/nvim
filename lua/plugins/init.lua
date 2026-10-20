return {
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "rcasia/neotest-java", -- Or "andy-bell101/neotest-java"
  --     "mfussenegger/nvim-dap", -- For debug strategy
  --   },
  --   config = function()
  --     require("neotest").setup {
  --       adapters = {
  --         require "neotest-java" { -- Config options if needed
  --           -- e.g., incremental_build = true
  --         },
  --       },
  --     }
  --   end,
  --   keys = {
  --     {
  --       "<leader>tr",
  --       function()
  --         require("neotest").run.run()
  --       end,
  --       desc = "Run Nearest Test",
  --     },
  --     {
  --       "<leader>tt",
  --       function()
  --         require("neotest").run.run(vim.fn.expand "%")
  --       end,
  --       desc = "Run Test File",
  --     },
  --     {
  --       "<leader>td",
  --       function()
  --         require("neotest").run.run { strategy = "dap" }
  --       end,
  --       desc = "Debug Nearest Test",
  --     },
  --     {
  --       "<leader>ts",
  --       function()
  --         require("neotest").summary.toggle()
  --       end,
  --       desc = "Toggle Test Summary",
  --     },
  --   },
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
        "sindrets/diffview.nvim"
    },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

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
  -- {
  --   {
  --     "nvim-java/nvim-java",
  --     config = function()
  --       require("java").setup()
  --       vim.lsp.enable "jdtls"
  --     end,
  --   },
  -- },
  {
    "nvim-java/nvim-java",
    ft = "java", -- Lazy-load on Java files
    dependencies = {
      "nvim-java/lua-async-await", -- Required for async features
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "mfussenegger/nvim-dap", -- For debugging
      "rcarriga/nvim-dap-ui", -- Nice UI for DAP (optional but recommended)
    },
    -- config = function()
    --   require("java").setup {
    --     -- Add the JDTLS specific settings here
    --     jdtls = {
    --       settings = {
    --         java = {
    --           format = {
    --             enabled = true,
    --             settings = {
    --               -- Replace with the ACTUAL absolute path to your XML file
    --               url = vim.fn.expand "C:\\Users\\rumstj\\AppData\\Local\\nvim>\\java-style",
    --               profile = "Custom150",
    --             },
    --           },
    --         },
    --       },
    --     },
    --   }
    -- end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects", -- This loads the extension
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "python", "java" }, -- Add more as needed

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
          selection_modes = {
            ["@function.outer"] = "V", -- linewise for outer function
          },
          include_surrounding_whitespace = true,
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
