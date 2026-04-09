local M = {}

local aliases = {
  ex = "elixir",
  pl = "perl",
  sh = "bash",
  ts = "typescript",
  uxn = "uxntal",
}

function M.setup(opts)
  if vim.fn.has "nvim-0.12" == 1 then
    require "nvim-treesitter.query_predicates"

    local query = require "vim.treesitter.query"

    query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
      local node = match[pred[2]]

      -- Neovim 0.12 passes capture matches as node lists here.
      if type(node) == "table" then
        node = node[1]
      end

      if not node then
        return
      end

      local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
      local parser = vim.filetype.match { filename = "a." .. injection_alias }

      metadata["injection.language"] = parser or aliases[injection_alias] or injection_alias
    end, { force = true })
  end

  require("nvim-treesitter.configs").setup(opts)
end

return M
