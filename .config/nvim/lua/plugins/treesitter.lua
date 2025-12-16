local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.build = function()
  require("nvim-treesitter.install").update({ with_sync = true })()
end

Plugin.event = { "BufReadPost", "BufNewFile" }

Plugin.config = function()
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    folds = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    sync_install = false,
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "diff",
      "dockerfile",
      "glsl",
      "go",
      "graphql",
      "html",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "latex",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rust",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
    },
  })
end

return Plugin
