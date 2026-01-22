return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim" },
    },
    -- Keep the 'config' block only for side-effects like setting vim options
    config = function(_, opts)
      vim.g.opencode_opts = {
        provider = { enabled = false },
        events = {
          enabled = true,
          reload = true,
          permissions = {
            enabled = false,
          },
        },
      }
      -- Required side effects
      vim.o.autoread = true
    end,
    -- Keymaps
    keys = {
      { "<leader>a", "", desc = "OpenCode", mode = { "n", "v" } },
      { "<leader>aa", function() require("opencode").ask("", { submit = true }) end, mode = { "n", "x" }, desc = "Ask Opencode" },
      { "<leader>at", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "Ask Opencode @this" },
      { "<leader>ab", function() return require("opencode").operator("@buffer ") .. "_" end, mode = { "n", "x" }, desc = "Send Buffer", expr = true },
      { "<leader>as", function() return require("opencode").operator("@this ") .. "_" end, mode = { "n", "x" }, desc = "Send Selection", expr = true },
      -- commands related keymaps
      { "<leader>a<tab>", function() require("opencode").command("agent.cycle") end, mode = { "n", "v" }, desc = "Cycle Agent" },
      { "<leader>a<enter>", function() require("opencode").command("prompt.submit") end, mode = { "n", "v" }, desc = "Submit Prompt" },
      { "<leader>a<esc>", function() require("opencode").command("prompt.clear") end, mode = { "n", "v" }, desc = "Clear Prompt" },
      {
        "<leader>ap",
        function()
          require("lib.opencode_picker").opencode_pick({
            { name = "Ask", command = "", description = "Ask OpenCode", type = "ask", submit = true, },
            { name = "Ask @this", command = "@this: ", description = "Ask OpenCode about this", type = "ask", submit = true, },
            { name = "Current selection", command = "@this ", description = "Send the visual selection or the current line to OpenCode", type = "prompt", },
            { name = "Current buffer", command = "@buffer ", description = "Send the current buffer to OpenCode", type = "prompt", },
            { name = "Open buffers", command = "@buffers ", description = "Send all the opened buffers to OpenCode", type = "prompt", },
            { name = "Diagnostics", command = "@diagnostics ", description = "Send the diagnostics messages to OpenCode", type = "prompt", },
          })
        end,
        mode = { "n", "v" },
        desc = "Select Prompt",
      },
    },
  },
}
