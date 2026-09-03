local function telescope(picker, opts)
  return function()
    return require("telescope.builtin")[picker](opts)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  keys = {
    { "<Leader>ff", telescope("find_files", {
      cwd = require("telescope.utils").buffer_dir(),
      hidden = true,
      no_ignore = true,
      no_ignore_parent = true
    }) },
    { "<Leader>fs", telescope("live_grep", {
      cwd = require("telescope.utils").buffer_dir(),
    }) },
    { "<Leader>ldf", telescope("lsp_document_symbols") },
    { "<Leader>lfs", telescope("lsp_dynamic_workspace_symbols") },
    { "<Leader>lfr", telescope("lsp_references") },
  }
}
