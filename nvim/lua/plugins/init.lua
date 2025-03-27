return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "prettier",
        "gopls",
        "eslint-lsp",
        "pyright",
        "black",
        "prisma-language-server",
        "nil",
      },
    },
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
        "tsx",
        "javascript",
        "typescript",
        "go",
        "prisma",
        "just",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
      extensions = {
        ["ui-select"] = {},
      },
      extensions_list = {
        "ui-select",
      },
      pickers = {
        find_files = {},
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "numToStr/FTerm.nvim",
    lazy = false,
    config = function()
      require("FTerm").setup {
        border = "double",
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      }
    end,
  },

  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },

  {
    "fladson/vim-kitty",
    lazy = false,
  },
}
