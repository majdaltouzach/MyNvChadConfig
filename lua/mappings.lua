require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cc", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX document" })
map("n", "<leader>cv", "<cmd>VimtexView<CR>", { desc = "View LaTex pdf output" })
map("n", "<leader>op", "<cmd>PeekOpen<CR>", { desc = "View Markdown Output" })

-- Overseer keybinds
vim.keymap.set("n", "<leader>or", ":OverseerRun<CR>", { desc = "Run Overseer Task" })
vim.keymap.set("n", "<leader>ot", ":OverseerToggle<CR>", { desc = "Toggle Task Window" })
vim.keymap.set("n", "<leader>ol", ":OverseerLoadBundle<CR>", { desc = "Load Overseer Bundle" })


local api = require('remote-sshfs.api')
vim.keymap.set('n', '<leader>rc', api.connect, {})
vim.keymap.set('n', '<leader>rd', api.disconnect, {})
vim.keymap.set('n', '<leader>re', api.edit, {})

-- (optional) Override telescope find_files and live_grep to make dynamic based on if connected to host
local builtin = require("telescope.builtin")
local connections = require("remote-sshfs.connections")
vim.keymap.set("n", "<leader>ff", function()
 if connections.is_connected then
  api.find_files()
 else
  builtin.find_files()
 end
end, {})
vim.keymap.set("n", "<leader>fg", function()
 if connections.is_connected then
  api.live_grep()
 else
  builtin.live_grep()
 end
end, {})
