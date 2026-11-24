-- Load core modules

require("user.globals")
require("user.settings.set")
require("user.settings.remap")

require("user.lazy_init")
require("user.lazy")

-- Custom themes
-- require("user.themes.emac_theme")
-- require("user.themes.cooler_theme")
require("user.themes.dark")
-- require("user.themes.flat")
-- require("user.themes.simple")

-- Custom plugins
require("user.plugins.cursor")
require("user.plugins.tabs")
require("user.plugins.floattodo")
require("user.plugins.note")
require("user.plugins.hint")

-- ─────────────────────────────────────────────
-- 🧩  Utility
-- ─────────────────────────────────────────────
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local user_group = augroup("TheUser", {})
local yank_group = augroup("HighlightYank", {})

-- Reload helper
function R(name)
  require("plenary.reload").reload_module(name)
end

-- ─────────────────────────────────────────────
-- 🗂️  Filetype associations
-- ─────────────────────────────────────────────
vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

-- ─────────────────────────────────────────────
-- ✨  Autocommands
-- ─────────────────────────────────────────────

-- Highlight text on yank
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- Remove trailing whitespace before save
autocmd("BufWritePre", {
  group = user_group,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

function _G.custom_foldtext()
  local start_line = vim.v.foldstart
  local end_line = math.min(vim.v.foldstart + 5, vim.v.foldend)

  -- Collect first few lines of the fold
  local lines = {}
  for i = start_line, end_line do
    table.insert(lines, vim.fn.getline(i))
  end

  local signature = table.concat(lines, " ")

  -- Clean indentation and extra spaces
  signature = signature:gsub("^%s+", "")
  signature = signature:gsub("%s+", " ")

  -- Try to extract function name (C style)
  local name = signature:match("([%w_]+)%s*%b()")

  local line_count = vim.v.foldend - vim.v.foldstart + 1

  if name then
    return "▶ " .. name .. "()  [" .. line_count .. " lines]"
  else
    -- fallback to first line if no match
    local first = vim.fn.getline(start_line):gsub("^%s*", "")
    return "▶ " .. first .. "  [" .. line_count .. " lines]"
  end
end

function _G.fold_function_under_cursor()
  local start_line = vim.fn.line(".")
  local max_line = vim.fn.line("$")

  local line = vim.fn.getline(start_line)

  if not line:match("function") and not line:match("%b()") then
    print("Cursor is not on a function definition")
    return
  end

  local open_braces = 0
  local seen_open = false
  local end_line = nil

  for i = start_line, max_line do
    local l = vim.fn.getline(i)

    local opens = select(2, l:gsub("{", ""))
    local closes = select(2, l:gsub("}", ""))

    if opens > 0 then
      seen_open = true
    end

    open_braces = open_braces + opens - closes

    if seen_open and open_braces == 0 then
      end_line = i
      break
    end
  end

  if end_line then
    -- Clear ALL manual folds in buffer
    vim.api.nvim_command("silent! zE")

    -- Create fresh fold
    vim.cmd(string.format("%d,%d fold", start_line, end_line))
  else
    print("Could not determine function end")
  end
end

vim.keymap.set("n", "zf", fold_function_under_cursor, { desc = "Fold function under cursor" })

