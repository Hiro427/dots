return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- local navic = require("nvim-navic")
		local devicons = require("nvim-web-devicons")
		require("lualine").setup({
			options = {
				theme = "tokyonight",
			},
			sections = {
				lualine_c = {
					{ "filename" },
					{
						function()
							return require("nvim-navic").get_location()
						end,
						cond = function()
							return require("nvim-navic").is_available()
						end,
					},
				},
				lualine_x = {
					{
						function()
							local ft = vim.bo.filetype
							if ft == "" then
								return ""
							end -- Hide if no filetype

							local icon, _ = devicons.get_icon_by_filetype(ft)
							return (icon or "") .. " " .. ft -- "" is a default icon for unknown filetypes
						end,
						cond = function()
							return vim.bo.filetype ~= "" -- Only show if filetype exists
						end,
					},
				},
			},
		})
	end,
}
