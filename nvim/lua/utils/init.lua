local vim = vim

local utils = {}
local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

function utils.t(cmd) -- termcodes
  -- Adjust the boolean arguments as needed
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

-- Function to create a list of commands and convert them to autocommands
-- https://github.com/norcalli/nvim_utils
function utils.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command("augroup " .. group_name)
    vim.api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command("augroup END")
  end
end

return utils