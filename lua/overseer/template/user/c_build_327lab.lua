return {
  name = "gcc build pthread lrt",
  builder = function()
    local file = vim.fn.expand "%:p" -- Full path to the current file
    local output = vim.fn.expand "%:p:r" -- Remove the extension for the output file
    return {
      cmd = { "gcc" },
      args = { file, "-o", output, "-fno-stack-operator", "-z", "execstack", "-Wall", "-Wextra", "-Werror", "-g" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "c" },
  },
}
