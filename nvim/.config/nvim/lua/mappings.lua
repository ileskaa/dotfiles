require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "K", function() vim.lsp.buf.hover { border = "rounded" } end, { desc = "LSP hover" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
