local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "<leader>e", "<cmd>Fyler<cr>", { desc = "Open file explorer" })
