-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- make sure all <C-w> window commands work in terminal mode
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true })
