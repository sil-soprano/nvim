vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local cmp = require "cmp"
local types = require "cmp.types"
local options_cmp = {
  mapping = {
    ["<down>"] = cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
    ["<up>"] = cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
    ["<esc>"] = cmp.mapping.close(),
  },
  performance = {
    max_view_entries = 15,
  },
  preselect = types.cmp.PreselectMode.None,
  completion = {
    autocomplete = false,
    completeopt = "noselect",
  },
  experimental = {
    ghost_text = true,
  },
}

require("cmp").setup(options_cmp)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

require("telescope").setup {
  pickers = {
    find_files = {
      path_display = filenameFirst,
      hidden = true,
    },
    oldfiles = {
      path_display = filenameFirst,
    },
  },
}

local ft = require "Comment.ft"
ft.set("pug", "//- %s")
