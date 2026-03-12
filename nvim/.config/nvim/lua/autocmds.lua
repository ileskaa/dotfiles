require "nvchad.autocmds"

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.h", "*.cpp" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
