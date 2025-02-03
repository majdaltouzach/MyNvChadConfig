require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cc", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX document" })
map("n", "<leader>cc", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX document" })
map("n", "<cmd>w", "<cmd>VimtexView<CR>", { desc = "View LaTeX document" })
