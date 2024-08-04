-- return {
--   {
--     "oxfist/night-owl.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme("night-owl")
--     end
--   }
-- }

-- return {
--   "bluz71/vim-moonfly-colors",
--   name = "moonfly",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.moonflyItalics = true
--     vim.cmd.colorscheme("moonfly")
--   end
-- }

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("catppuccin")
--   end
-- }

-- return {
--   "folke/tokyonight.nvim",
--   name = "tokyonight",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "night"
--     })
--
--     vim.cmd.colorscheme("tokyonight")
--   end
-- }

return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({})
    vim.cmd.colorscheme("rose-pine-main")
  end
}

-- return {
--   "rebelot/kanagawa.nvim",
--   name = "kanagawa",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("kanagawa").setup({
--       commentStyle = { italic = false },
--       keywordStyle = { italic = false },
--       theme = "wave",
--       background = {
--         dark = "wave",
--         light = "wave"
--       }
--     })
--     vim.cmd.colorscheme("kanagawa")
--   end
-- }

-- return {
--   "luisiacc/gruvbox-baby",
--   name = "gruvbox",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.gruvbox_baby_background_color = "dark"
--     vim.cmd.colorscheme("gruvbox-baby")
--   end
-- }

-- return {
--   "doums/darcula",
--   name = "darcula",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("darcula")
--   end
-- }

-- return {
--   "martinsione/darkplus.nvim",
--   name = "darkplus",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("darkplus")
--   end
-- }
