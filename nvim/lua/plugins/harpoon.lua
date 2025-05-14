return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
      vim.keymap.set("n", "<leader>jj", function()
        harpoon:list():prev()
      end, { desc = "Harpoon Previous File" })
      vim.keymap.set("n", "<leader>kk", function()
        harpoon:list():next()
      end, { desc = "Harpoon Next File" })
      vim.keymap.set("n", "<leader>aa", function()
        harpoon:list():add()
      end, { desc = "Harpoon Add file" })
      vim.keymap.set("n", "<leader>ll", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Open Harpoon Menu" })
    end,
  },
}
