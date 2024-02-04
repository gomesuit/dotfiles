-- vim-plugのインストールチェックとセットアップ
local plug_path = vim.fn.stdpath('data')..'/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({'curl', '-fLo', plug_path, '--create-dirs',
                 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
  vim.api.nvim_command('autocmd VimEnter * PlugInstall | source $MYVIMRC')
end

