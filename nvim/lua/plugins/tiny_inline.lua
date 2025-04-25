return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,  -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "ghost",
        options = {
          show_source = true,

          throttle = 20,

          enable_on_insert = true,

          multilines = true,
        },
        overflow = {
          mode = "wrap",
        },
        break_line = {
          enabled = true,
          after = 30,
        },
      })
    end,
  },
}
