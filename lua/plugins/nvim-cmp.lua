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

    local lsp_kind_comparator = function(conf)
      local lsp_types = require("cmp.types").lsp
      return function(entry1, entry2)
        if entry1.source.name ~= "nvim_lsp" then
          if entry2.source.name == "nvim_lsp" then
            return false
          else
            return nil
          end
        end

        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0
        if priority1 == priority2 then
          return nil
        else
          return priority2 < priority1
        end
      end
    end

    local label_comparator = function(entry1, entry2)
      return entry1.completion_item.label:len() < entry2.completion_item.label:len()
    end

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
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.jumpable(1) then
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
      sorting = {
        priority_weight = 1,
        comparators = {
          lsp_kind_comparator({
            kind_priority = {
              Parameter = 14,
              Variable = 12,
              Field = 11,
              Property = 11,
              Constant = 10,
              Enum = 10,
              EnumMember = 10,
              Event = 10,
              Function = 10,
              Method = 10,
              Operator = 10,
              Reference = 10,
              Struct = 10,
              File = 8,
              Folder = 8,
              Class = 5,
              Color = 5,
              Module = 5,
              Keyword = 2,
              Constructor = 1,
              Interface = 1,
              Snippet = 0,
              Text = 1,
              TypeParameter = 1,
              Unit = 1,
              Value = 1,
            },
          }),
          label_comparator,
        }
      },
      formatting = {
        expandable_indicator = true,
        fields = { "abbr", "kind", "menu" },
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
