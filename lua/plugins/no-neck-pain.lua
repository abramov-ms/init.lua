return {
  "shortcuts/no-neck-pain.nvim",
  config = function ()
    require("no-neck-pain").setup({
      width = 100,
      mappings = {
        enabled = true,
        widthUp = "<Leader>n+",
      },
      autocmds = {
        enableOnVimEnter = true,
      },
      buffers = {
        scratchPad = {
          enabled = true,
          pathToFile = ".notes.md"
        },
        bo = {
          filetype = "markdown",
        },
      },
    })
  end
}
