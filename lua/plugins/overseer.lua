return {
  "stevearc/overseer.nvim",
  lazy = false,
  config = function()
    require("overseer").setup {
      templates = { "builtin", "user.cpp_build", "user.c_build" },
      strategy = "toggleterm",
      task_list = {
        default_detail = 1,
        bindings = {
          ["<CR>"] = "run",
          ["q"] = "close",
        },
      },
    }
  end,

  opts = {},
}
