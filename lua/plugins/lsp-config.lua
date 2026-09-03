return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp"
  },
  config = function()
    local util = require("lspconfig.util")
    local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        local opts = {
          buffer = args.buf
        }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        local show_diagnostic = function(count)
          return function()
            vim.diagnostic.jump({ count = count, float = true })
          end
        end

        vim.keymap.set("n", "]d", show_diagnostic(1), opts)
        vim.keymap.set("n", "[d", show_diagnostic(-1), opts)

        vim.keymap.set("n", "<Leader>lca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Leader>lcw", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        if client:supports_method("textDocument/formatting") then
          local fmt = function()
            vim.lsp.buf.format({ async = false })
          end

          vim.keymap.set("n", "<leader>fi", fmt, opts)
        end
      end,
    })

    util.default_config = vim.tbl_extend(
      "force",
      util.default_config,
      {
        capabilities = cmp_caps
      }
    )

    vim.lsp.config("clangd", {
      cmd = {
        "/usr/bin/clangd",
        "--header-insertion=never",
        "--limit-references=0",
        "--limit-results=0",
        "--rename-file-limit=0"
      }
    })
    vim.lsp.enable("clangd")

    vim.lsp.enable("pyright")
    vim.lsp.enable("cmake")

    vim.lsp.config('lua_ls', {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
              path ~= vim.fn.stdpath('config')
              and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
            path = {
              'lua/?.lua',
              'lua/?/init.lua',
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
              '${3rd}/luv/library',
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })
    vim.lsp.enable("lua_ls")

    vim.lsp.enable("gopls")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("ts_ls")
  end
}
