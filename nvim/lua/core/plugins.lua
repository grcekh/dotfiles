-------------
-- PLUGINS --
-------------

-- Check if packer is installed
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- Use { } when using a different branch of the plugin or loading the plugin with certain commands
vim.cmd("packadd packer.nvim")

 return require("packer").startup(
  function()
    use "tpope/vim-commentary"
  end
 )
