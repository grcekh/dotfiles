-------------
-- PLUGINS --
-------------

-- Check if packer is installed
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- Use { } when using a different branch of the plugin or loading the plugin with certain commands
vim.cmd("packadd packer.nvim")

 return require("packer").startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Core 
    use { "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" }
    use "/usr/local/opt/fzf"
    use "junegunn/fzf.vim"
    use { "neoclide/coc.nvim", branch = "release" }
    use "tpope/vim-commentary"
    use "tpope/vim-fugitive"
    use "junegunn/gv.vim"
    use "romgrk/barbar.nvim"
    use "itchyny/lightline.vim"
    use "mhinz/vim-startify"

    -- Syntax
    use "sheerun/vim-polyglot"
    use "norcalli/nvim-colorizer.lua"
    use "tmsvg/pear-tree"

    -- Productivity
    use "junegunn/goyo.vim"
    use "vimwiki/vimwiki"
    -- use "wellle/context.vim"
    use "nvim-lua/plenary.nvim"
    use "folke/todo-comments.nvim"

    -- Color schemes + icons
    use "sainnhe/gruvbox-material"
    use "ap/vim-css-color"
    use "ryanoasis/vim-devicons"
    use "kyazdani42/nvim-web-devicons"
 end)
