return {
  "nvimtools/none-ls.nvim",
  config = function()
    local nls = require("null-ls")

    local sources = {
      nls.builtins.formatting.prettier.with({ filetypes = { "typescript" } }),
      nls.builtins.formatting.black,
    }

    nls.setup({ sources = sources })
  end
}
