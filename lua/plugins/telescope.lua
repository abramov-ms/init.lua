local function telescope(picker)
  return function()
    return require("telescope.builtin")[picker]()
  end
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = {
    { "<Leader>ff",  telescope("find_files") },
    { "<Leader>fs",  telescope("live_grep") },
    { "<Leader>ldf", telescope("lsp_document_symbols") },
    { "<Leader>lfs", telescope("lsp_dynamic_workspace_symbols") },
    { "<Leader>lfr", telescope("lsp_references") },
  }
}
