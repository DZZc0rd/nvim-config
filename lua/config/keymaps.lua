local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "<leader>?", "<cmd>WhereKey<cr>", { desc = "Show key mappings" })

keymap.set("n", "<leader>e", "<cmd>Fyler<cr>", { desc = "Open file explorer" })

keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find file" })
keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep<cr>", { desc = "Find string" })
