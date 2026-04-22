return {
  "nvimtools/none-ls.nvim",
  config = function()
    local nls = require("null-ls")

    local sources = {
      nls.builtins.formatting.prettier,
    }

    nls.setup({ sources = sources })
  end
}
