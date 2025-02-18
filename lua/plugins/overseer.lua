return {
'stevearc/overseer.nvim',
 lazy = false,
  config = function ()
    require("overseer").setup({
        templates = { "builtin", "user.cpp_build" },
    })
  end,

  opts = {

  },
}
