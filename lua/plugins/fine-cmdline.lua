return {
  lazy = false,
  'VonHeikemen/fine-cmdline.nvim',
  config = function ()
    require('fine-cmdline').setup({

    })
  end,
  dependencies = {
    lazy = false,
    'MunifTanjim/nui.nvim'
  }

}
