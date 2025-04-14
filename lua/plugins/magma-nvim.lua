return {
  {
    lazy = false,
    "dccsillag/magma-nvim",
    build = ":UpdateRemotePlugins",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>mi', ':MagmaInit<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>me', ':MagmaEvaluateOperator<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>ml', ':MagmaEvaluateLine<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', '<leader>mv', ':<C-u>MagmaEvaluateVisual<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>mc', ':MagmaReevaluateCell<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>md', ':MagmaDelete<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>mo', ':MagmaShowOutput<CR>', { noremap = true, silent = true })
    end,
  },
}

