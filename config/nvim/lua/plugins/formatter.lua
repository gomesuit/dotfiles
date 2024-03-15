return {
  {
    "jose-elias-alvarez/null-ls.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "lukas-reineke/lsp-format.nvim",
    },

    config = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

          -- formatting
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.formatting.rubyfmt,
          null_ls.builtins.formatting.goimports_reviser,
          null_ls.builtins.formatting.stylelint,

          -- diagnostics
          null_ls.builtins.diagnostics.eslint,

          -- completion
          null_ls.builtins.completion.spell,
        },
        on_attach = require("lsp-format").on_attach
      })
    end,
  },

  {
    "lukas-reineke/lsp-format.nvim",

    config = function()
      require("lsp-format").setup({})
    end,
  },
}
