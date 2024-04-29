local api = require "nvim-tree.api"

local function my_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<C-S-e>", "<C-w>w", opts "Focus Editor")
  vim.keymap.set("n", "<esc>", "<C-w>w", opts "Focus Editor")
  vim.keymap.set("n", "<C-t>", api.fs.create, opts "Create File")
  vim.keymap.set("n", "<delete>", api.fs.trash, opts "Delete in Trash")
  vim.keymap.set("n", "d", api.fs.trash, opts "Delete in Trash")
  vim.keymap.set("n", "r", api.tree.reload, opts "Delete in Trash")
  vim.keymap.set("n", "<right>", api.node.open.preview, opts "Open folder or edit file")
  vim.keymap.set("n", "<left>", api.node.navigate.parent_close, opts "Open folder or edit file")
  vim.keymap.set("n", "<C-left>", api.tree.collapse_all, opts "Collapse all files")
  vim.keymap.set("n", "<C-c>", api.fs.copy.node, opts "Copy fs")
  vim.keymap.set("n", "<C-v>", api.fs.paste, opts "Paste fs")
  vim.keymap.set("n", "<C-x>", api.fs.cut, opts "Cup fs")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
end

require("nvim-tree").setup {
  on_attach = my_on_attach,
  ui = {
    confirm = {
      remove = true,
      trash = false,
      default_yes = false,
    },
  },
  view = {
    side = "right",
    width = 35,
  },
}
