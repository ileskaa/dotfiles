local M = {}

function M.setup()
  local utils = require "ts_context_commentstring.utils"

  utils.is_treesitter_active = function(bufnr)
    local ok, parser = pcall(vim.treesitter.get_parser, bufnr or 0)
    return ok and parser ~= nil
  end

  require("ts_context_commentstring").setup()
end

return M
