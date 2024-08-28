-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

lspconfig.servers = {
  -- "lua_ls",
  "gopls",
}

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lspconfig.clangd.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         nvlsp.on_attach(client, bufnr)
--     end,
--     on_init = nvlsp.on_init,
--     capabilities = capabilities,
-- })

lspconfig.gopls.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
})

-- lspconfig.lua_ls.setup({
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--
--     settings = {
--         Lua = {
--             diagnostics = {
--                 enable = false, -- Disable all diagnostics from lua_ls
--                 -- globals = { "vim" },
--             },
--             workspace = {
--                 library = {
--                     vim.fn.expand("$VIMRUNTIME/lua"),
--                     vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
--                     vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
--                     vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
--                     "${3rd}/love2d/library",
--                 },
--                 maxPreload = 100000,
--                 preloadFileSize = 10000,
--             },
--         },
--     },
-- })

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
