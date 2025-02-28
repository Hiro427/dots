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
		},
	},
}
