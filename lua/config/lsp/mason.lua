local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "eslint",
  "html",
  "jdtls",
  "jsonls",
  "solc",
  "sumneko_lua",
  "tflint",
  "terraformls",
  "tsserver",
  "pyright",
  "yamlls",
  "bashls",
  "clangd",
  "rust_analyzer",
  "taplo",
  "zk@v0.10.1",
  "lemminx"
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do 
  opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "sumneko_lua" then
    local sumneko_opts = require "config.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "eslint" then
    local eslint_opts = require "config.lsp.settings.eslint"
    opts = vim.tbl_deep_extend("force", eslint_opts, opts)
  end
  
  if server == "pyright" then
    local pyright_opts = require "config.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "config.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server == "jdtls" then
    goto continue
  end
  
  lspconfig[server].setup(opts)
  ::continue::
end
