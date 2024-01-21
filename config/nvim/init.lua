-- set Leader key
vim.g.mapleader = ' '

-- vim-plugのインストールチェックとセットアップ
local plug_path = vim.fn.stdpath('data')..'/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', plug_path, '--create-dirs',
                 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
  vim.api.nvim_command('autocmd VimEnter * PlugInstall | source $MYVIMRC')
end

-- vim-plugプラグインマネージャーを開始
vim.call('plug#begin', vim.fn.stdpath('data')..'/plugged')

-- 追加、削除、変更された行にマーカーを表示する
vim.call('plug#', 'airblade/vim-gitgutter')

-- git拡張
vim.call('plug#', 'tpope/vim-fugitive')

-- Vimの画面の一番下にあるステータスラインの表示内容が強化される
vim.call('plug#', 'bling/vim-airline')
vim.call('plug#', 'vim-airline/vim-airline-themes')

-- helper for unix
vim.call('plug#', 'tpope/vim-eunuch')

-- タブとスペースの自動検知
vim.call('plug#', 'tpope/vim-sleuth')

-- A collection of language packs for Vim.
vim.call('plug#', 'sheerun/vim-polyglot')

-- Lint Engine
vim.call('plug#', 'dense-analysis/ale')

-- commentout shortcut, Use gc
vim.call('plug#', 'tpope/vim-commentary')

-- ddc.vim (auto-completion)
-- require deno (https://deno.com/)
vim.call('plug#', 'Shougo/ddc.vim')
vim.call('plug#', 'Shougo/pum.vim')
vim.call('plug#', 'vim-denops/denops.vim')
vim.call('plug#', 'Shougo/ddc-ui-native')
vim.call('plug#', 'Shougo/ddc-source-around')
vim.call('plug#', 'Shougo/ddc-matcher_head')
vim.call('plug#', 'Shougo/ddc-sorter_rank')

-- ディレクトリをツリー表示
vim.call('plug#', 'preservim/nerdtree')
vim.call('plug#', 'jistr/vim-nerdtree-tabs')

vim.call('plug#', 'nvim-tree/nvim-web-devicons')
vim.call('plug#', 'nvim-tree/nvim-tree.lua')

-- terminal
vim.call('plug#', 'akinsho/toggleterm.nvim', {['tag'] = '*'})

-- telescope
vim.call('plug#', 'nvim-lua/plenary.nvim')
vim.call('plug#', 'nvim-telescope/telescope.nvim', {['tag'] = '0.1.5'})
vim.call('plug#', 'nvim-treesitter/nvim-treesitter')

-- vim-terraform
vim.call('plug#', 'hashivim/vim-terraform')

-- vim.call('plug#', 'neoclide/coc.nvim', {['branch'] = 'release'})

vim.call('plug#end')

-- toggletermの設定
-- https://github.com/akinsho/toggleterm.nvim
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

-- nvim-treeの設定
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.api.nvim_set_var('loaded_netrw', 1)
-- vim.api.nvim_set_var('loaded_netrwPlugin', 1)
-- vim.cmd [[autocmd VimEnter * NvimTreeOpen]]

-- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

-- empty setup using defaults
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
    dotfiles = true,
  },
})

-- telescopeの設定
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- require https://github.com/BurntSushi/ripgrep
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})

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
  },
}

-- vim-terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- 基本的なオプション設定
vim.o.swapfile = false
-- カーソルが何行目の何列目に置かれているかを表示する
vim.o.ruler = true
-- コマンドラインに使われる画面上の行数
vim.o.cmdheight = 2
-- エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
vim.o.laststatus = 2
-- ステータス行に表示させる情報の指定
vim.o.statusline = "%<%f %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P"
-- ウインドウのタイトルバーにファイルのパス情報等を表示する
vim.o.title = true
-- コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
vim.o.wildmenu = true
-- 入力中のコマンドを表示する
vim.o.showcmd = true
vim.o.browsedir = 'buffer'
-- 小文字のみで検索したときに大文字小文字を無視する
vim.o.smartcase = true
-- 検索結果をハイライト表示する
vim.o.hlsearch = true
-- 暗い背景色に合わせた配色にする
vim.o.background = 'dark'
-- タブ入力を複数の空白入力に置き換える
vim.o.expandtab = true
-- 検索ワードの最初の文字を入力した時点で検索を開始する
vim.o.incsearch = true
vim.o.hidden = true
vim.o.list = true
-- タブと行の続きを可視化する
vim.o.listchars = 'tab:>\\ ,extends:<'
-- 行番号を表示する
vim.o.number = true
-- 対応する括弧やブレースを表示する
vim.o.showmatch = true
-- 改行時に前の行のインデントを継続する
vim.o.autoindent = true
-- 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
vim.o.smartindent = true
-- タブ文字の表示幅
vim.o.tabstop = 2
-- Vimが挿入するインデントの幅
vim.o.shiftwidth = 2
-- 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
vim.o.smarttab = true
-- カーソルを行頭、行末で止まらないようにする
vim.o.whichwrap = 'b,s,h,l,<,>,[,]'
-- 行番号の色
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
