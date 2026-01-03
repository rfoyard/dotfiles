return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "savq/melange-nvim" },
  { "rebelot/kanagawa.nvim" },

  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").load({
        cursorline = {
          blend = 0.6,
        },
        telescope = {
          style = "classic",
        },
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
}
