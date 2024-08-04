return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  config = function()
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return vim.bo.commentstring
        end
      }
    })
  end
}
