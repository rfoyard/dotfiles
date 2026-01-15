-- disable inlay_hints and configure intelephense
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      intelephense = {
        init_options = {
          globalStoragePath = vim.fn.expand("~/.config/intelephense"),
          licenceKey = nil,
          clearCache = true,
        },
      },
    },
  },
}
