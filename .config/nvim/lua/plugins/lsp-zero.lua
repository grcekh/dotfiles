local Plugin = { "VonHeikemen/lsp-zero.nvim" }

Plugin.pin = true

Plugin.branch = "v3.x"

Plugin.dependencies = {
  -- LSP Support
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
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
  -- Neovim
  {
    "folke/neodev.nvim",
    opts = {},
  },
}

Plugin.config = function()
  local lsp_zero = require("lsp-zero")
  local lspconfig = require("lspconfig")
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local cmp = require("cmp")

  lsp_zero.on_attach(function(client, bufnr)
    -- For available actions, see :help lsp-zero-keybindings
    lsp_zero.default_keymaps({ buffer = bufnr })
  end)

  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
  mason.setup({})
  mason_lspconfig.setup({
    ensure_installed = {
      "astro",
      "clangd",
      "cssls",
      "cssmodules_ls",
      "efm", -- General purpose server
      "eslint",
      "html",
      "jsonls",
      "lua_ls",
      "marksman",
      "pyright",
      "ruff_lsp",
      "rust_analyzer",
      "taplo", -- TOML
      "texlab",
      "tsserver",
      "yamlls",
    },
    handlers = {
      lsp_zero.default_setup,
      -- For mason-lspconfig, configure a language server by adding a handler:
      -- Assign a function in the handler, and configure the server within the function.
      lua_ls = function()
        local lua_opts = lsp_zero.nvim_lua_ls()
        lspconfig.lua_ls.setup(lua_opts)
      end,
    },
  })

  cmp.setup({
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
      -- Scroll up and down the documentation window
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "path" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip", keyword_length = 2 },
      { name = "buffer", keyword_length = 3 },
      { name = "neorg" },
    }),
  })

  lsp_zero.format_on_save({
    format_opts = {
      async = false,
      timeout_ms = 10000,
    },
    servers = {
      ["efm"] = {
        -- "astro",
        -- "css",
        -- "graphql",
        -- "html",
        -- "javascript",
        -- "javascriptreact",
        -- "json",
        -- "lua",
        -- "python",
        -- "sass",
        -- "scss",
        -- "typescript",
        -- "typescriptreact",
      },
    },
  })

  lsp_zero.set_sign_icons({
    error = "×",
    warn = "▲",
    hint = "⚑",
    info = "»",
  })

  -- (Optional) Configure lua language server for neovim
  lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

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
  local stylua = require("efmls-configs.formatters.stylua")

  -- Manually handle Python virtual environment executables,
  -- as efmls-configs does not yet support venv tooling.
  local function get_venv_exec(name, args)
    local current_working_dir = vim.loop.cwd()
    local venv_dir = ".venv"
    local binpath =
      string.format("%s/%s/bin/%s", current_working_dir, venv_dir, name)
    if vim.fn.filereadable(binpath) == 1 then
      return string.format("%s %s -", binpath, args or "")
    else
      return nil
    end
  end

  local function custom_python_formatter(formatter, args)
    local venv_command = get_venv_exec(formatter, args)
    if venv_command then
      return {
        formatCommand = venv_command,
        formatStdin = true,
        rootMarkers = { "pyproject.toml", "setup.py", "requirements.txt" },
      }
    else
      -- Fallback to the original formatter config from efmls-configs
      return require(string.format("efmls-configs.formatters.%s", formatter))
    end
  end

  local languages = {
    css = { prettier },
    html = { prettier },
    javascript = { prettier },
    javascriptreact = { prettier },
    json = { prettier },
    lua = { stylua },
    python = {
      custom_python_formatter("black", "--no-color -q"),
      custom_python_formatter(
        "ruff",
        "check --fix-only --no-cache --stdin-filename '${INPUT}'"
      ),
    },
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
    on_attach = lsp_zero.on_attach,
    capabilities = lsp_zero.capabilities,
  }))

  lsp_zero.setup()
end

return Plugin
