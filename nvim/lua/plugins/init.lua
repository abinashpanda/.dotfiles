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
        "prettier",
        "gopls",
        "eslint-lsp",
        "pyright",
        "black",
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
      },
    },
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {},
        },
      }

      require("telescope").load_extension "ui-select"
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
  },
}
