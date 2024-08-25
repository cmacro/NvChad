return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "pyright",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = { "VeryLazy" },
    -- init = function()
    --   require("core.utils").load_mappings "dap"
    -- end,
  },
  {
    "leoluz/nvim-dap-go",
    event = { "VeryLazy" },
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },

  -- {
  --   "mfussenegger/nvim-lint",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require "configs.lint"
  --   end,
  -- },

  -- {
  --   "rshkarin/mason-nvim-lint",
  --   event = "VeryLazy",
  --   dependencies = { "nvim-lint" },
  --   config = function()
  --     require "configs.mason-lint"
  --   end,
  -- },
}
