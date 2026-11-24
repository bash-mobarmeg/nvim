-----------------------------------------------------------
-- 🧭 Neovim Keymaps — Clean, Cool, and Organized
-- Author: You
-- Style: Minimal, Practical, with ✨ Personality
-----------------------------------------------------------

-- 🪄 Leader Key
vim.g.mapleader = " "


-----------------------------------------------------------
-- 🗂️ TAB MANAGEMENT
-----------------------------------------------------------
-- New tab
vim.keymap.set("n", "te", ":tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("i", "<Space>", "", {})

-----------------------------------------------------------
-- 💾 FILE OPERATIONS
-----------------------------------------------------------
-- Ctrl + S → Save file
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Source key configs quickly
vim.keymap.set("n", "<leader>;", function()
  vim.cmd("luafile $MYVIMRC")
  vim.cmd("source ~/.config/nvim/lua/user/plugins/hint.lua")
end, { desc = "Source config files" })

-- Source current file
-- vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source current file" })


-----------------------------------------------------------
-- 🪟 SPLITS & NAVIGATION
-----------------------------------------------------------
vim.keymap.set("n", "md", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", ";", "$", { desc = "Go to end of line" })


-----------------------------------------------------------
-- 🦀 RUST SPECIFIC (REST.nvim)
-----------------------------------------------------------
vim.keymap.set("n", "mr", "<cmd>Rest run<CR>", { desc = "Run Rust (Rest)" })
vim.keymap.set("n", "mcc", "<cmd>Rest cookies<CR>", { desc = "Load Rest cookies" })
vim.keymap.set("n", "<leader>ll", ":Inspect<CR>", { desc = "Inspect command" })

-- vim.keymap.set("n", "mcl", function()
--   local path = "/home/user/.local/share/nvim/rest-nvim.cookies"
--   vim.cmd(string.format("!echo '' > %s", path))
-- end, { desc = "Clear Rest cookies" })


-----------------------------------------------------------
-- 🧩 PLUGINS & TOOLS
-----------------------------------------------------------
-- 🎨 Color Picker (CCC.nvim)
vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Open Color Picker" })

-- 🧹 Format file (using null-ls / Prettier)
vim.keymap.set("n", "<leader>lf", function()
  if vim.bo.filetype == "rust" then
    vim.cmd("RustFmt")
    vim.cmd("w")
    return
  end

  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "none-ls" or client.name == "null-ls"
    end,
    async = true,
  })
end, { desc = "Format file" })

-- 🪶 Hop.nvim — quick navigation
vim.keymap.set("n", "<leader>hh", "<cmd>HopWord<CR>", { desc = "Hop to word" })
vim.keymap.set("n", "<leader>k", "<cmd>HopWord<CR>", { desc = "Hop to word (k)" })

-- 🖥️ Shell prompt
vim.keymap.set("n", "<C-c>", ":!", { desc = "Run shell command" })

-- 🔄 Restart LSP server
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })


-----------------------------------------------------------
-- 🔀 MOVEMENT ENHANCEMENTS
-----------------------------------------------------------
-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Join lines without moving cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Keep cursor centered during search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })


-----------------------------------------------------------
-- 📋 CLIPBOARD / DELETE / PASTE
-----------------------------------------------------------
-- Paste without overwriting default register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete without affecting registers
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })


-----------------------------------------------------------
-- ⚙️ MISC
-----------------------------------------------------------
-- Ctrl + C → exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

-- Disable Ex mode (Q)
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

-- Smart word replace
vim.keymap.set("n", "<leader>s",
  [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]],
  { desc = "Substitute word under cursor" })
-- vim.keymap.set("n", "<leader>s", ":IncRename ", { desc = "Substitute word under cursor" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })


-----------------------------------------------------------
-- 💤 OPTIONAL / REFERENCE (Commented)
-----------------------------------------------------------
-- Quickfix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Location list navigation
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-----------------------------------------------------------
-- ✅ Keymaps Loaded
-----------------------------------------------------------

local function is_function(node)
  local t = node:type()
  return t:match("function")
      or t:match("method")
      or t:match("function_definition")
      or t:match("function_declaration")
end

local function fold_functions(node)
  if is_function(node) then
    local start_row, _, end_row, _ = node:range()

    -- move cursor to function start
    vim.api.nvim_win_set_cursor(0, { start_row + 1, 0 })

    -- create manual fold
    vim.cmd("normal! zf" .. (end_row - start_row) .. "j")
  end

  for child in node:iter_children() do
    fold_functions(child)
  end
end

vim.keymap.set("n", "<leader>zf", function()
  -- IMPORTANT: manual folds only
  vim.opt.foldmethod = "manual"
  vim.cmd("normal! zE") -- clear existing folds

  local parser = vim.treesitter.get_parser(0)
  if not parser then return end

  local tree = parser:parse()[1]
  local root = tree:root()

  fold_functions(root)
end, { desc = "Fold only functions" })

vim.keymap.set("n", "<leader>zt", function()
  if vim.wo.foldlevel == 0 then
    vim.cmd("normal! zR")
  else
    vim.cmd("normal! zM")
  end
end)

