return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- Instead of replacing the plugin's options entirely,
    -- modify the existing options table
    opts = function(_, opts)
      -- Make sure ensure_installed exists.
      -- ensure_installed is typically a list of parser names
      -- that should be installed automatically
      opts.ensure_installed = opts.ensure_installed or {}

      -- ipairs iterates over both index and value.
      -- Here we don't care about the index
      for _, parser in ipairs { "javascript", "typescript", "tsx" } do
        -- If parser missing, add it to the end of the list
        if not vim.tbl_contains(opts.ensure_installed, parser) then
          table.insert(opts.ensure_installed, parser)
        end
      end
    end,
    config = function(_, opts)
      -- Keep Tree-sitter setup in a local module so the Neovim 0.12
      -- compatibility override can be removed cleanly once upstream fixes it.
      require("configs.treesitter").setup(opts)
    end,
  },

  {
    -- This plugin uses Tree-sitter to detect the language context at the cursor position
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- Controls when the plugin loads. This fires after a file has been read into a buffer
    event = "BufReadPost",
    -- This defines code to run after the plugin loads
    config = function()
      require("ts_context_commentstring").setup()
    end,
  },
}
