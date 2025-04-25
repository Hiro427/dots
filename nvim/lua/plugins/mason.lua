return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local navic = require("nvim-navic")

			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.zls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.spectral.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.sqlls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				handlers = {
					["language/status"] = function(_, result)
						-- Suppress status messages
					end,
					["$/progress"] = function(_, result, ctx)
						-- Suppress progress updates
					end,
				},
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			})
			vim.keymap.set("n", "<leader>mh", vim.lsp.buf.hover, { desc = "Hover (Mason)" })
			vim.keymap.set("n", "<leader>md", vim.lsp.buf.definition, { desc = "Go to Definition (Mason)" })
			vim.keymap.set("n", "<leader>mr", vim.lsp.buf.references, { desc = "References (Mason)" })
			vim.keymap.set("n", "<leader>ma", vim.lsp.buf.code_action, { desc = "Code Action (Mason)" })
		end,
	},
}
