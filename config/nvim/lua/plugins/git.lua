return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      -- vim.keymap.set("n", "<Leader>hs", "<CMD>Gitsigns stage_hunk<CR>", { silent = true, desc = "Stage the hunk" })
      -- vim.keymap.set("n", "<Leader>hs", "<CMD>Gitsigns stage_hunk<CR>", { silent = true, desc = "Stage the hunk" })
      -- vim.keymap.set("v", "<Leader>hs", "<CMD>Gitsigns stage_hunk<CR>", { silent = true, desc = "Stage the hunk" })

      -- vim.keymap.set("n", "<Leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>", { silent = true, desc = "Undo the last call of stage hunk" })
      -- vim.keymap.set("v", "<Leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>", { silent = true, desc = "Undo the last call of stage hunk" })
      -- vim.keymap.set("n", "<Leader>hr", "<CMD>Gitsigns reset_hunk<CR>", { silent = true, desc = "Reset the lines of the hunk" })
      -- vim.keymap.set("v", "<Leader>hr", "<CMD>Gitsigns reset_hunk<CR>", { silent = true, desc = "Reset the lines of the hunk" })
    end,
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "*" },
          delete = { text = "-" },
          topdelete = { text = "-" },
          changedelete = { text = "*" },
        },
        preview_config = {
          border = "single",
          style = "minimal",
        },
      })
    end,
  },
  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
    init = function()
      -- vim.keymap.set("n", "<C-k>", "<cmd>GitMessenger<CR>", { silent = true })
      vim.g.git_messenger_floating_win_opts = { border = "single" }
    end,
  },
}
