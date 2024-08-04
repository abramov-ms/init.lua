local function mark(func)
  return function()
    return require("harpoon.mark")[func]()
  end
end

local function ui(func)
  return function()
    return require("harpoon.ui")[func]()
  end
end

return {
  "ThePrimeagen/harpoon",
  config = true,
  keys = {
    { "<C-a>", mark("add_file") },
    { "<C-p>", ui("toggle_quick_menu") },
    { "<C-n>", ui("nav_prev") },
    { "<C-m>", ui("nav_next") }
  }
}

