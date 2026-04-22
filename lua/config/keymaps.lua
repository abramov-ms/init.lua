vim.g.mapleader = " "

-- Paste/delete preserving clipboard contents.

vim.keymap.set("n", "<Leader>p", [["_dP]])
vim.keymap.set("n", "<Leader>d", [["_d]])

-- Make current file executable.

vim.keymap.set("n", "<Leader>x", "<Cmd>silent !chmod +x %<CR>")

-- File browser.

vim.keymap.set("n", "-", vim.cmd.Oil)

-- Quickfix list.

vim.keymap.set("n", "<C-j>", "<Cmd>cn<CR>zz")
vim.keymap.set("n", "<C-k>", "<Cmd>cp<CR>zz")

-- Clangd.

vim.keymap.set("n", "<M-o>", "<Cmd>LspClangdSwitchSourceHeader<CR>")
