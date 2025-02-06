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

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities, }
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
  cmds = { "jdtls", "-configuration", "/home/user/.cache/jdtls/config", "-data", "/home/user/.cache/jdtls/workspace" }

}

lspconfig.texlab.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
}

-- lspconfig.csharp_ls.setup {
--   cmd = { "csharp-ls" },
--   filetypes = {"cs"},
--   init_options = { AutomaticWorkspaceInit = true },
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- lspconfig.omnisharp.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   cmd = { "dotnet", "/usr/lib/omnisharp/OmniSharp.dll"},
--    settings = {
--       FormattingOptions = {
--         -- Enables support for reading code style, naming convention and analyzer
--         -- settings from .editorconfig.
--         EnableEditorConfigSupport = true,
--         -- Specifies whether 'using' directives should be grouped and sorted during
--         -- document formatting.
--         OrganizeImports = nil,
--       },
--       MsBuild = {
--         -- If true, MSBuild project system will only load projects for files that
--         -- were opened in the editor. This setting is useful for big C# codebases
--         -- and allows for faster initialization of code navigation features only
--         -- for projects that are relevant to code that is being edited. With this
--         -- setting enabled OmniSharp may load fewer projects and may thus display
--         -- incomplete reference lists for symbols.
--         LoadProjectsOnDemand = nil,
--       },
--       RoslynExtensionsOptions = {
--         -- Enables support for roslyn analyzers, code fixes and rulesets.
--         EnableAnalyzersSupport = nil,
--         -- Enables support for showing unimported types and unimported extension
--         -- methods in completion lists. When committed, the appropriate using
--         -- directive will be added at the top of the current file. This option can
--         -- have a negative impact on initial completion responsiveness,
--         -- particularly for the first few completion sessions after opening a
--         -- solution.
--         EnableImportCompletion = nil,
--         -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--         -- true
--         AnalyzeOpenDocumentsOnly = nil,
--       },
--       Sdk = {
--         -- Specifies whether to include preview versions of the .NET SDK when
--         -- determining which version to use for project loading.
--         IncludePrereleases = true,
--       },
--     },
--   filetypes = {"cs", "vb"},
--
--
-- }

lspconfig.csharp_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  init_options = { AutomaticWorkspaceInit = true },
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
