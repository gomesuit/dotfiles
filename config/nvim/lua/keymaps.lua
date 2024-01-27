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
