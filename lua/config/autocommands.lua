vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    pattern = "*.py",
    callback = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    pattern = "*.go",
    callback = function()
      vim.opt.expandtab = false
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    pattern = {
      "*.c",
      "*.h",
      "*.cpp",
      "*.hpp",
    },
    callback = function()
      vim.bo.commentstring = "// %s"
    end
  }
)
