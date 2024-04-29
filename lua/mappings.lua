require "nvchad.mappings"

local api = require "nvim-tree.api"
local map = vim.keymap.set

-- disable keymaps start
map({ "n", "v" }, "h", "")
map({ "n", "v" }, "j", "")
map({ "n", "v" }, "k", "")
map({ "n", "v" }, "l", "")
map({ "n", "v" }, "x", "")

map({ "n" }, "<leader>e", "")

map({ "n", "v", "i" }, "<C-r>", "")
map({ "n", "v", "i", "t", "c" }, "<C-t>", "")
map({ "n", "v", "i" }, "<S-down>", "")
map({ "n", "v", "i" }, "<S-up>", "")
map({ "n", "v" }, "{", "")
map({ "n", "v" }, "}", "")
map({ "n" }, "<tab>", "")
map({ "n" }, "<S-tab>", "")
map({ "c" }, "<C-S-p>", "")
map({ "n" }, "v", "")
map({ "n" }, ":", "")

map({ "n", "v" }, "<C-right>", "e")
map({ "n", "v" }, "<C-left>", "b")
map({ "n", "v", "i" }, "<C-w>", "")
-- disable keymaps end

-- vscode like start
map({ "n" }, "<C-a>", "<esc><C-home><home>v<C-end><end>")
map({ "n", "v", "i", "t", "c" }, "<C-S-e>", "<esc><cmd>:NvimTreeFocus<cr>")
map({ "n", "v", "i", "t", "c" }, "<C-S-x>", "<esc><cmd>:Lazy<cr>")
map({ "n", "v", "i", "t", "c" }, "<C-b>", "<esc><cmd>:NvimTreeToggle<cr>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>")
-- undo
map({ "n", "v" }, "<C-z>", "<esc>u<esc>")
map({ "i" }, "<C-z>", "<esc>ua")
-- redo
map({ "n", "v" }, "<C-y>", "<esc><C-r><esc>")
map({ "i" }, "<C-y>", "<esc><C-r>a")
-- exit
map({ "n", "v", "i", "c", "t" }, "<C-q>", "<cmd>q<cr>")
-- copy line
map({ "n" }, "<C-c>", "<esc>yy")
map({ "i" }, "<C-c>", "<esc>yya")
map({ "v" }, "<C-c>", "y`]")
-- paste line
map({ "n" }, "<C-v>", "<esc>P`]")
map({ "i" }, "<C-v>", "<esc>Pa")
map({ "v" }, "<C-v>", "P`]")
-- cut
map({ "n" }, "<C-x>", "dd")
map({ "v" }, "<C-x>", "d")
map({ "i" }, "<C-x>", "<esc>dda")
-- toggle comment
map({ "v" }, "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map({ "n", "i" }, "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<cr>")
map({ "n", "v", "i", "t", "c" }, "<C-t>", api.fs.create)
-- buffers "tabs"
map({ "n", "v", "i", "t", "c" }, "<C-pageup>", "<cmd>lua require('nvchad.tabufline').prev()<cr>")
map({ "n", "v", "i", "t", "c" }, "<C-pagedown>", "<cmd>lua require('nvchad.tabufline').next()<cr>")
map({ "n", "v", "i" }, "<C-w>", "<cmd>lua require('nvchad.tabufline').close_buffer()<cr>")
-- tabs
map({ "v" }, "<tab>", ">")
map({ "v" }, "<S-tab>", "<")
-- commands
map({ "n", "v", "i" }, "<C-S-p>", "<esc>:")

-- vscode like end

-- terminal
map(
  { "n", "v", "i", "t", "c" },
  "<C-S-j>",
  "<esc><cmd>lua require('nvchad.term').toggle({ pos = 'sp', id = 'htoggleTerm' })<cr>"
)
-- telescope
map({ "n", "v", "i", "t", "c" }, "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-f>"] = actions.close,
      },
    },
  },
}
-- fix insert mode start
map({ "i" }, "<C-BS>", "<esc><right>dbi")
-- fix insert mode end

-- fix visual mode start
map({ "v" }, "<C-BS>", '"_d')
map({ "v" }, "<BS>", '"_d')

map({ "n" }, "<S-down>", "<S-down>")
map({ "v" }, "<S-down>", "<S-down>")
map({ "i" }, "<S-down>", "<S-down>")

map({ "n" }, "<S-up>", "<S-up>")
map({ "v" }, "<S-up>", "<S-up>")
map({ "i" }, "<S-up>", "<S-up>")
-- dont like strat
map({ "v" }, "<C-S-end>", "<S-end>")
map({ "v" }, "<C-S-home>", "<S-home>")
-- dont like end
-- fix visual mode end

-- fix normal mode start
map({ "n" }, "r", "R")
map({ "n" }, "<delete>", '"_x')
map({ "n" }, "<C-space>", "a")
map({ "n" }, "<end>", "g^")
map({ "n" }, "<end>", "g$")
map({ "n" }, "<cr>", "i<cr>")
map({ "n", "v" }, "u", "g^")
map({ "n", "v" }, "o", "g$")
map({ "n" }, "<tab>", "S")
map({ "n" }, ".", ".")

-- fix delete in normal mode start
map({ "n", "v" }, "d", "c")
map({ "n" }, "do", "C")
map({ "n" }, "du", "c<home>")
map({ "n" }, "dw", "ciw")
-- map({ "n" }, "d.", "ci>")
-- map({ "n" }, "d,", "ci>")
-- map({ "n" }, "d>", "ci>")
-- map({ "n" }, "d<", "ci>")
-- map({ "n" }, 'd"', 'ci"')
-- map({ "n" }, "d'", "ci'")
-- fix delete in normal mode end
-- fix normal mode end

map({ "n", "i" }, "<C-r>", vim.diagnostic.open_float)
map({ "n", "i" }, "<C-S-r>", vim.diagnostic.goto_next)
map({ "n", "i" }, "<A-l>", vim.lsp.buf.code_action)
