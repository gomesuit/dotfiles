return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",

    lazy = false,

    keys = {
      {"<C-f>", mode={"n"}, "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
    },

    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      arg = "leetcode.nvim",

      lang = "python3",

      storage = {
        home = "~/dev/github.com/gomesuit/leetcode/codes",
      },
    },
  }
}
