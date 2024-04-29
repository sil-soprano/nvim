-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nightowl",
  transparency = false,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  statusline = {
    theme = "vscode_colored",
    separator_style = "default",
  },
  tabufline = {
    order = { "buffers", "tabs", "treeOffset" },
    lazyload = false,
  },
  nvdash = {
    load_on_startup = true,
  },
  cmp = {
    icons = true,
    lspkind_text = false,
    style = "default",
  },
  telescope = { style = "bordered" },
}

return M
