-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = "vertical",
  size = vim.o.columns * 0.4,
}
