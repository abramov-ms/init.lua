return {
  'stevearc/oil.nvim',
  dependencies = { "echasnovski/mini.icons" },
  config = function ()
    require("oil").setup({
      columns = {
        "permissions",
        "size",
        "mtime",
        "icon",
      }
    })
  end
}
