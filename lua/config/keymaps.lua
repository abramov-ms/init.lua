vim.g.mapleader = " "

-- Force quit.

vim.keymap.set({ "n", "t" }, "<C-q>", "<Cmd>q!<CR>")

-- Moving around windows.

local function focus_window(which)
  return function()
    vim.cmd.wincmd(which)
  end
end

vim.keymap.set({ "n", "t" }, "<C-j>", focus_window("j"))
vim.keymap.set({ "n", "t" }, "<C-h>", focus_window("h"))
vim.keymap.set({ "n", "t" }, "<C-k>", focus_window("k"))
vim.keymap.set({ "n", "t" }, "<C-l>", focus_window("l"))

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

-- Splits.

vim.keymap.set("n", "<Leader>%", vim.cmd.vs)
vim.keymap.set("n", [[<Leader>"]], vim.cmd.split)

-- File browser.

vim.keymap.set("n", "-", vim.cmd.Oil)

-- Lsp.

vim.keymap.set("n", "<M-o>", vim.cmd.ClangdSwitchSourceHeader)
