return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "json",
      "llvm",
      "toml",
      "yaml",
    })

    vim.api.nvim_create_autocmd(
      "BufEnter",
      {
        pattern = {
          "*.sh",
          "*.json",
          "*.ll",
          "*.toml",
          "*.yaml",
          "*.yml",
        },
        callback = function()
          vim.treesitter.start()
        end
      }
    )
  end
}
