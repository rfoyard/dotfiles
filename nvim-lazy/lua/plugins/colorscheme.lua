return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "savq/melange-nvim" },
  { "rebelot/kanagawa.nvim" },
  { "AlexvZyl/nordic.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
}
