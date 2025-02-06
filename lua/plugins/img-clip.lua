return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    dir_path = "$HOME/Pictures/.markdownimglclip/",
    use_absolute_path = true,
    insert_mode = true
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
