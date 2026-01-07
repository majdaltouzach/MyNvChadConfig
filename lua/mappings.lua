require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- VimTeX Compile
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cc", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX document" })
map("n", "<leader>cv", "<cmd>VimtexView<CR>", { desc = "View LaTex pdf output" })

-- Typst Watch
map("n", "<leader>tw", "<cmd>TypstWatch<CR>", { desc = "Executes Typst Watch %file.typ" })

-- Peek For Markdown
map("n", "<leader>op", "<cmd>PeekOpen<CR>", { desc = "View Markdown Output" })

-- Overseer keybinds
map("n", "<leader>or", ":OverseerRun<CR>", { desc = "Run Overseer Task" })
map("n", "<leader>ot", ":OverseerToggle<CR>", { desc = "Toggle Task Window" })
map("n", "<leader>ol", ":OverseerLoadBundle<CR>", { desc = "Load Overseer Bundle" })

-- Toggle term
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggles ToggleTerm terminal emulator in neovim" })

-- Remote SSHFS
local api = require "remote-sshfs.api"
map("n", "<leader>rc", api.connect, {})
map("n", "<leader>rd", api.disconnect, {})
map("n", "<leader>re", api.edit, {})

-- Leetcode.nvim
map("n", "<leader>pp", "<cmd>Leet<CR>", { desc = "Pick LeetCode Question" })
map("n", "<leader>lr", "<cmd>Leet run<CR>", { desc = "Run LeetCode Code" })
map("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "Submit LeetCode Code" })
map("n", "<leader>ln", "<cmd>Leet next_testcase<CR>", { desc = "Next LeetCode Test Case" })
map("n", "<leader>lp", "<cmd>Leet prev_testcase<CR>", { desc = "Previous LeetCode Test Case" })
map("n", "<leader>ll", "<cmd>Leet lang<CR>", { desc = "Set LeetCode Language" })

-- FindCMDLine
if pcall(require, "fine-cmdline") then
  vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
end

-- Dynamic Telescope based on remote connection
local builtin = require "telescope.builtin"
local connections = require "remote-sshfs.connections"
map("n", "<leader>ff", function()
  if connections.is_connected then
    api.find_files()
  else
    builtin.find_files()
  end
end, {})
map("n", "<leader>fg", function()
  if connections.is_connected then
    api.live_grep()
  else
    builtin.live_grep()
  end
end, {})

-- Magma Keybindings
vim.api.nvim_set_keymap("n", "<leader>mi", ":MagmaInit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>me", ":MagmaEvaluateOperator<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ml", ":MagmaEvaluateLine<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>mv", ":<C-u>MagmaEvaluateVisual<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>mc", ":MagmaReevaluateCell<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>md", ":MagmaDelete<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>mo", ":MagmaShowOutput<CR>", opts)

-- Tmux bindings for vim
map("n", "<C-h>", function()
  require("tmux").move_left()
end, opts)
map("n", "<C-j>", function()
  require("tmux").move_bottom()
end, opts)
map("n", "<C-k>", function()
  require("tmux").move_top()
end, opts)
map("n", "<C-l>", function()
  require("tmux").move_right()
end, opts)
map("n", "<C-n>", function()
  require("tmux").next_window()
end, opts)
map("n", "<C-p>", function()
  require("tmux").previous_window()
end, opts)
