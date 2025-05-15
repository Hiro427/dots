return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim", -- Add this dependency
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.yapf,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cfn_lint,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.nixpkgs_fmt,
        null_ls.builtins.formatting.prettier,
      },
    })
  end,
}
