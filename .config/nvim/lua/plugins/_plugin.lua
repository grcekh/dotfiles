--[[

NOTE: Any Lua module in ~/.config/nvim/lua/plugins/*.lua will be merged into
the final spec. See the full lazy.nvim plugin spec:
https://github.com/folke/lazy.nvim#-plugin-spec

--]]

local Plugin = {}

-- Remove this line to include the plugin in the final spec.
-- Plugin.enabled = false

-- A list of plugin names or plugin specs that should be loaded when the plugin
-- loads. Dependencies are always lazy-loaded unless specified otherwise.
-- When specifying a name, make sure the plugin spec has been defined somewhere else.
-- Plugin.dependencies = {}

-- When true, the plugin will only be loaded when needed. Lazy-loaded plugins
-- are automatically loaded when their Lua modules are required, or when one of
-- the lazy-loading handlers triggers
-- Plugin.lazy = true

-- Lazy load on event.
-- Plugin.event = {}

-- Lazy load on command.
-- Plugin.cmd = {}

-- Lazy load on filetype.
-- Plugin.ft = {}

-- Lazy load on keymap.
-- Plugin.keys = {}

-- Plugin.init functions are always executed during startup.
-- Plugin.init = function() end

-- Plugin.config is executed when the plugin loads. The default implementation will
-- automatically run `require(MAIN).setup(opts)`. Lazy uses several heuristics to
-- determine the plugin's MAIN module automatically based on the plugin's name.
-- To use the default implementation without Plugin.opts, set Plugin.config = true.
-- Plugin.config = function() end

-- Plugin.opts should be a table (will be merged with parent specs), return a table
-- (replaces parent specs) or should change a table. The table will be passed to
-- the Plugin.config() function. Setting this value will imply Plugin.config().
-- Plugin.opts = {}

return Plugin
