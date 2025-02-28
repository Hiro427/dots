return {
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			-- Any additional setup options can go here
		},
		config = function()
			require("colorizer").setup()
		end,
	},
}
