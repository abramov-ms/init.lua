return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = {
          "dashboard",
          "alpha",
          "TelescopePrompt",
          "NvimTree"
        }
      }
    },
    sections = {
      lualine_a = {
        "mode"
      },
      lualine_b = {
        {
          "branch",
          padding = {
            left = 1,
            right = 0
          }
        }
      },
      lualine_c = {
        "diagnostics",
        {
          "filename",
          path = 1,
          symbols = {
            modified = "",
            readonly = " ",
            new = " ",
            unnamed = ""
          }
        }
      },
      lualine_x = {
        "filetype"
      },
      lualine_y = {
        {
          "progress",
          separator = "",
          padding = {
            left = 1,
            right = 1
          }
        },
      },
      lualine_z = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates
        },
        {
          "location",
          padding = {
            left = 0,
            right = 1
          }
        }
      }
    }
  }
}
