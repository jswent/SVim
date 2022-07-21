return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "use" },
        disable = { "trailing-space", "lowercase-global", "different-requires" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
}
