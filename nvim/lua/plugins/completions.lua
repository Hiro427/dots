return {
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local icons = {
				Text = "󰊄 ",
				Variable = "󰜢 ",
				Snippet = " ",
				Class = " ",
				Function = "󰡱 ",
				Module = "󰐱 ",
				Keyword = " ",
				Struct = " ",
				Interface = " ",
				Enum = " ",
				Property = " ",
				File = " ",
				Method = " ",
				Constant = "󰯱 ",
				Field = " ",
			}
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-K>"] = cmp.mapping.select_prev_item(),
					["<C-J>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				formatting = {
					format = function(entry, vim_item)
						local highlights_info = require("colorful-menu").cmp_highlights(entry)

						-- highlight_info is nil means we are missing the ts parser, it's
						-- better to fallback to use default `vim_item.abbr`. What this plugin
						-- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
						if highlights_info ~= nil then
							vim_item.abbr_hl_group = highlights_info.highlights
							vim_item.abbr = highlights_info.text
						end

						-- vim_item.kind = string.format("%s %s", icons[vim_item.kind] or "", vim_item.kind)
						vim_item.menu = vim_item.kind -- Move kind info to `menu`
						vim_item.kind = (icons[vim_item.kind] or " ") -- Prepend icon only

						return vim_item
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.,
					{ name = "path" },
					{ name = "codeium" },
					{ name = "buffer" },
				}),
			})
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
			cmp.setup.filetype({ "sql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})
		end,
	},
}
