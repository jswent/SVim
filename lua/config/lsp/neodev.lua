local status_ok, neodev = pcall(require, "neodev")
if not status_ok then
  return
end

neodev.setup({
  library = {
    enabled = true,
    types = true,
    plugins = true,
  },
  setup_jsonls = true,
  lspconfig = true,
})
