return {
  {
    "mfussenegger/nvim-dap",
    init = function()
      -- require("core.utils").load_mappings "configs.dap"
    end,
    -- {
    --   "<leader>fj",
    --   function()
    --     require("hop").hint_words()
    --   end,
    --   mode = { "n", "x", "o" },
    -- },
    --
    keys = {
      {
        "<leader>db",
        "<cmd> DapToggleBreakpoint <CR>",
        mode = { "n" },
        desc = "Add breakpoint at line",
      },
      {
        "<leader>dus",
        function()
          local widgets = require "dap.ui.widgets"
          local sidebar = widgets.sidebar(widgets.scopes)
          sidebar.open()
        end,
        mode = { "n" },
        desc = "Open debugging sidebar",
      },
    },
  },
}
