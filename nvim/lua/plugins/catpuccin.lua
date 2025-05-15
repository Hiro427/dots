return {
  "catppuccin/nvim",
  lazy = true,
  priority = 1000,
  -- enabled = false,
  name = "catppuccin",
  opts = {
    transparent_background = false,
    flavour = "mocha",
    integrations = {
      snacks = {
        enabled = false,
        indent_scope_color = "lavender",
      },
      treesitter = true,
      mason = true,
      blink_cmp = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      mini = {
        enabled = true,
      },
    },

  },
}
