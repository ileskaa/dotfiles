require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportUnknownMemberType = "none",
        },
      },
    },
  },
})

local servers = { "html", "cssls", "clangd", "ts_ls", "basedpyright" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
