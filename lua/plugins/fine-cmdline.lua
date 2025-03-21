return {
  'VonHeikemen/fine-cmdline.nvim',
  lazy = false,
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('fine-cmdline').setup({
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = '➤ ', -- Looks clean and modern
      },
      popup = {
        position = {
          row = '40%', -- vertically centered-ish
          col = '50%', -- horizontally centered
        },
        size = {
          width = '60%',
        },
        border = {
          style = 'rounded',
        },
        win_options = {
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        },
      },
      hooks = {
        after_mount = function(input)
          -- Autofocus the input field
          input:map('i', '<C-c>', function()
            input:unmount()
          end, { noremap = true })
        end
      }
    })
  end,
}
