return {
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false,
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      instructions_file = "avante.md",
      provider = "ollama",
      mode = "agentic",

      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        if not hub then return "" end
        return hub:get_active_servers_prompt()
      end,

      custom_tools = function()
        return { require("mcphub.extensions.avante").mcp_tool() }
      end,

      -- disable avante builtins — MCP servers handle these
      disabled_tools = {
        "list_files",
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash",
      },

      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        ollama = {
          endpoint = "http://localhost:11434",
          model = "gemma4:e2b", -- default; use <leader>am to switch at runtime
          timeout = 60000,
          is_env_set = function()
            return require("avante.providers").ollama.check_endpoint_alive()
          end,
          use_ReAct_prompt = false,
          extra_request_body = {
            temperature = 0.7,
            num_ctx = 16384,
          },
        },
      },

      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = true,
        support_paste_from_clipboard = true,
      },

      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },

      hints = {
        enabled = true,
      },

      windows = {
        position = "right",
        wrap = true,
        width = 50,
        sidebar_header = {
          align = "center",
          rounded = true,
        },
      },

      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
    },

    config = function(_, opts)
      require("avante").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("AvanteFullscreen", { clear = true }),
        pattern = "Avante",
        callback = function()
          vim.cmd("wincmd |")
        end,
      })

      -- model picker — fetches live list from ollama at runtime
      vim.api.nvim_create_user_command("AvanteOllamaModel", function()
        local ollama_provider = require("avante.providers").ollama
        local models = ollama_provider:list_models()
        if not models or #models == 0 then
          vim.notify("AvanteOllamaModel: no models found in ollama", vim.log.levels.WARN)
          return
        end
        local names = vim.tbl_map(function(m) return m.id end, models)
        vim.ui.select(names, { prompt = "Select Ollama model:" }, function(choice)
          if not choice then return end
          ollama_provider._model_list_cache = nil
          require("avante.config").override({
            provider = "ollama",
            providers = { ollama = { model = choice } },
          })
          vim.notify("Avante: switched to ollama/" .. choice, vim.log.levels.INFO)
        end)
      end, { desc = "Select Ollama model for Avante" })

      -- keybind to trigger model picker
      vim.keymap.set("n", "<leader>am", "<cmd>AvanteOllamaModel<cr>", {
        desc = "Avante: select Ollama model",
        silent = true,
      })
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "ravitemer/mcphub.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "stevearc/dressing.nvim",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
