return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      ---@module "snacks"
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = {  -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    local opencode_cmd = 'opencode --port'
    ---@type snacks.terminal.Opts
    local snacks_terminal_opts = {
      win = {
        position = 'right',
        enter = false,
        on_win = function(win)
          -- Set up keymaps and cleanup for an arbitrary terminal
          require('opencode.terminal').setup(win.win)
        end,
      },
    }
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require('snacks.terminal').open(opencode_cmd, snacks_terminal_opts)
        end,
        stop = function()
          require('snacks.terminal').get(opencode_cmd, snacks_terminal_opts):close()
        end,
        toggle = function()
          require('snacks.terminal').toggle(opencode_cmd, snacks_terminal_opts)
        end,
      },
      events = {
        permissions = {
          edits = {
            enabled = false
          }
        }
      }
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<Leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end,
      { desc = "Ask opencode…" })
    vim.keymap.set({ "n", "x" }, "<Leader>os", function() require("opencode").select() end,
      { desc = "Execute opencode action…" })
    vim.keymap.set({ "n" }, "<Leader>oo", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

    -- vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
    --   { desc = "Add range to opencode", expr = true })
    -- vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
    --   { desc = "Add line to opencode", expr = true })

    vim.keymap.set("n", "<M-u>", function() require("opencode").command("session.half.page.up") end,
      { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<M-d>", function() require("opencode").command("session.half.page.down") end,
      { desc = "Scroll opencode down" })

    vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
  end,
}
