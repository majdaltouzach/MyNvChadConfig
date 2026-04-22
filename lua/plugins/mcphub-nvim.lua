-- ~/.config/nvim/lua/plugins/mcphub.lua
return {
  "ravitemer/mcphub.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = "npm install -g mcp-hub@latest",
  config = function()
    require("mcphub").setup({
      port = 37373,
      config = vim.fn.expand("~/.config/mcphub/servers.json"),
      shutdown_delay = 5 * 60 * 1000,
      auto_approve = false,
      auto_toggle_mcp_servers = true, -- LLM can start/stop servers as needed
      extensions = {
        avante = {
          make_slash_commands = true,
        },
      },
      workspace = {
        enabled = true,
        look_for = { ".mcphub/servers.json", ".vscode/mcp.json", ".cursor/mcp.json" },
        reload_on_dir_changed = true,
        port_range = { min = 40000, max = 41000 },
      },
      -- expose GITHUB_TOKEN to all servers globally instead of per-server
      global_env = {
        "GITHUB_TOKEN",
        "BRAVE_API_KEY",
      },
    })
  end,
}
