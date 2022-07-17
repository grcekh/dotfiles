local opt = vim.opt
local nvim_create_augroups = require("utils").nvim_create_augroups

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local autoCommands = {
    -- other autocommands
    open_folds = {
        {"BufReadPost,FileReadPost", "*", "normal zR"}
    }
}

nvim_create_augroups(autoCommands)

require("nvim-treesitter.install").compilers = { "gcc-11" }

require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "c", "cpp", "css", "dart", "glsl", "go", "graphql", "html", "java", "javascript", "jsdoc", "json", "latex", "lua", "make", "norg", "php", "python", "regex", "ruby", "rust", "scss", "svelte", "tsx", "typescript", "vim", "vue" },
  highlight = {
    enable = true
  },
  indent = {
    enable = false,
  }
})
