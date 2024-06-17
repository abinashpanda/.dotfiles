require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>tt", '<CMD>lua require("FTerm").toggle()<CR>')

local nvim_tree_api = require "nvim-tree.api"
map("n", "<leader>e", nvim_tree_api.tree.toggle)
