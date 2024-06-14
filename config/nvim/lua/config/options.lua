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
-- vim.o.browsedir = 'buffer'
-- 小文字のみで検索したときに大文字小文字を無視する
vim.o.smartcase = true
-- 検索結果をハイライト表示する
vim.o.hlsearch = true
-- 暗い背景色に合わせた配色にする
-- vim.o.background = 'dark'
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
