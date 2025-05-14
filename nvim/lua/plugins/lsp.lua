return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- If you have a custom cmp capabilities function
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      capabilities.textDocument.formatting = {
        dynamicRegistration = false,
      }

      capabilities.textDocument.semanticTokens = capabilities.textDocument.semanticTokens or {}
      capabilities.textDocument.semanticTokens.augmentsSyntaxTokens = false

      capabilities.textDocument.completion.completionItem = {
        contextSupport = true,
        snippetSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
        labelDetailsSupport = true,
        documentationFormat = { "markdown", "plaintext" },
      }
      -- vim.lsp.enable({
      --   'lua_ls',
      --   'gopls',
      --   'rust_analyzer',
      --   'zls',
      --   'clangd',
      --   'pylsp',
      --   'tailwindcss-language-server',
      --   'typescript-language-server',
      --   'bashls',
      --   'nil'
      -- })
      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.nil_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.zls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.htmx.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.taplo.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      lspconfig.spectral.setup({
        capabilities = capabilities,
      })
      lspconfig.sqls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      -- Add other servers as needed
    end,
  },
}
