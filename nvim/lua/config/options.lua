-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.relativenumber = false
opt.clipboard = ""

-- vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
-- disable root detection set to just "cwd"
vim.g.root_spec = { "cwd" }

vim.g.mapleader = " "
vim.g.maplocalleader = "@"

-- use intelephense instead of phpactor
vim.g.lazyvim_php_lsp = "intelephense"

-- make sure the selected line is visible in snacks' picker
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#3b4261" })
  end,
})
