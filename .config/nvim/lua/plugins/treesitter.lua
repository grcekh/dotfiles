local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.build = function()
  require("nvim-treesitter.install").update({ with_sync = true })()
end

Plugin.event = { "BufReadPost", "BufNewFile" }

Plugin.config = function()
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    ensure_installed = {
      "astro",
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "dockerfile",
      "glsl",
      "go",
      "graphql",
      "html",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "latex",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "norg",
      "python",
      "rust",
      "scss",
      "swift",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return Plugin
