return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      -- use the lsp linter for these languages
      go = {},
      php = {},
    },
  },
}
