return {
  'stevearc/oil.nvim',
  dependencies = { "echasnovski/mini.nvim" },
  config = function()
    require("oil").setup({
      columns = {
        "permissions",
        "size",
        "mtime",
        "icon",
      },
      view_options = {
        show_hidden = true
      },
      watch_for_changes = true
    })
  end
}
