-- ddc.vimの設定
vim.fn['ddc#custom#patch_global']('ui', 'native')
vim.fn['ddc#custom#patch_global']('sources', {'around'})
vim.fn['ddc#custom#patch_global']('sourceOptions', {
      ['around'] = {['mark'] = '[Around]'},
      ['_'] = {
        ['matchers'] = {'matcher_head'},
        ['sorters'] = {'sorter_rank'},
      },
})
vim.fn['ddc#custom#patch_global']('sourceParams', {
      ['around'] = {
        ['maxSize'] = 500,
      },
})

vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
vim.fn['ddc#enable']()
