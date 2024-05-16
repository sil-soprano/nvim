highlight = {
  matches = false,
}
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "prettierd",
        "tailwindcss-language-server",
        "emmet-ls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "scss",
        "pug",
        "javascript",
        "typescript",
        "tsx",
        "vue",

        -- some
        "toml",
        "yaml",
        "dockerfile",
        "sql",

        -- low level
        "bash",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "ecthelionvi/NeoView.nvim",
    lazy = false,
    config = function()
      require "configs.neoview"
    end,
  },
  {
    "vidocqh/auto-indent.nvim",
    lazy = false,
    config = function()
      require "configs.autoindent"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require "configs.nvimtree"
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- lazy = false,
    opts = {},
    keys = {
      {
        "<A-k>",
        mode = { "n", "i", "x", "o" },
        function()
          require("flash").jump {
            labels = "abcdefghijklmnopqrstuvwxyz",
            highlight = {
              matches = false,
            },
            label = {
              before = true,
              after = false,
            },
          }
        end,
        desc = "Flash",
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = false,
    opts = {},
  },
}
