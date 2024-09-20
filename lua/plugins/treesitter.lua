return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    pcall(function()
      vim.cmd.TSUpdate()
    end)
  end,
  event = {
    "BufReadPost",
    "BufNewFile"
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  opts = {
    highlight = {
      enable = true
    },
    indent = {
      enable = true,
      disable = { "markdown" }
    },
    ensure_installed = {
      "bash",
      "json",
      "lua",
      "c",
      "cpp",
      "rust",
      "go"
    }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
