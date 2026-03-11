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
          endpoint = "http://localhost:11434/v1",
          model = "gemma3n:e4b",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.7,
            max_tokens = 8192,
          },
        },
      },

      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
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

      -- Maximize avante window when it opens (fullscreen-like experience)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("AvanteFullscreen", { clear = true }),
        pattern = "Avante",
        callback = function()
          vim.cmd("wincmd |")
        end,
      })

      -- Select an ollama model from those available at localhost:11434
      vim.api.nvim_create_user_command("AvanteOllamaModel", function()
        vim.fn.jobstart({ "curl", "-sf", "http://localhost:11434/api/tags" }, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            if not data or #data == 0 then
              vim.notify("AvanteOllamaModel: no response from ollama", vim.log.levels.ERROR)
              return
            end
            local ok, decoded = pcall(vim.fn.json_decode, table.concat(data, ""))
            if not ok or not decoded or not decoded.models then
              vim.notify("AvanteOllamaModel: failed to parse ollama response", vim.log.levels.ERROR)
              return
            end
            local models = vim.tbl_map(function(m) return m.name end, decoded.models)
            if #models == 0 then
              vim.notify("AvanteOllamaModel: no models found in ollama", vim.log.levels.WARN)
              return
            end
            vim.schedule(function()
              vim.ui.select(models, { prompt = "Select Ollama model:" }, function(choice)
                if not choice then return end
                require("avante.config").override({
                  provider = "ollama",
                  providers = {
                    ollama = { model = choice },
                  },
                })
                vim.notify("Avante: switched to ollama/" .. choice, vim.log.levels.INFO)
              end)
            end)
          end,
          on_stderr = function(_, data)
            if data and #data > 0 and data[1] ~= "" then
              vim.notify("AvanteOllamaModel: " .. table.concat(data, ""), vim.log.levels.ERROR)
            end
          end,
        })
      end, { desc = "Select Ollama model for Avante" })
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
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
