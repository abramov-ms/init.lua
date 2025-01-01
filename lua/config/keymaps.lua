vim.g.mapleader = " "

-- Force quit.

vim.keymap.set({ "n", "t" }, "<C-q>", "<Cmd>q!<CR>")

-- Resizing windows.

vim.keymap.set("n", "<C-Up>", "<Cmd>resize +1<CR>")
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -1<CR>")
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -1<CR>")
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +1<CR>")

-- Paste/delete preserving clipboard contents.

vim.keymap.set("n", "<Leader>p", [["_dP]])
vim.keymap.set("n", "<Leader>d", [["_d]])

-- Make current file executable.

vim.keymap.set("n", "<Leader>x", "<Cmd>silent !chmod +x %<CR>")

-- File browser.

vim.keymap.set("n", "-", vim.cmd.Oil)

-- Lsp.

vim.keymap.set("n", "<M-o>", vim.cmd.ClangdSwitchSourceHeader)

-- Quickfix list.

vim.keymap.set("n", "<C-j>", "<Cmd>cn<CR>zz")
vim.keymap.set("n", "<C-k>", "<Cmd>cp<CR>zz")
