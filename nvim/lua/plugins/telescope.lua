return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "dropdown",
					},
					current_buffer_fuzzy_find = {
						theme = "dropdown",
					},
					grep_string = {
						theme = "dropdown",
					},
				},
				defaults = {
					layout_config = {
						vertical = { width = 0.9 },
					},
				},
			})
			local file_ignore_patterns = {
				"node_modules/",
				"yarn%.lock",
				"__pycache__/",
				"%.lock",
				"%.git",
				"build/",
				"dist/",
				"%.jpg",
				"%.png",
				"%.zip",
				"%.db",
				"%.mp4",
				"%.mp3",
			}
			vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files)
			vim.keymap.set("n", "<leader>fc", require("telescope.builtin").commands)
			vim.keymap.set("n", "<leader>gs", require("telescope.builtin").live_grep)
			vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps)
			vim.keymap.set("n", "<leader>l", require("telescope.builtin").current_buffer_fuzzy_find)
			vim.keymap.set("n", "<leader><leader>", function()
				require("telescope.builtin").find_files({
					search_dirs = { "~/coding", "~/.dotfiles" },
					file_ignore_patterns = file_ignore_patterns,
				})
			end, { desc = "custom dir search" })
		end,
	},
}
