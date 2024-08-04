return {
  "williamboman/mason.nvim",
  build = function()
    pcall(function()
      vim.cmd.MasonUpdate()
    end)
  end,
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded"
      }
    })

    vim.keymap.set("n", "<Leader>mm", vim.cmd.Mason)
  end
}

