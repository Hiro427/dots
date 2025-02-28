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
			require("mini.cursorword").setup({})
			require("mini.surround").setup({})
			require("mini.ai").setup({})
			vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Open MiniFiles" })
		end,
	},
}
