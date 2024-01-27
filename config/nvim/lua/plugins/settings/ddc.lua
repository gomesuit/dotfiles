-- https://github.com/Shougo/ddc.vim

vim.fn['ddc#custom#patch_global']('ui', 'native')
vim.fn['ddc#custom#patch_global']('sources', {'around', 'file'})

vim.fn['ddc#custom#patch_global']('sourceOptions', {
      ['around'] = {['mark'] = '[Around]'},
      ['_'] = {
        -- ['matchers'] = {'matcher_head'},
        ['matchers'] = {'matcher_fuzzy'},
        -- ['sorters'] = {'sorter_rank'},
        ['sorters'] = {'sorter_fuzzy'},
        ['converters'] = {'converter_fuzzy'},
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
