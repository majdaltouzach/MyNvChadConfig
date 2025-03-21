return {
  "kawre/leetcode.nvim",
  lazy = false,
  build = ":TSUpdate html", -- Update treesitter parser for HTML
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- Preferred language for LeetCode problems
    lang = "cpp",

    -- Store cookie in ENV var for security
    -- Set this in your shell config: export LEETCODE_SESSION="LEETCODE_SESSION=...; csrftoken=...; INGRESSCOOKIE=..."
    cookie = vim.fn.getenv "LEETCODE_SESSION",

    -- Optional UI customization
    ui = {
      theme = "dark", -- options: 'dark' | 'light' | 'auto'
      border = "rounded", -- style: single, double, rounded, solid, shadow
    },

    -- Optional description window style
    description = {
      width = 0.6, -- 60% of the screen width
      height = 0.6,
      border = "rounded",
    },

    -- Telescope configuration
    telescope = {
      theme = "ivy", -- options: dropdown, cursor, ivy
    },

    -- Custom key mappings
    -- mappings = {
    --   next_testcase = "<leader>ln", -- "leetcode next"
    --   prev_testcase = "<leader>lp", -- "leetcode previous"
    --   pick_question = "<leader>lq", -- "leetcode question"
    --   run_code = "<leader>lr", -- "leetcode run"
    --   submit_code = "<leader>ls", -- "leetcode submit"
    -- },
  },
}
