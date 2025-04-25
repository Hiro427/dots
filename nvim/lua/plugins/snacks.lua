return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			notifier = {
				enabled = true,
				timeout = 2000,
				width = { min = 20, max = 0.4 },
				border = "rounded",
			},
			statuscolumn = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true, size = 0.3 },
			picker = { enabled = true },
			scratch = { enabled = true },
			git = { enabled = true },
			dim = { enabled = true },
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
			{
				"<leader>de",
				function()
					Snacks.dim()
				end,
				desc = "Enable Dim",
			},
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
			},
			{
				"<leader>dd",
				function()
					Snacks.dim.disable()
				end,
				desc = "Disable Dim",
			},
			{
				"<leader>st",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>ss",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
		},
	},
}
