return {
  "ggandor/leap.nvim",
  config = function()
    require("leap").setup({})
    vim.keymap.set("n", "s", "<Plug>(leap-forward)")
    vim.keymap.set("n", "S", "<Plug>(leap-backward)")
  end
}
