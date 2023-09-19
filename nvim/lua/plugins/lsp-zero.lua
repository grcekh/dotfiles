local Plugin = { "VonHeikemen/lsp-zero.nvim" }

-- TODO: v3.x will become the default branch on September 20, 2023.
-- https://github.com/VonHeikemen/lsp-zero.nvim#future-changesdeprecation-notice
Plugin.branch = "v2.x"

Plugin.dependencies = {
  -- LSP Support
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Neovim
  {
    "folke/neodev.nvim",
    opts = {},
  },

  -- Formatting
  {
    "creativenull/efmls-configs-nvim",
    version = "v1.x.x",
  },

  -- LSP progress handler
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = {},
  },
}

Plugin.config = function()
  local lsp = require("lsp-zero").preset({})
  local lspconfig = require("lspconfig")

  lsp.on_attach(function(client, bufnr)
    -- :help lsp-zero-keybindings
    lsp.default_keymaps({ buffer = bufnr })
  end)

  -- TODO: glslls
  lsp.ensure_installed({
    "clangd",
    "cssls",
    "cssmodules_ls",
    "efm",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "tsserver",
  })

  lsp.format_on_save({
    format_opts = {
      async = false,
      timeout_ms = 10000,
    },
    servers = {
      ["efm"] = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "lua",
        "python",
        "sass",
        "scss",
        "typescript",
        "typescriptreact",
      },
    },
  })

  lsp.set_sign_icons({
    error = "×",
    warn = "▲",
    hint = "⚑",
    info = "»",
  })

  -- (Optional) Configure lua language server for neovim
  lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

  -- vscode-eslint-language-server provides an EslintFixAll command that can be
  -- used to format a document on save:
  lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  })

  -- Configure formatters per language
  local prettier = require("efmls-configs.formatters.prettier")
  local black = require("efmls-configs.formatters.black")
  local ruff = require("efmls-configs.formatters.ruff")
  local stylua = require("efmls-configs.formatters.stylua")
  local languages = {
    css = { prettier },
    html = { prettier },
    javascript = { prettier },
    javascriptreact = { prettier },
    json = { prettier },
    lua = { stylua },
    python = { ruff, black },
    sass = { prettier },
    scss = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
  }

  local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
      rootMarkers = { ".git/" },
      languages = languages,
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
    },
  }

  lspconfig.efm.setup(vim.tbl_extend("force", efmls_config, {
    -- Pass your custom lsp config below:
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
  }))

  lsp.setup()
end

return Plugin
