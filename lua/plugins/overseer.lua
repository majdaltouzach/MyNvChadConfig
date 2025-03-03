return {
  "stevearc/overseer.nvim",
  lazy = false,
  config = function()
    require("overseer").setup {
      templates = { "builtin", "user.cpp_build", "user.c_build", "user.c_build_pthread_lrt", "user.c_build_327lab" },
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
