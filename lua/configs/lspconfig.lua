-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.hls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "haskell", "lhaskell", "cabal" },
}

lspconfig.jedi_language_server.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
}

lspconfig.pylsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "pylsp" },
  filetypes = { "python" },
  single_file_support = true,
}

lspconfig.jdtls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmds = { "jdtls", "-configuration", "/home/user/.cache/jdtls/config", "-data", "/home/user/.cache/jdtls/workspace" },
}

lspconfig.texlab.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
}

lspconfig.omnisharp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  filetypes = { "cs", "vb" },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
}

lspconfig.markdown_oxide.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "markdown-oxide" },
  filetypes = { "markdown" },
  single_file_support = { true },
}

lspconfig.arduino_language_server.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = {
    textDocument = {
      semanticTokens = vim.NIL,
    },
    workspace = {
      semanticTokens = vim.NIL,
    },
  },
  cmd = { "arduino-language-server" },
  filetypes = { "arduino" },
}

lspconfig.vimls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  init_options = {
    diagnostic = {
      enable = true,
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true,
    },
    isNeovim = true,
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true,
    },
    vimruntime = "",
  },
  single_file_support = { true },
}

lspconfig.taplo.setup {
  cmd = { "taplo", "lsp", "stdio" },
  filetypes = { "toml" },
  single_file_support = { true },
}
lspconfig.bashls.setup {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_dir = { "gF" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
    },
  },
  single_file_support = true,
}

lspconfig.nginx_language_server.setup {
  cmd = { "nginx-language-server" },
  filetypes = { "nginx" },
  root_dir = "gF",
  single_file_support = true,
}

lspconfig.clojure_lsp.setup {
  cmd = { "clojure-lsp" },
  filetypes = { "clojure", "edn" },
  root_dir = { "gF" },
  single_file_support = true,
}

-- lspconfig.gdtoolkit.setup {
--   cmd = {"gdtoolkit"},
--   filetypes = { "gd", "gdscript", "gdscript3", "gdshader", "gdshaderinc"},
--   root_dir = {"gF"}
--
-- }

-- lspconfig.gdshader_lsp.setup {
--   cmd = {"gdshader-lsp", "--stdio"},
--   filetypes = { "gdshader", "gdshaderinc" },
--   root_dir = {"gF"}
-- }
--
lspconfig.jsonls.setup {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  root_dir = { "gF" },
  single_file_support = true,
}

lspconfig.docker_compose_language_service.setup {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml.docker-compose" },
  root_dir = { "gF" },
  single_file_support = true,
}

lspconfig.dockerls.setup {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
  root_dir = { "gF" },
  single_file_support = true,
}

lspconfig.lemminx.setup {
  cmd = { "lemminx" },
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
  root_dir = {"gF"},
  single_file_support = true

}

lspconfig.cmake.setup {
 cmd = {"cmake-language-server"},
 filetypes = {"cmake"},
 init_options = {
    buildDirectory = "build"
  },

  root_dir = {"gF"},
  single_file_support = true
}
