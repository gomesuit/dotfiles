-- ddc.vim (auto-completion)
-- require deno (https://deno.com/)
-- vim.call('plug#', 'Shougo/ddc.vim')
-- vim.call('plug#', 'Shougo/pum.vim')
-- vim.call('plug#', 'vim-denops/denops.vim')
-- vim.call('plug#', 'Shougo/ddc-ui-native')

-- [ddc] around, matchers, sorters, converters
-- vim.call('plug#', 'Shougo/ddc-source-around')
-- vim.call('plug#', 'Shougo/ddc-matcher_head')
-- vim.call('plug#', 'Shougo/ddc-sorter_rank')
-- vim.call('plug#', 'tani/ddc-fuzzy')
-- vim.call('plug#', 'LumaKernel/ddc-file')
-- vim.call('plug#', 'Shougo/ddc-converter_remove_overlap')

-- [ddc] vim-lsp
-- vim.call('plug#', 'prabirshrestha/vim-lsp')
-- vim.call('plug#', 'shun/ddc-source-vim-lsp')
-- vim.call('plug#', 'mattn/vim-lsp-settings') -- :LspInstallServer. :LspManageServers

return {
  "Shougo/ddc.vim",
  "vim-denops/denops.vim",

  dependencies = {
    "Shougo/pum.vim",
    "Shougo/ddc-ui-native",
    "Shougo/ddc-source-around",
    "Shougo/ddc-matcher_head",
    "Shougo/ddc-sorter_rank",
    "tani/ddc-fuzzy",
    "LumaKernel/ddc-file",
    "Shougo/ddc-converter_remove_overlap",
    "prabirshrestha/vim-lsp",
    "shun/ddc-source-vim-lsp",
    "mattn/vim-lsp-settings",
  },

  config = function()
    vim.fn['ddc#custom#patch_global']('ui', 'native')
    vim.fn['ddc#custom#patch_global']('sources', {
        'around',
        'file',
        'vim-lsp',
      })

    vim.fn['ddc#custom#patch_global']('sourceOptions', {
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
        ['vim-lsp'] = {
          ['matchers'] = {'matcher_fuzzy'},
          ['mark'] = '[LSP]',
        },
      })

    vim.fn['ddc#custom#patch_global']('sourceParams', {
        ['around'] = {
          ['maxSize'] = 500,
        },
      })

    -- tabキーで補完候補を選択できるようにする
    vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
    vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

    vim.fn['ddc#enable']()
  end
}
