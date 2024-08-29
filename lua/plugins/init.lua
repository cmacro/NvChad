return {
  -- {
  --   "stevearc/conform.nvim",
  --   -- event = 'BufWritePre', -- uncomment for format on save
  --   opts = require "configs.conform",
  -- },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- require("nvchad.configs.lspconfig").defaults()
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

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },

  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre",
    opts = require "configs.conform",
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
    -- init = function()
    --   require("core.util").load_mappings "dap"
    -- end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    keys = {
      ["<leader>dgt"] = {
        function()
          require("dap-go").debug_test()
        end,
        "Debug go test",
      },
      ["<leader>dgl"] = {
        function()
          require("dap-go").debug_last()
        end,
        "Debug last go test",
      },
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  {

    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        git_ignored = false,
      },
    },
  },

  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    opts = {
      multi_windows = true,
      keys = "etovxqpdygfblzhckisuran",
      upercase_labels = true,
    },
    keys = {
      {
        "<leader>fj",
        function()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },
}
