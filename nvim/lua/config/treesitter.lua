require("nvim-treesitter.configs").setup({
  ensure_installed = {"bash", "c", "cpp", "css", "dart", "glsl", "go", "graphql", "html", "java", "javascript", "jsdoc", "json", "latex", "lua", "make", "php", "python", "regex", "ruby", "rust", "scss", "svelte", "tsx", "typescript", "vim", "vue" },
  highlight = {
    enable = true
  },
  indent = {
    enable = false,
    -- disable = {"typescript", "python"}
  }
})
