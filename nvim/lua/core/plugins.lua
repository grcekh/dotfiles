-------------
-- PLUGINS --
-------------

-- Check if packer is installed
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
vim.cmd("packadd packer.nvim")

local use = require("packer").use;

return require("packer").startup(function()
   -- Packer can manage itself
   use "wbthomason/packer.nvim"

   -- Core 
   use {
      "kyazdani42/nvim-tree.lua",
      cmd = {"NvimTreeToggle", "NvimTreeOpen"},
      requires = "kyazdani42/nvim-web-devicons",
      -- FIX: Both plugin and config are not loaded
      -- config = function() require("config/nvim-tree") end,
   }
   use { "neoclide/coc.nvim", branch = "release" }
   use "tpope/vim-commentary"
   use "tpope/vim-fugitive"
   use "glepnir/dashboard-nvim"
   use "romgrk/barbar.nvim"
   use {
      "glepnir/galaxyline.nvim",
      branch = 'main',
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = function() require("config/galaxyline") end,
   }
   use {
      "nvim-telescope/telescope.nvim",
      requires = { {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"} }
   }

   -- Syntax
   use "tikhomirov/vim-glsl"
   use "glench/vim-jinja2-syntax"
   use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function() require("config/treesitter") end
   }
   use {
      "windwp/nvim-autopairs",
      config = function()
         require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt" },
         })
      end
   }
   use {
      "norcalli/nvim-colorizer.lua",
      config = function()
         require("colorizer").setup(
            {"*";},
            { RRGGBBAA = true, css = true }
         )
      end
   }

   -- Productivity
   -- use "wellle/context.vim" -- FIX: context.vim install breaks
   use "junegunn/goyo.vim"
   use "vimwiki/vimwiki"
   use {
      "iamcco/markdown-preview.nvim",
      run = "cd app & yarn install"
   }
   use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup({}) end
   }

   -- Colorschemes + icons
   use "sainnhe/gruvbox-material"
   use "arcticicestudio/nord-vim"
end)
