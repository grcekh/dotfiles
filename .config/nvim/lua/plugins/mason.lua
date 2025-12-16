return {
  "mason-org/mason-lspconfig.nvim",

  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✔︎",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    { "neovim/nvim-lspconfig" },
  },

  opts = {
    ensure_installed = {
      "astro",
      "clangd",
      "cssls",
      "cssmodules_ls",
      "efm", -- General purpose server
      "html",
      "jsonls",
      "lua_ls",
      "marksman",
      "pyright",
      "ruff",
      "rust_analyzer",
      "taplo", -- TOML
      "texlab",
      "ts_ls",
      "yamlls",
    },
  },
}
