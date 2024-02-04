-- terminal
-- vim.call('plug#', 'akinsho/toggleterm.nvim', {['tag'] = '*'})


return {
  "akinsho/toggleterm.nvim",

  config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-\>]],
      direction = "vertical",
      size = vim.o.columns * 0.4,
    }
  end
}
