return {
  {
    -- require deno (https://deno.com/)
    "Shougo/ddc.vim",

    enabled = false,

    lazy = false,

    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-ui-native",

      -- around, matchers, sorters, converters
      "Shougo/ddc-source-around",
      "matsui54/ddc-source-buffer",
      "Shougo/ddc-matcher_head",
      "Shougo/ddc-sorter_rank",
      "tani/ddc-fuzzy",
      "LumaKernel/ddc-file",
      "Shougo/ddc-converter_remove_overlap",

      -- vim-lsp
      "prabirshrestha/vim-lsp",
      "shun/ddc-source-vim-lsp",
      "mattn/vim-lsp-settings",

      -- snippet
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
    },

    config = function()
      local patch_global = vim.fn["ddc#custom#patch_global"]

      patch_global('ui', 'native')
      patch_global('sources', {
        'around',
        'file',
        'vim-lsp',
        'buffer',
      })

      patch_global('sourceOptions', {
        ['_'] = {
          -- ['matchers'] = {'matcher_head'},
          ['matchers'] = {'matcher_fuzzy'},
          -- ['sorters'] = {'sorter_rank'},
          ['sorters'] = {'sorter_fuzzy'},
          ['converters'] = {'converter_fuzzy'},
        },
        ['around'] = {
          ['mark'] = '[Around]',
        },
        ['buffer'] = {
          ['mark'] = '[Buffer]',
        },
        ['file'] = {
          ['mark'] = '[File]',
        },
        ['vim-lsp'] = {
          ['matchers'] = {'matcher_head'},
          ['mark'] = '[LSP]',
        },
      })

      patch_global('sourceParams', {
        ['around'] = {
          ['maxSize'] = 500,
        },
        ['buffer'] = {
          ['requireSameFiletype'] = false,
          ['limitBytes'] = 5000000,
          ['fromAltBuf'] = true,
          ['forceCollect'] = true,
        },
      })

      -- tabキーで補完候補を選択できるようにする
      vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
      vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

      vim.fn['ddc#enable']()
    end,
  },
  {
    "Shougo/pum.vim",
    config = function()
      vim.fn["pum#set_option"]({
        auto_select = true,
        padding = true,
        border = "single",
        preview = true,
        preview_border = "single",
        preview_delay = 250,
        preview_width = 72,
        scrollbar_char = "▋",
        highlight_normal_menu = "Normal",
      })

      -- Insert
      vim.keymap.set("i", "<C-n>", "<cmd>call pum#map#select_relative(+1)<CR>", { silent = true, noremap = true })
      vim.keymap.set("i", "<C-p>", "<cmd>call pum#map#select_relative(-1)<CR>", { silent = true, noremap = true })
      vim.keymap.set("i", "<C-y>", "<cmd>call pum#map#confirm()<CR>", { silent = true, noremap = true })
      vim.keymap.set("i", "<C-e>", "<cmd>call pum#map#cancel()<CR>", { silent = true, noremap = true })

      -- -- Commandline
      -- vim.keymap.set("c", "<Tab>", "<Cmd>call pum#map#select_relative(+1)<CR>", { noremap = true })
      -- vim.keymap.set("c", "<S-Tab>", "<Cmd>call pum#map#select_relative(-1)<CR>", { noremap = true })
      -- vim.keymap.set("c", "<C-n>", "<cmd>call pum#map#select_relative(+1)<CR>", { noremap = true })
      -- vim.keymap.set("c", "<C-p>", "<cmd>call pum#map#select_relative(-1)<CR>", { noremap = true })
      -- vim.keymap.set("c", "<C-y>", "<cmd>call pum#map#confirm()<CR>", { noremap = true })
      -- vim.keymap.set("c", "<C-e>", "<cmd>call pum#map#cancel()<CR>", { noremap = true })
    end,
  },
}
