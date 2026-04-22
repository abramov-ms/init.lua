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
          idle_delay_ms = 0,
          edits = {
            enabled = false
          }
        }
      }
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    vim.keymap.set({ "n", "x" }, "<Leader>oa", function() require("opencode").ask("", { submit = true }) end,
      { desc = "Ask opencode…" })
    vim.keymap.set({ "n", "x" }, "<Leader>os", function() require("opencode").select() end,
      { desc = "Execute opencode action…" })

    -- Opening in tmux is better?
    -- vim.keymap.set({ "n" }, "<Leader>oo", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
    -- vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")

    vim.keymap.set("n", "<M-u>", function() require("opencode").command("session.half.page.up") end,
      { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<M-d>", function() require("opencode").command("session.half.page.down") end,
      { desc = "Scroll opencode down" })
  end,
}
