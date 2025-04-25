return {
	"DestopLine/scratch-runner.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = function()
		require("scratch-runner").setup({
			sources = {
				javascript = { "node" },
				rust = {
					function(filepath, bin_path)
						return { "rustc", filepath, "-o", bin_path }
					end,
					binary = true,
					extension = "rs",
				},
				go = {
					function(filepath, bin_path)
						return { { "go", "build", filepath }, { bin_path } }
					end,
					extension = "go",
					binary = true,
				},
				python = { { "python3" }, extension = "py" },
				c = {
					function(filepath, bin_path)
						return { "gcc", filepath, "-o", bin_path }
					end,
					extension = "c",
					binary = true,
				},
			},
		})
	end,
}
