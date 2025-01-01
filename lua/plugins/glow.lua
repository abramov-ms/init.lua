return {
  "ellisonleao/glow.nvim",
  cmd = "Glow",
  config = function()
    require("glow").setup({
      border = "rounded",
      width_ratio = 0.8,
      height_ratio = 0.8,
    })
  end
}
