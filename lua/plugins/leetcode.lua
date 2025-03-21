return {
    lazy = false,
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lang = "cpp",  -- Set your preferred language (e.g., python, java, etc.)
        cookie = "LEETCODE_SESSION=your_session_value; csrftoken=your_csrf_token; INGRESSCOOKIE=your_ingress_cookie;",
        
        -- Custom key mappings
        mappings = {
            next_testcase = "]t",  -- Jump to the next test case
            prev_testcase = "[t",  -- Jump to the previous test case
        },
    },
}
