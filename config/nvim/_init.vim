" vim-plugのインストールチェックとセットアップ
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plugプラグインマネージャーを開始
call plug#begin('~/.local/share/nvim/plugged')

" 追加、削除、変更された行にマーカーを表示する
Plug 'airblade/vim-gitgutter'

" git拡張
Plug 'tpope/vim-fugitive'

" Vimの画面の一番下にあるステータスラインの表示内容が強化される
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vimでペーストする際に、自動でpaste modeにする
Plug 'ConradIrwin/vim-bracketed-paste'

" helper for unix
Plug 'tpope/vim-eunuch'

" タブとスペースの自動検知
Plug 'tpope/vim-sleuth'

" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'

" Lint Engine
Plug 'dense-analysis/ale'

" commentout shortcut, Use gc
Plug 'tpope/vim-commentary'

" ddc.vim (auto-completion)
Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-source-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'

" ディレクトリをツリー表示
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

" terminal
" https://github.com/akinsho/toggleterm.nvim
lua << EOF
require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = "vertical",
  size = vim.o.columns * 0.4,
}
EOF

" ddc.vimの設定
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': '[Around]'},
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {
      \   'maxSize': 500,
      \ }})

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
call ddc#enable()

" ディレクトリをツリー表示
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup=1

" Neovim専用の設定
if has('nvim')
  " ここにNeovim固有の設定を追加
  " 例: 組み込みのターミナルエミュレータの設定
  " ...
endif

filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""
" キーマッピング
""""""""""""""""""""""""""""""
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap s<Down> <C-w>j
nnoremap s<Up> <C-w>k
nnoremap s<Right> <C-w>l
nnoremap s<Left> <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap th gT
nnoremap tl gt
nnoremap <C-k> gt
nnoremap <C-j> gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap tn :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sw :<C-u>w<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>


""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
"set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定(でもバックアップは使ってない)
"set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
" autocmd FileType java        setlocal sw=2 sts=4 ts=2 noexpandtab

" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 行番号の色
highlight LineNr ctermfg=darkyellow
set backspace=indent,eol,start
" 行末の空白文字をハイライトする
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" クリップボードとの連携
set clipboard+=unnamed