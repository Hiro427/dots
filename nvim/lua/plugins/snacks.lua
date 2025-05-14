return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- notifier = {
      --   enabled = true,
      --   timeout = 2000,
      --   width = { min = 20, max = 0.4 },
      --   border = "rounded",
      -- },
      dashboard = { enabled = true },
      explorer = { enabled = true, size = 0.3 },
      indent = { enabled = true },
      terminal = {
        enabled = true,
        size = 0.4,
      },
    },
    keys = {
      {
        "<leader>g",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>t",
        function()
          Snacks.terminal.toggle()
        end,
        desc = "Terminal",
      },
    },
  },
}
