return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "gruvbox",
        "tokyonight",
        "nord",
        "kanagawa",
        "onedark",
        "monokai",
        "catppuccin",
        "github_dark_default",
        "github_dark_high_contrast",
        "matrix",
        "nightfly",
        "rose-pine",
        "tokyodark",
        "embark",
      },
    })
    vim.keymap.set("n", "<leader>cs", ":Themery<CR>", {})
  end,
}
