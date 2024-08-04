return {
  "LintaoAmons/bookmarks.nvim",
  dependencies = {
    { "stevearc/dressing.nvim" }
  },
  config = function()
    require("bookmarks").setup({
      json_db_path = vim.fs.normalize(
        vim.fn.stdpath("config") .. "/bookmarks.db.json"
      ),
    })

    vim.keymap.set({ "n", "v" }, "mm", "<Cmd>BookmarksMark<CR>")
    vim.keymap.set({ "n", "v" }, "mo", "<Cmd>BookmarksGoto<CR>")
    vim.keymap.set({ "n", "v" }, "ma", "<Cmd>BookmarksCommands<CR>")
    vim.keymap.set({ "n", "v" }, "mg", "<Cmd>BookmarksGotoRecent<CR>")
  end
}
