return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = true
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = 'ta',
          delete = 'td',
          find = 'tf',
          find_left = '',
          highlight = '',
          replace = 'tr',
          update_n_lines = '',
          suffix_last = 'l',
          suffix_next = 'n',
        }
      })
    end
  }
}
