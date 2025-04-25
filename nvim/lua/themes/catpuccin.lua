return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Add comma here
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
}
