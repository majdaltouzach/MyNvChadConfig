return {
  name = "g++ build",
  builder = function()
    -- Full path to current file
    local file = vim.fn.expand("%:p")
    -- Get file path without extension
    local output = vim.fn.expand("%:p:r")
    return {
      cmd = { "g++" },
      args = { file, "-o", output },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
