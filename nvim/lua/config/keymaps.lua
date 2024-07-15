local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

-- Window management
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>ss", "<cmd>split<cr>", { desc = "Split horizontally" })

-- show full file-path
map("n", "<leader>pa", "<cmd>echo expand('%:p')<cr>", { desc = "Full file name" })

-- Directory Navigation
map("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
map("n", "<leader>m", ":NvimTreeFocus<cr>", { desc = "Focus NvimTree" })

-- select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
