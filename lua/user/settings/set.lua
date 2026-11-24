-----------------------------------------------------------
-- ⚙️  Neovim Core Settings — Clean & Modern Setup
-- Author: You
-- Style: Minimal / Fast / Aesthetic
-----------------------------------------------------------

-- 📝  LOGGING
vim.opt.verbose = 10
vim.opt.verbosefile = vim.fn.expand("~/.cache/nvim/verbose.log")


-- Explicit clipboard keymaps (<leader>y / <leader>Y / <leader>d) handle clipboard; avoids Kitty permission prompts
vim.o.winborder = "rounded"
vim.o.breakindent = true
vim.o.previewheight = 8
vim.o.linebreak = true
vim.opt.shortmess:append("cI") -- 'c' hides completion messages, 'I' hides the intro screen

-- Arabic support
vim.o.termbidi = true

-----------------------------------------------------------
-- 🧭  BASIC UI
-----------------------------------------------------------
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide command-line unless typing
vim.o.cmdheight = 1
vim.opt.laststatus = 0 -- Hide global statusline

-- Custom tabline
vim.o.showtabline = 2 -- Always show tabline
vim.o.tabline = "%!v:lua.MyTabLine()"


-- ─────────────────────────────────────────────
-- 🌐  Netrw (fallback file browser)
-- ─────────────────────────────────────────────
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


-----------------------------------------------------------
-- 🧱  INDENTATION & TABS
-----------------------------------------------------------
vim.opt.tabstop = 2         -- A <Tab> counts for 4 spaces
vim.opt.softtabstop = 2     -- Tab spacing in insert mode
vim.opt.shiftwidth = 2      -- Indent amount
vim.opt.expandtab = true    -- Convert tabs to spaces
vim.opt.smartindent = true  -- Smart autoindent


-----------------------------------------------------------
-- 📜  FILES & UNDO
-----------------------------------------------------------
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


-----------------------------------------------------------
-- 🔍  SEARCH
-----------------------------------------------------------
vim.opt.hlsearch = false    -- Don’t highlight all matches
vim.opt.incsearch = true    -- Incremental search


-----------------------------------------------------------
-- 🎨  UI TWEAKS
-----------------------------------------------------------
vim.opt.termguicolors = true         -- True color support
vim.opt.scrolloff = 8                -- Keep 8 lines visible
vim.opt.signcolumn = "yes"           -- Always show sign column
vim.opt.isfname:append("@-@")        -- Allow @ in filenames
vim.opt.updatetime = 50             -- Faster updates was 50
vim.opt.synmaxcol = 300
vim.opt.redrawtime = 1500

-- Wrapping & invisible characters
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars:append("eol:↴")  -- ⤹ ⤸ ⤴  ⤵  ⤶  ↫  ↴  ⮐   ↩   ↷   ⃕  ↲


-----------------------------------------------------------
-- 🗂️  FOLDING
-----------------------------------------------------------
vim.o.signcolumn = "yes"     -- Always show sign column
vim.o.foldcolumn = '0' -- Disable default foldcolumn
vim.o.foldlevel = 99         -- Open all folds by default
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.statuscolumn = " %s%C%l " -- Example layout: sign, custom fold, line number

-- Hide end-of-buffer tildes and customize folds
vim.opt.fillchars = {
  foldopen = '▾',  -- Icon for open fold
  foldclose = '▸', -- Icon for closed fold
  fold = ' ',
  foldsep = ' ',
  eob = ' ',       -- Blank out ~ lines
}


-----------------------------------------------------------
-- 💻  PERFORMANCE & FILE NAVIGATION
-----------------------------------------------------------
vim.opt.wildignore:append({
  "*/target/*",
  "*/dist/*",
  "*/build/*",
  "*/.logs/*",
  "*/node_modules/*",
  "*/venv/*",
}) -- Ignore build folders


-----------------------------------------------------------
-- 🧩  OPTIONAL SETTINGS
-----------------------------------------------------------
-- vim.o.conceallevel = 2     -- Hide concealable syntax like Markdown ``
-- vim.o.concealcursor = 'nc' -- Conceal in normal + command modes only
-- vim.opt.guifont = "Victor Mono" -- For Neovide / GUIs

-----------------------------------------------------------
-- ✅  Config Loaded
-----------------------------------------------------------

vim.opt.foldmethod = "manual" -- expr
vim.opt.foldtext = "v:lua.custom_foldtext()"

-- vim.opt.foldmethod = "expr" -- expr
-- vim.opt.foldtext = "v:lua.custom_foldtext()"
-- vim.opt.formatexpr = "v:lua.require'user.utils.fold'.formatexpr()"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.require('nvim-treesitter').foldexpr()"
