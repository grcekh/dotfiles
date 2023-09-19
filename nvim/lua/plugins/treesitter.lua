local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.version = false

Plugin.build = function()
  require("nvim-treesitter.install").update({ with_sync = true })()
end

Plugin.event = { "BufReadPost", "BufNewFile" }

Plugin.config = function()
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    ensure_installed = {
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
      "lua",
      "luadoc",
      "make",
      "python",
      "rust",
      "scss",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return Plugin
