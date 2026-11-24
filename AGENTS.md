# Neovim Config (`~/.config/nvim`)

## Entrypoints

- `init.lua` -> `require("user")` -> `lua/user/init.lua`
- Plugin specs: `lua/user/lazy/*.lua` (one file per plugin/group)
- Custom plugin code: `lua/user/plugins/*.lua`
- Theme: `lua/user/themes/dark.lua` (active; base `lackluster-dark`)
- Colorschemes available but commented out: `lua/user/lazy/colors.lua`
- All other theme files in `lua/user/themes/` are dormant

## Plugin Manager

`lua/user/lazy_init.lua` bootstraps **lazy.nvim** (auto-clones if missing). Plugin specs are loaded from the `lua/user/lazy/` directory via `require("lazy").setup('user.lazy', ...)`.

## LSP / Tooling (Neovim 0.11+)

- Uses `vim.lsp.config()` + `vim.lsp.enable()` (not `lspconfig.Server.setup({})`)
- Auto-installs via mason: `lua_ls`, `pyright`, `clangd`
- Large-file guard: LSP disabled for files >1MB (`src/lsp.lua:43`)
- Format: `none-ls` (stylua, prettier, eslint_d) per `lua/user/lazy/none-ls.lua`
- Completion: **blink.cmp** (active via `lua/user/lazy/nvim-cmp.lua`); Rust native lib prebuilt at `lib/libblink_cmp_fuzzy.so`
- Debugger: DAP for Go (dlv) + Elixir (mix_task) per `lua/user/lazy/debugging.lua`

## Keymaps & Conventions

- `<leader>` = Space
- `<leader>;` sources `init.lua` + hint plugin config
- `<leader>tc` runs nearest test (neotest + vitest adapter)
- `<leader>ta` searches project for `#TODO/#NOTE/#BUG/#FIXME` via `:TodoAnnotations`
- `<leader>nv` / `:Td` opens per-project `Note.txt` in floating window
- `<A-n>` toggles per-project `HINT.md` scratchpad
- `<leader>zf` folds all functions via treesitter (manual fold method)
- `<space>b` = toggle breakpoint (DAP)
- `<F1>-<F5>` = DAP continue/step-into/step-over/step-out/step-back
- Filetype `.templ` registered for Go templating

## Debugging Config

- `vim.opt.verbose = 10` with log at `~/.cache/nvim/verbose.log`
- `R(name)` function in `lua/user/init.lua` hot-reloads lua modules via plenary
- `:Inspect` mapped to `<leader>ll`

## Unusual / Worth Knowing

- **Manual fold method**: `foldmethod=manual`, not `expr`. Treesitter folds created lazily via `<leader>zf`
- **cmdheight=0**, **laststatus=0** — no visible command line or statusline; uses Noice and Incline instead
- **blink.cmp** is the active completion engine; Rust native lib prebuilt at `lib/libblink_cmp_fuzzy.so`
- `ctermbidi` enabled for Arabic support
- Untracked per-project files that may be created: `HINT.md`, `Note.txt` (both project-root-relative, found via `package.json` search)
- Trailing whitespace stripped on save (`BufWritePre`)
- Treesitter disabled for files >200KB or >15K lines
