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
    "mfussenegger/nvim-lint",
    lazy = false,
    config = function()
      require "configs.lint"
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
    opts = {},
    keys = {
      {
        "k",
        mode = { "n", "x", "o" },
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
  -- {
  --   "smoka7/hop.nvim",
  --   lazy = false,
  --   version = "*",
  --   opts = {
  --     keys = "etovxqpdygfblzhckisuran",
  --   },
  --   config = function()
  --     require "configs.hop"
  --   end,
  -- },
  -- Bufferline
  -- {
  -- "akinsho/bufferline.nvim",
  -- lazy = false,
  -- dependencies = {
  -- "nvim-tree/nvim-web-devicons",
  -- },
  -- config = function()
  -- require "configs.bufferline"
  -- end,
  -- },
  -- Hop (Better Navigation)
  -- {
  -- "phaazon/hop.nvim",
  -- lazy = true,
  -- config = function()
  -- require "configs.hop"
  -- end,
  -- },

  -- {
  -- "Wansmer/langmapper.nvim",
  -- lazy = false,
  -- priority = 1, -- High priority is needed if you will use `autoremap()`
  -- },
  -- need check start
  -- {
  -- "windwp/nvim-ts-autotag",
  -- ft = {
  -- "javascript",
  -- "javascriptreact",
  -- "typescript",
  -- "typtscriptreact",
  -- "html",
  -- },
  -- config = function()
  -- require("nvim-ts-autotag").setup()
  -- end,
  -- },
  -- need check end
}
