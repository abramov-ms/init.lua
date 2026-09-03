return {
  -- "RRethy/vim-illuminate",
  "UrsaDK/vim-illuminate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-locals"
  },
  config = function()
    require("illuminate").configure({
      delay = 0,
      providers = {
        "treesitter",
        "lsp",
      }
    })
  end
}
