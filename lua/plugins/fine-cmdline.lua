return {
  'VonHeikemen/fine-cmdline.nvim',
  lazy = false,
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('fine-cmdline').setup({
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = '➤ ',
      },
      popup = {
        position = {
          row = '50%',
          col = '50%',
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
        relative = 'editor', -- 👈 ensures it's centered relative to the whole editor
      },
      hooks = {
        after_mount = function(input)
          input:map('i', '<C-c>', function()
            input:unmount()
          end, { noremap = true })
        end
      }
    })
  end,
}
