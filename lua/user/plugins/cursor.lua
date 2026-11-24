-- ╭──────────────────────────────────────────────────────────────╮
-- │ ✨ Cursor Style & Color Configuration                        │
-- ╰──────────────────────────────────────────────────────────────╯

-- Cursor shape per mode
vim.opt.guicursor = {
  "n-v-c:block-Cursor",
  "i:ver25-CursorInsert",
  "r:hor20-CursorReplace",
}

vim.opt.cursorline = true

-- 🎨 Cursor highlight setup
local function set_cursor_highlights()
  local cursor_colors = {
    -- Character under cursor
    Cursor        = { fg = MyColors.primary, bg = MyColors.cursor, bold = true },
    CursorInsert  = { fg = MyColors.primary, bg = MyColors.gold },
    CursorReplace = { fg = MyColors.primary, bg = MyColors.warn },

    -- Cursor line
    CursorLine    = { bg = MyColors.cursor_l },
    CursorLineNr  = { bg = "NONE", fg = MyColors.gold, bold = true },

    -- Matching brackets
    MatchParen = {
      fg = MyColors.gold,
      bg = MyColors.secondary,
      bold = true,
      underline = true,
    },

    -- Cursor icon
    CursorIcon = {
      bg = "NONE",
      fg = MyColors.gold,
    },
  }

  for group, style in pairs(cursor_colors) do
    vim.api.nvim_set_hl(0, group, style)
  end
end

-- Apply highlights immediately
set_cursor_highlights()

-- Reapply whenever colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_cursor_highlights,
})

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 🧭 Static Cursor Icon                                         │
-- ╰──────────────────────────────────────────────────────────────╯

-- vim.fn.sign_define("StaticCursor", {
--   text = "»",
--   texthl = "CursorIcon",
--   numhl = "",
-- })

local last_line = nil

local function update_icon()
  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_win_get_cursor(0)[1]

  -- Remove previous sign
  if last_line ~= nil then
    pcall(vim.fn.sign_unplace, "static_cursor_group", {
      buffer = bufnr,
    })
  end

  -- Place new sign
  -- vim.fn.sign_place(
  --   1,
  --   "static_cursor_group",
  --   "StaticCursor",
  --   bufnr,
  --   { lnum = line, priority = 20 }
  -- )

  -- last_line = line
end

vim.api.nvim_create_autocmd(
  { "CursorMoved", "CursorMovedI" },
  { callback = update_icon }
)

update_icon()

