return {
  lazy = false,
  "aserowy/tmux.nvim",
  config = function ()
   require("tmux").setup({
      enable_default_keybindings = false
    })
  end
}
