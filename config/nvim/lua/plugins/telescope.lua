return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-fzf-native.nvim",
    },

    keys = {
      {"<C-p>", mode={"n"}, "<cmd>Telescope find_files<cr>", desc = "Find Files"},
      -- require https://github.com/BurntSushi/ripgrep
      -- {"<C-f>", mode={"n"}, "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
      {"<C-q>", mode={"n"}, "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
    },

    config = function()
      require('telescope').setup{
        defaults = {
          sorting_strategy = "ascending", -- 検索結果を上から下に並べる
          winblend = 0,
          layout_strategy = 'vertical',
          layout_config = { height = 0.9 },
          file_ignore_patterns = { --検索対象に含めないファイルを指定
            "^.git/",
            "^node_modules/",
          },
          mappings = {
            i = {
              -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            }
          }
        },
        extensions = {
          fzf = { -- あいまい検索を有効にする
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
      }

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
    end,
  }
}
