local status, lualine = pcall(require, "lualine")
if not status then
  print("Lualine not installed!")
  return
end

local lualine_moonfly = require("lualine.themes.moonfly")

lualine.setup()
