return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup {
      flutter_path = "flutter", -- or full path to flutter if needed
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment", -- Highlight for the closing tag
        prefix = "// ",
        enabled = true,
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabedit", -- "tabedit", "vsplit", "split"
      },
      lsp = {
        color = {
          enabled = true,
        },
        on_attach = function(client, bufnr)
          local bufmap = function(mode, lhs, rhs)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
          end

          bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
          bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
          bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
          bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        end,
      },
      root_patterns = { "pubspec.yaml" },
    }
  end,
  ft = { "dart" },
}
