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

-- More recent ts language server
vim.lsp.config("vtsls", {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
  },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})

vim.lsp.config("vue_ls", {
  on_init = function(client)
    client.handlers["tsserver/request"] = function(_, result, context)
      local ts_client = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })[1]
      if not ts_client then
        vim.notify("vtsls not found for vue_ls", vim.log.levels.ERROR)
        return
      end

      local id, command, payload = unpack(result[1])
      ts_client:exec_cmd({
        title = "vue_request_forward",
        command = "typescript.tsserverRequest",
        arguments = { command, payload },
      }, { bufnr = context.bufnr }, function(_, r)
        client:notify("tsserver/response", { { id, r and r.body } })
      end)
    end
  end,
})

local servers = { "html", "cssls", "clangd", "vtsls", "vue_ls", "basedpyright" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
