-------------
-- PLUGINS --
-------------

-- Bootstrap lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call to avoid erroring out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.opts = {
  checker = {
    enabled = true,
  },
}

lazy.setup({
  { import = "plugins" },
})

-- Automatically back up lazy.nvim lockfiles
vim.api.nvim_create_autocmd("User", {
  pattern = "LazySync",
  callback = function()
    local uv = vim.loop
    local config = vim.fn.stdpath("config")
    local dotfiles = os.getenv("HOME") .. "/dotfiles/.config/nvim"

    local NUM_BACKUPS = 5
    local LOCKFILES_DIR_REAL = string.format("%s/lockfiles/", dotfiles)
    local LOCKFILES_DIR_LINK = string.format("%s/lockfiles/", config)

    -- Create directory for lockfiles in the real path if it does not exist
    if not uv.fs_stat(LOCKFILES_DIR_REAL) then
      uv.fs_mkdir(LOCKFILES_DIR_REAL, 448)
    end

    -- Create a symbolic link from the real path to the link path
    if not uv.fs_stat(LOCKFILES_DIR_LINK) then
      vim.fn.system({ "ln", "-s", LOCKFILES_DIR_REAL, LOCKFILES_DIR_LINK })
    end

    local lockfile = require("lazy.core.config").options.lockfile
    if uv.fs_stat(lockfile) then
      -- Create "%Y%m%d_%H:%M:%s_lazy-lock.json" in lockfile folder
      local filename =
        string.format("%s_lazy-lock.json", os.date("%Y%m%d_%H:%M:%S"))
      local backup_lockfile =
        string.format("%s/%s", LOCKFILES_DIR_REAL, filename)
      local success = uv.fs_copyfile(lockfile, backup_lockfile)

      if not success then
        vim.notify(
          string.format("Failed to create backup of lockfile."),
          vim.log.levels.ERROR,
          { title = "lazy.nvim " }
        )
        return
      end

      -- Clean up backups which exceed `NUM_BACKUPS`
      local iter_dir = uv.fs_scandir(LOCKFILES_DIR_REAL)

      if iter_dir then
        local backups = {}
        local suffix = "lazy-lock.json"

        while true do
          local name = uv.fs_scandir_next(iter_dir)
          -- Make sure we are deleting lockfiles
          if name and name:sub(-#suffix, -1) == suffix then
            table.insert(
              backups,
              string.format("%s/%s", LOCKFILES_DIR_REAL, name)
            )
          end

          if name == nil then
            break
          end

          -- Sort backups and remove oldest first
          table.sort(backups)
          while #backups > NUM_BACKUPS do
            uv.fs_unlink(table.remove(backups, 1))
          end
        end
      end

      vim.notify(
        string.format("Successfully created backup: %s.", filename),
        vim.log.levels.INFO,
        { title = "lazy.nvim" }
      )
    end
  end,
})
