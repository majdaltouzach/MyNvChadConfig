-- Load NvChad defaults
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Common defaults
local defaults = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Simple servers
for _, server in ipairs({ "html", "cssls", "clangd" }) do
  vim.lsp.config(server, defaults)
end

-- Haskell
vim.lsp.config("hls", vim.tbl_extend("force", defaults, {
  filetypes = { "haskell", "lhaskell", "cabal" },
}))

-- Python (Jedi + Pylsp)
vim.lsp.config("jedi_language_server", vim.tbl_extend("force", defaults, {
  filetypes = { "python" },
}))

vim.lsp.config("pylsp", vim.tbl_extend("force", defaults, {
  cmd = { "pylsp" },
  filetypes = { "python" },
  single_file_support = true,
}))

-- Java
vim.lsp.config("jdtls", vim.tbl_extend("force", defaults, {
  cmd = {
    "jdtls",
    "-configuration", "/home/user/.cache/jdtls/config",
    "-data", "/home/user/.cache/jdtls/workspace",
  },
}))

-- LaTeX
vim.lsp.config("texlab", vim.tbl_extend("force", defaults, {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
}))

-- C# / VB (OmniSharp)
vim.lsp.config("omnisharp", vim.tbl_extend("force", defaults, {
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  filetypes = { "cs", "vb" },
  root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
  settings = {
    enable_import_completion = true,
    organize_imports_on_format = true,
    enable_roslyn_analyzers = true,
  },
}))

-- Markdown
vim.lsp.config("markdown_oxide", vim.tbl_extend("force", defaults, {
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  single_file_support = true,
}))

-- Arduino
vim.lsp.config("arduino_language_server", vim.tbl_extend("force", defaults, {
  cmd = { "arduino-language-server" },
  filetypes = { "arduino" },
  capabilities = {
    textDocument = { semanticTokens = vim.NIL },
    workspace = { semanticTokens = vim.NIL },
  },
}))

-- Vimscript
vim.lsp.config("vimls", vim.tbl_extend("force", defaults, {
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  init_options = {
    diagnostic = { enable = true },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true,
    },
    isNeovim = true,
    iskeyword = "@,48-57,_,192-255,-#",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true,
    },
  },
  single_file_support = true,
}))

-- TOML
vim.lsp.config("taplo", {
  cmd = { "taplo", "lsp", "stdio" },
  filetypes = { "toml" },
  single_file_support = true,
})

-- Bash
vim.lsp.config("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
    },
  },
  single_file_support = true,
})

-- Nginx
vim.lsp.config("nginx_language_server", {
  cmd = { "nginx-language-server" },
  filetypes = { "nginx" },
  single_file_support = true,
})

-- Clojure
vim.lsp.config("clojure_lsp", {
  cmd = { "clojure-lsp" },
  filetypes = { "clojure", "edn" },
  single_file_support = true,
})

-- JSON
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = { provideFormatter = true },
  single_file_support = true,
})

-- Docker
vim.lsp.config("docker_compose_language_service", {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml.docker-compose" },
  single_file_support = true,
})

vim.lsp.config("dockerls", {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
  single_file_support = true,
})

-- XML
vim.lsp.config("lemminx", {
  cmd = { "lemminx" },
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
  single_file_support = true,
})

-- CMake
vim.lsp.config("cmake", {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  init_options = { buildDirectory = "build" },
  single_file_support = true,
})
