return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip"
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup({
      region_check_events = "InsertEnter"
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      window = {
        completion = {
          scrollbar = true,
          max_height = 3
        },
        documentation = cmp.config.window.bordered()
      },
      completion = {
        completeopt = "menu,menuone,preview"
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-d>"] = cmp.mapping.scroll_docs(1),
        ["<C-u>"] = cmp.mapping.scroll_docs(-1),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" })
      }),
      sources = cmp.config.sources(
        {
          { name = "nvim_lsp", max_item_count = 10 },
          { name = "luasnip",  max_item_count = 3 }
        },
        {
          { name = "buffer", max_item_count = 3 }
        }
      ),
      formatting = {
        format = function(_, item)
          local kind_icons = {
            Text = " ",
            Method = "󰆧 ",
            Function = "󰊕 ",
            Constructor = "󰆧 ",
            Field = " ",
            Variable = " ",
            Class = " ",
            Interface = " ",
            Module = "󰅩 ",
            Property = " ",
            Unit = " ",
            Value = "󰎠 ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = " ",
            File = " ",
            Reference = " ",
            Folder = " ",
            EnumMember = " ",
            Constant = "󰏿 ",
            Struct = " ",
            Event = "󰄉 ",
            Operator = "󰆕 ",
            TypeParameter = " ",
          }

          item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)

          return item
        end
      },
      experimental = {
        ghost_text = true
      }
    })
  end
}
