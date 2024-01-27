local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

keymap('n', 's', '<Nop>', {noremap = true})
keymap('n', 'sj', '<C-w>j', {noremap = true})
keymap('n', 'sk', '<C-w>k', {noremap = true})
keymap('n', 'sl', '<C-w>l', {noremap = true})
keymap('n', 'sh', '<C-w>h', {noremap = true})
keymap('n', 's<Down>', '<C-w>j', {noremap = true})
keymap('n', 's<Up>', '<C-w>k', {noremap = true})
keymap('n', 's<Right>', '<C-w>l', {noremap = true})
keymap('n', 's<Left>', '<C-w>h', {noremap = true})
keymap('n', 'sJ', '<C-w>J', {noremap = true})
keymap('n', 'sK', '<C-w>K', {noremap = true})
keymap('n', 'sL', '<C-w>L', {noremap = true})
keymap('n', 'sH', '<C-w>H', {noremap = true})
keymap('n', 'sn', 'gt', {noremap = true})
keymap('n', 'sp', 'gT', {noremap = true})
keymap('n', 'th', 'gT', {noremap = true})
keymap('n', 'tl', 'gt', {noremap = true})
keymap('n', '<C-k>', 'gt', {noremap = true})
keymap('n', '<C-j>', 'gT', {noremap = true})
keymap('n', 'sr', '<C-w>r', {noremap = true})
keymap('n', 's=', '<C-w>=', {noremap = true})
keymap('n', 'sw', '<C-w>w', {noremap = true})
keymap('n', 'so', '<C-w>_<C-w>|', {noremap = true})
keymap('n', 'sO', '<C-w>=', {noremap = true})
keymap('n', 'sN', ':bn<CR>', {noremap = true})
keymap('n', 'sP', ':bp<CR>', {noremap = true})
keymap('n', 'st', ':tabnew<CR>', {noremap = true})
keymap('n', 'tn', ':tabnew<CR>', {noremap = true})
keymap('n', 'ss', ':sp<CR>', {noremap = true})
keymap('n', 'sv', ':vs<CR>', {noremap = true})
keymap('n', 'sq', ':q<CR>', {noremap = true})
keymap('n', 'sw', ':w<CR>', {noremap = true})
keymap('n', 'sQ', ':bd<CR>', {noremap = true})
keymap('n', 'sb', ':Unite buffer_tab -buffer-name=file<CR>', {noremap = true, silent = true})
keymap('n', 'sB', ':Unite buffer -buffer-name=file<CR>', {noremap = true, silent = true})
