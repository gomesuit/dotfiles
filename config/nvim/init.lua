-- vim-plugのインストールチェックとセットアップ
local plug_path = vim.fn.stdpath('data')..'/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', plug_path, '--create-dirs', 
                 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
  vim.api.nvim_command('autocmd VimEnter * PlugInstall | source $MYVIMRC')
end

-- vim-plugプラグインマネージャーを開始
vim.call('plug#begin', vim.fn.stdpath('data')..'/plugged')

-- プラグインのリスト
vim.call('plug#', 'airblade/vim-gitgutter')
vim.call('plug#', 'tpope/vim-fugitive')
vim.call('plug#', 'bling/vim-airline')
vim.call('plug#', 'vim-airline/vim-airline-themes')
vim.call('plug#', 'ConradIrwin/vim-bracketed-paste')
vim.call('plug#', 'tpope/vim-eunuch')
vim.call('plug#', 'tpope/vim-sleuth')
vim.call('plug#', 'sheerun/vim-polyglot')
vim.call('plug#', 'dense-analysis/ale')
vim.call('plug#', 'tpope/vim-commentary')
vim.call('plug#', 'Shougo/ddc.vim')
vim.call('plug#', 'Shougo/pum.vim')
vim.call('plug#', 'vim-denops/denops.vim')
vim.call('plug#', 'Shougo/ddc-ui-native')
vim.call('plug#', 'Shougo/ddc-source-around')
vim.call('plug#', 'Shougo/ddc-matcher_head')
vim.call('plug#', 'Shougo/ddc-sorter_rank')
vim.call('plug#', 'preservim/nerdtree')
vim.call('plug#', 'jistr/vim-nerdtree-tabs')
vim.call('plug#', 'akinsho/toggleterm.nvim', {['tag'] = '*'})

vim.call('plug#end')

-- toggletermの設定
require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = "vertical",
  size = vim.o.columns * 0.4,
}

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

-- NERDTreeの設定
vim.g.NERDTreeShowHidden = 1
vim.g.nerdtree_tabs_open_on_console_startup = 1

-- Neovim専用の設定
if vim.fn.has('nvim') == 1 then
  -- ここにNeovim固有の設定を追加
end

-- 基本的なオプション設定
vim.o.swapfile = false
vim.o.ruler = true
vim.o.cmdheight = 2
vim.o.laststatus = 2
vim.o.statusline = "%<%f %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P"
vim.o.title = true
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.browsedir = 'buffer'
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.background = 'dark'
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.list = true
vim.o.listchars = 'tab:>\\ ,extends:<'
vim.o.number = true
vim.o.showmatch = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.whichwrap = 'b,s,h,l,<,>,[,]'
vim.api.nvim_command('highlight LineNr ctermfg=darkyellow')
vim.o.backspace = 'indent,eol,start'

-- キーマッピング
vim.api.nvim_set_keymap('n', 's', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', 's<Down>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', 's<Up>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', 's<Right>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', 's<Left>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', 'sJ', '<C-w>J', {noremap = true})
vim.api.nvim_set_keymap('n', 'sK', '<C-w>K', {noremap = true})
vim.api.nvim_set_keymap('n', 'sL', '<C-w>L', {noremap = true})
vim.api.nvim_set_keymap('n', 'sH', '<C-w>H', {noremap = true})
vim.api.nvim_set_keymap('n', 'sn', 'gt', {noremap = true})
vim.api.nvim_set_keymap('n', 'sp', 'gT', {noremap = true})
vim.api.nvim_set_keymap('n', 'th', 'gT', {noremap = true})
vim.api.nvim_set_keymap('n', 'tl', 'gt', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', 'gt', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', 'gT', {noremap = true})
vim.api.nvim_set_keymap('n', 'sr', '<C-w>r', {noremap = true})
vim.api.nvim_set_keymap('n', 's=', '<C-w>=', {noremap = true})
vim.api.nvim_set_keymap('n', 'sw', '<C-w>w', {noremap = true})
vim.api.nvim_set_keymap('n', 'so', '<C-w>_<C-w>|', {noremap = true})
vim.api.nvim_set_keymap('n', 'sO', '<C-w>=', {noremap = true})
vim.api.nvim_set_keymap('n', 'sN', ':bn<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'sP', ':bp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'st', ':tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'ss', ':sp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'sv', ':vs<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'sq', ':q<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'sw', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'sQ', ':bd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'sb', ':Unite buffer_tab -buffer-name=file<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'sB', ':Unite buffer -buffer-name=file<CR>', {noremap = true, silent = true})

-- 行末の空白文字をハイライトする設定
vim.api.nvim_create_augroup('HighlightTrailingSpaces', {})
vim.api.nvim_create_autocmd({'VimEnter', 'WinEnter', 'ColorScheme'}, {
  group = 'HighlightTrailingSpaces',
  pattern = '*',
  command = 'highlight TrailingSpaces term=underline guibg=Red ctermbg=Red',
})
vim.api.nvim_create_autocmd({'VimEnter', 'WinEnter'}, {
  group = 'HighlightTrailingSpaces',
  pattern = '*',
  command = 'match TrailingSpaces /\\s\\+$/',
})

-- クリップボードとの連携
vim.o.clipboard = 'unnamed'
