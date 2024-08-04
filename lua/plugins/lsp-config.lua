return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/neodev.nvim",
      config = true
    },
    {
      "hrsh7th/nvim-cmp"
    }
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, { signs = false }
    )

    lspconfig.util.default_config = vim.tbl_extend(
      "force",
      lspconfig.util.default_config,
      {
        capabilities = cmp_caps,
        on_attach = function(client, bufnr)
          local opts = {
            buffer = bufnr
          }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          vim.keymap.set("n", "<Leader>ldd", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

          vim.keymap.set("n", "<Leader>lca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<Leader>lcw", vim.lsp.buf.rename, opts)
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

          if client.supports_method("textDocument/formatting") then
            local fmt = function()
              vim.lsp.buf.format({ async = false })
            end

            vim.keymap.set("n", "<leader>fi", fmt, opts)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = fmt
            })
          end
        end
      }
    )

    lspconfig.clangd.setup({
      cmd = { "clangd", "-header-insertion=never" }
    })

    lspconfig.cmake.setup({})

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT"
          },
          workspace = {
            checkThirdParty = false
          },
          telemetry = {
            enable = false
          }
        }
      }
    })

    lspconfig.gopls.setup({})

    lspconfig.rust_analyzer.setup({})
  end
}
