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
-- vim.g.NERDTreeShowHidden = 1
-- vim.g.nerdtree_tabs_open_on_console_startup = 1

-- nvim-treeの設定
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
vim.cmd [[autocmd VimEnter * NvimTreeOpen]]

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
    mappings = {
      i = {
        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- vim-terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- 基本的なオプション設定
require("options")

-- キーマッピング
require("keymaps")

