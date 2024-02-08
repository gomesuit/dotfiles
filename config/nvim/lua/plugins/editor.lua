return {
  -- commentout shortcut, Use gc
  -- {
  --   "tpope/vim-commentary",
  -- },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  {
    "andymass/vim-matchup",
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }

      require'nvim-treesitter.configs'.setup {
        matchup = {
          enable = true,              -- mandatory, false will disable the whole extension
          -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
          -- [options]
        },
      }
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  {
    "windwp/nvim-ts-autotag",

    config = function()
      require('nvim-ts-autotag').setup()

      require'nvim-treesitter.configs'.setup {
        autotag = {
          enable = true,
        }
      }
    end,
  },

  {
    "rgroli/other.nvim",

    config = function()
      require("other-nvim").setup({
        mappings = {
          "livewire",
          "angular",
          "laravel",
          "rails",
          "golang",
        },
      })
    end,
  },

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
          -- formatting
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.terraform_fmt,

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
  }
}
