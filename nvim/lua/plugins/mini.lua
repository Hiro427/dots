return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.files").setup({
        windows = {
          preview = true, -- Show preview window
          width_focus = 40,
          width_nofocus = 30,
        },
      })
      require("mini.pairs").setup({})
      require("mini.notify").setup({})
      require("mini.cursorword").setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<S-h>',
          right = '<S-l>',
          down = '<S-j>',
          up = '<S-k>',

          -- Move current line in Normal mode
          line_left = '<S-h>',
          line_right = '<S-l>',
          line_down = '<S-j>',
          line_up = '<S-k>',
        },
      })
      require("mini.move").setup({})
      require("mini.ai").setup({})
      require("mini.icons").setup({})
      require("mini.statusline").setup({})
      vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Open MiniFiles" })
    end,
  },
}
