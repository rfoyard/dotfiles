local M = {}

---@class opencodeItem
---@field name string
---@field command string
---@field description string
---@field type string
---@field submit boolean|true

---
---@param items opencode.select.Opts Override configured options for this call.
function M.opencode_pick(items)
  -- Build Snacks items:
  local picker_items = vim.tbl_map(function(it)
    return {
      -- what the matcher filters on:
      text = table.concat({ it.name or "", it.description or "", it.command or "" }, "  "),
      -- what we display (we’ll format these):
      name = it.name,
      desc = it.description,
      -- keep the command available but hidden:
      command = it.command,
      -- type can be ask or prompt
      type = it.type or "prompt",
      -- don't submit ask type by default
      submit = it.submit or false,
    }
  end, items)

  -- 2-column formatter: left = name, right = description
  local function format(item, _picker)
    local left = item.name or ""
    local right = item.desc or ""
    -- fixed left column width (tweak to taste)
    local left_w = 28
    local left_pad = left
    local w = vim.fn.strdisplaywidth(left)
    if w < left_w then
      left_pad = left .. string.rep(" ", left_w - w)
    else
      -- truncate if too long
      left_pad = vim.fn.strcharpart(left, 0, left_w - 1) .. "…"
    end
    -- returning a “segments” list is the common Snacks formatter shape
    return {
      { left_pad, "SnacksPickerLabel" },
      { "  ", nil },
      { right, "SnacksPickerComment" },
    }
  end

  Snacks.picker({
    title = "OpenCode",
    items = picker_items,
    format = format,
    -- (Snacks sources use `layout.preview = false` in places like explorer) :contentReference[oaicite:2]{index=2}
    layout = { preset = "select", preview = false },
    -- Run the hidden command on confirm:
    confirm = function(picker, item)
      picker:close()
      if item and item.command then
        if item.type == "prompt" and item.command ~= "" then
          require("opencode").prompt(item.command)
        elseif item.type == "ask" then
          require("opencode").ask(item.command, { submit = item.submit })
        end
      end
    end,
  })
end

return M
