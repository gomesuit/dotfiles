return  {
  "nvim-tree/nvim-tree.lua",

  lazy = false,

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.api.nvim_set_var('loaded_netrw', 1)
    vim.api.nvim_set_var('loaded_netrwPlugin', 1)

    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        }
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.api.nvim_buf_del_keymap(bufnr, 'n', 's') -- sを無効化する
      end,
    })

    -- 起動時にNvimTreeを開く
    vim.cmd [[autocmd VimEnter * NvimTreeOpen]]
    -- require("nvim-tree.api").tree.open()
  end,
}
