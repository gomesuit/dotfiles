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

-- require https://github.com/ryanoasis/nerd-fonts/
vim.call('plug#', 'nvim-tree/nvim-web-devicons')
vim.call('plug#', 'nvim-tree/nvim-tree.lua')

-- terminal
vim.call('plug#', 'akinsho/toggleterm.nvim', {['tag'] = '*'})

-- telescope
vim.call('plug#', 'nvim-lua/plenary.nvim')
vim.call('plug#', 'nvim-telescope/telescope.nvim', {['tag'] = '0.1.5'})
vim.call('plug#', 'nvim-treesitter/nvim-treesitter')
vim.call('plug#', 'nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})


-- vim-terraform
vim.call('plug#', 'hashivim/vim-terraform')

-- vim.call('plug#', 'neoclide/coc.nvim', {['branch'] = 'release'})

vim.call('plug#end')
