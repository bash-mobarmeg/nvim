return {
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    config = function()
      require("screenkey").setup({
          win_opts = {
              row = vim.o.lines - vim.o.cmdheight - 1,
              col = vim.o.columns - 1,
              relative = "editor",
              anchor = "SE",
              width = 10,
              height = 2,
              border = "none",
              title = "",
              title_pos = "center",
              style = "minimal",
              focusable = false,
              noautocmd = true,
          },
          hl_groups = {
              ["screenkey.hl.key"] = { link = "Normal" },
              ["screenkey.hl.map"] = { link = "Normal" },
              ["screenkey.hl.sep"] = { link = "Normal" },
          },
          winblend = 0,
          compress_after = 3,
          clear_after = 3,
          emit_events = true,
          disable = {
              filetypes = {},
              buftypes = {},
              modes = {},
          },
          show_leader = true,
          group_mappings = false,
          display_infront = {},
          display_behind = {},
          filter = function(keys)
              return keys
          end,
          colorize = function(keys)
              return keys
          end,
          separator = " ",
          keys = {
              ["<TAB>"] = "󰌒",
              ["<CR>"] = "󰌑",
              ["<ESC>"] = "Esc",
              ["<SPACE>"] = "␣",
              ["<BS>"] = "󰌥",
              ["<DEL>"] = "Del",
              ["<LEFT>"] = "",
              ["<RIGHT>"] = "",
              ["<UP>"] = "",
              ["<DOWN>"] = "",
              ["<HOME>"] = "Home",
              ["<END>"] = "End",
              ["<PAGEUP>"] = "PgUp",
              ["<PAGEDOWN>"] = "PgDn",
              ["<INSERT>"] = "Ins",
              ["<F1>"] = "󱊫",
              ["<F2>"] = "󱊬",
              ["<F3>"] = "󱊭",
              ["<F4>"] = "󱊮",
              ["<F5>"] = "󱊯",
              ["<F6>"] = "󱊰",
              ["<F7>"] = "󱊱",
              ["<F8>"] = "󱊲",
              ["<F9>"] = "󱊳",
              ["<F10>"] = "󱊴",
              ["<F11>"] = "󱊵",
              ["<F12>"] = "󱊶",
              ["CTRL"] = "Ctrl",
              ["ALT"] = "Alt",
              ["SUPER"] = "󰘳",
              ["<leader>"] = "<leader>",
          },
          notify_method = "echo",
          log = {
              min_level = vim.log.levels.OFF,
              filepath = vim.fn.stdpath("data") .. "/screenkey_log",
          },
      })
    end
  },
  {
    "jbyuki/venn.nvim",
    ft = { "markdown", "text" },

    keys = {
      {
        "<leader>vn",
        function()
          if not vim.b.venn_enabled then
            vim.notify("Venn Enabled")
            vim.b.venn_enabled = true
            vim.cmd("setlocal ve=all")

            vim.keymap.set("n", "J", "<C-v>j:VBox<CR>", { buffer = true })
            vim.keymap.set("n", "K", "<C-v>k:VBox<CR>", { buffer = true })
            vim.keymap.set("n", "L", "<C-v>l:VBox<CR>", { buffer = true })
            vim.keymap.set("n", "H", "<C-v>h:VBox<CR>", { buffer = true })

            vim.keymap.set("n", "<C-j>", "<C-v>j:VBoxD<CR>", { buffer = true })
            vim.keymap.set("n", "<C-k>", "<C-v>k:VBoxD<CR>", { buffer = true })
            vim.keymap.set("n", "<C-l>", "<C-v>l:VBoxD<CR>", { buffer = true })
            vim.keymap.set("n", "<C-h>", "<C-v>h:VBoxD<CR>", { buffer = true })

            vim.keymap.set("v", "f", ":VBox<CR>", { buffer = true })
          else
            vim.notify("Venn Disabled")
            vim.cmd("setlocal ve=")
            vim.cmd("mapclear <buffer>")
            vim.b.venn_enabled = nil
          end
        end,
        ft = { "markdown", "text" },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    enabled = vim.fn.executable("git") == 1,

    opts = {

      watch_gitdir = { interval = 1000, follow_files = true },
      current_line_blame = true,
      current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      word_diff = false,
      diff_opts = { internal = true },
      on_attach = function(_)
        local gs = package.loaded.gitsigns
        -- stylua: ignore start
        vim.keymap.set('n', ']g', function() gs.nav_hunk("last") end, { desc = 'Git: Last Hunk' })
        vim.keymap.set('n', '[g', function() gs.nav_hunk("first") end, { desc = 'Git : First Hunk' })
        vim.keymap.set({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = 'Git: Stage Hunk' })
        vim.keymap.set({ 'n', 'v' }, '<leader>ga', ':Gitsigns reset_hunk<CR>', { desc = 'Git: Reset Hunk' })
        vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { desc = 'Git: Reset Buffer' })
        vim.keymap.set('n', '<leader>gp', gs.preview_hunk_inline, { desc = 'Git: Preview Hunk Inline' })
        vim.keymap.set('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { desc = 'Git: Blame Line' })
        vim.keymap.set('n', '<leader>gd', gs.diffthis, { desc = 'Git: Diff This' })
      end,
    },
  },

  {
    enabled = false,
    "kevinhwang91/nvim-ufo",
    config = function()
      require("ufo").setup()
    end
  },

  {
    enabled = false,
    "yaocccc/nvim-foldsign",
    config = function()
      require('nvim-foldsign').setup({
        offset = -2,
        foldsigns = {
            open = '-',          -- mark the beginning of a fold
            close = '+',         -- show a closed fold
            -- seps = { '│', '┃' }, -- open fold middle marker
            seps = { '│', '│' }, -- open fold middle marker
        },
        enabled = true,
    })

    vim.api.nvim_set_hl(0, "FoldColumn", { fg = MyColors.fg, bg = "NONE" })
    end
  },

  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter" },
    config = true,
  },

  {
    "xiyaowong/transparent.nvim",
    config = function()
      local transparent = require("transparent")
      transparent.setup({
        auto = true,
        extra_groups = {
          "NormalFloat",
          "NvimTreeNormal",
        },
        -- exclude_groups = {
        --   "DiagnosticSignError",
        --   "DiagnosticSignWarn",
        --   "DiagnosticSignInfo",
        --   "DiagnosticSignHint"
        -- },
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            height = 0.95,
            vertical = {
              width = 0.90
            },
          },

          -- Ignore these patterns when searching
          file_ignore_patterns = {
            "^node_modules/",
            "^dist/",
            "^bak/",
            "^.git/",
            "venv/",
            "^target/",
            "^build/",
            "%.lock",
            "__pycache__",
          },
          file_browser = {
            theme = "ivy",
            -- disables netrw and uses telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {},
              ["n"] = {},
            },
          },
        },
      })

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>pws", function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)
      vim.keymap.set("n", "<leader>pWs", function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end,
  },

  {
    "declancm/cinnamon.nvim",
    version = "*",
    opts = {
      keymaps = {
        basic = false, -- Disable built-in mappings to avoid conflicts
        extra = false,
      },
      options = {
        mode = "cursor",
        delay = 5,
        step_size = {
          vertical = 1,
          horizontal = 2,
        },
        max_delta = {
          line = false,
          column = false,
          time = 1000,
        },
        callback = function()
          -- print("Scroll finished")
        end,
      },
    },
    keys = {
      -- Custom mappings
      { "<C-u>", '<cmd>lua require("cinnamon").scroll("15kzz")<cr>', mode = "n" },
      { "<C-y>", '<cmd>lua require("cinnamon").scroll("15jzz")<cr>', mode = "n" }, -- Scroll down 1 line
      { "<C-e>", '<cmd>lua require("cinnamon").scroll("1k")<cr>', mode = "n" }, -- Scroll up 1 line
      { "<C-d>", '<cmd>lua require("cinnamon").scroll("<C-d>zz")<cr>', mode = "n" },
      { "<C-b>", '<cmd>lua require("cinnamon").scroll("<C-b>zz")<cr>', mode = "n" },
      { "zt", '<cmd>lua require("cinnamon").scroll("zt")<cr>', mode = "n" },
      { "zz", '<cmd>lua require("cinnamon").scroll("zz")<cr>', mode = "n" },
      { "zb", '<cmd>lua require("cinnamon").scroll("zb")<cr>', mode = "n" },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*",     -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",

    dependencies = { "rafamadriz/friendly-snippets" },

    config = function()
      local ls = require("luasnip")
      ls.filetype_extend("javascript", { "jsdoc" })

      --- TODO: What is expand?
      vim.keymap.set({ "i" }, "<C-s>e", function() ls.expand() end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },

  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      -- vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE", fg = "#cdd6f4" })
      -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#89b4fa" })

      require("noice").setup({
        cmdline = {
          view = "cmdline_popup", -- floating popup
        },
        messages = {
          view = "mini", -- optional: minimal inline messages
        },
        presets = {
          bottom_search = true,
          command_palette = true,
        },
      })
    end,
  },

  -- √ 󰞁 ¶
  {
    "mg979/vim-visual-multi",
    config = function ()
    end
  },

  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>tt", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    window = {
      width = 120, -- width of the Zen window
      height = 1, -- height of the Zen window
    },
    keys = { { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      dashboard = { enabled = false },
    },
    keys = {},
  },

  {
    "rcarriga/nvim-notify",
    config = function ()
      require("notify").setup({
        -- Time before notification closes
        timeout = 2000,

        -- Maximum width of the notification window
        max_width = function()
          return math.floor(vim.o.columns * 0.7) -- 50% of screen width
        end,

        -- Where notifications appear
        top_down = false,  -- bottom to top

        -- Optional: Render stages ("slide", "fade_in_slide_out", "static")
        stages = "slide",

        -- Optional: border style
        border = "rounded",

        -- Optional: minimum width
        minimum_width = 20,
      })
    end
  },

  {
    enabled = false,
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", false },
      { "s", false },
      { "f", false },
      { "F", false },
      { "f",     mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "F",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- <leader>k for fingind words
  {
    'wsdjeg/hop.nvim',
    version = "*",
    opts = {
        keys = 'asdfjkl'
    }
  },

  {
    "j-hui/fidget.nvim",
    config = function ()
      local fidget = require("fidget")

      fidget.setup({
        notification = {
          window = {
            winblend = 0,               -- fully opaque
            border = "none", -- rounded
            normal_hl = "FidgetNormal", -- highlight group for background
            max_width = 50,             -- maximum width of the Fidget window
          },
        },
      })

      vim.api.nvim_set_hl(0, "FidgetNormal", { bg = MyColors.primary, fg = MyColors.fg }) -- Background and text color
    end
  },

  {
    "saecki/live-rename.nvim",
    config = function ()
      local live_rename = require("live-rename")

      -- The following are equivalent
      vim.keymap.set("n", "<leader>R", live_rename.rename,  { desc = "LSP rename" })
      vim.keymap.set("n", "<leader>R", live_rename.map(),   { desc = "LSP rename" })
      vim.keymap.set("n", "<leader>R", live_rename.map({}), { desc = "LSP rename" })

      -- The following are equivalent
      vim.keymap.set("n", "<leader>r", live_rename.map({ text = "", insert = true }), { desc = "LSP rename" })
      vim.keymap.set("n", "<leader>r", function() live_rename.rename({ text = "", insert = true }) end, { desc = "LSP rename" })
    end
  },

  {
    "utilyre/barbecue.nvim", -- VSCode like winbar
    enabled = false,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = 'nordic',
    },
    config = function()
      require("barbecue").setup({
        theme = {
            normal = { bg = MyColors.primary, fg = MyColors.fg },
        },
      })
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#2f231f" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#2f231f" })
        vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#2f231f" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#2f231f" })
        vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#2f231f" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#2f231f" })
        vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#2f231f" })
      end)

      require("ibl").setup {
        indent = {
          highlight = highlight,
          char = "┆"
        },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = {
          highlight = highlight,
          char = "│",
          -- show_start = true,
          -- show_end = true,
        },
      }

      vim.g.rainbow_delimiters = { highlight = highlight }
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      -- Disable Neovim's default virtual text to avoid duplication
      vim.diagnostic.config({ virtual_text = false })

      require("tiny-inline-diagnostic").setup({
        preset = "simple", -- Options: "minimal", "classic", "modern", "simple"

        opts = {
          -- Enable multiline diagnostic messages
          multilines = {
            enabled = true,
            always_show = false, -- Only show on cursor line by default
          },

          -- Show diagnostic count
          add_messages = {
            display_count = true,
          },

          -- Override the default float window behavior
          override_open_float = true,

          -- Show diagnostics immediately
          show_all_diagnostics = true,
        },

        -- Visual elements configuration
        signs = {
          left = "▎",
          right = "",
          diag = " ",
          arrow = "  ",
          up_arrow = "  ",
          vertical = " │",
          vertical_end = " ╰",
        },

        -- Transparency settings
        blend = {
          factor = 0.20,
          background = false,
        },

        -- Make cursorline transparent for better visibility
        transparent_cursorline = true,

        -- Highlight groups for different severities
        hi = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
          arrow = "NonText",
          background = "CursorLine",
          mixing_color = "Normal",
        },

        -- Per-severity customization
        severity = {
          [vim.diagnostic.severity.ERROR] = { sign = " ", hl = "DiagnosticError" },
          [vim.diagnostic.severity.WARN]  = { sign = " ", hl = "DiagnosticWarn" },
          [vim.diagnostic.severity.INFO]  = { sign = " ", hl = "DiagnosticInfo" },
          [vim.diagnostic.severity.HINT]  = { sign = " ", hl = "DiagnosticHint" },
        },

        -- Window configuration
        window = {
          padding = 2,
          margin = 1,
          border = "rounded",
        },
      })

      -- Custom highlight groups
      -- These should ideally be defined in your colorscheme
      -- but can be set here if MyColors is globally available
      if MyColors then
        local highlights = {
          -- Inline diagnostic highlights
          { "DiagnosticError", { bg = MyColors.primary, fg = MyColors.warn } },
          { "DiagnosticWarn",  { bg = MyColors.primary, fg = MyColors.yellow } },
          { "DiagnosticInfo",  { bg = MyColors.primary, fg = MyColors.gold } },
          { "DiagnosticHint",  { bg = MyColors.primary, fg = MyColors.hint } },

          -- Virtual text highlights
          { "DiagnosticVirtualTextError", { bg = MyColors.primary, fg = MyColors.warn } },
          { "DiagnosticVirtualTextWarn",  { bg = MyColors.primary, fg = MyColors.yellow } },
          { "DiagnosticVirtualTextInfo",  { bg = MyColors.primary, fg = MyColors.gold } },
          { "DiagnosticVirtualTextHint",  { bg = MyColors.primary, fg = MyColors.hint } },
        }

        for _, hl in ipairs(highlights) do
          vim.api.nvim_set_hl(0, hl[1], hl[2])
        end
      end

      -- Enable the plugin
      require("tiny-inline-diagnostic").enable()
    end,
  },

  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  -- Trouble.nvim
  -- A pretty diagnostics, references, telescope results, quickfix list
  -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      -- Diagnostic views
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Toggle diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Toggle buffer diagnostics (Trouble)",
      },

      -- Symbol and LSP views
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Toggle symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "Toggle LSP definitions/references (Trouble)",
      },

      -- Lists
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Toggle location list (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Toggle quickfix list (Trouble)",
      },

      -- Navigation
      {
        "[t",
        function()
          require("trouble").next({ skip_groups = true, jump = true })
        end,
        desc = "Next trouble item",
      },
      {
        "]t",
        function()
          require("trouble").prev({ skip_groups = true, jump = true })
        end,
        desc = "Previous trouble item",
      },
    },

    opts = {
      -- Use icons for better visual distinction
      icons = true,

      -- Don't auto-open/close trouble window
      auto_open = false,
      auto_close = false,

      -- Use diagnostic signs defined below
      use_diagnostic_signs = true,

      -- Mode configuration
      modes = {
        -- Enable symbols mode (uses tree-sitter or ctags)
        symbols = {
          desc = "Document symbols",
          mode = "lsp_document_symbols",
          focus = false,
          win = { position = "right" },
        },

        -- Custom mode for current buffer diagnostics
        buffer_diagnostics = {
          mode = "diagnostics",
          filter = { buf = 0 },
        },
      },

      -- Focus configuration
      focus = true,
      follow = true,
      restore = true,

      -- Window configuration
      win = {
        size = { height = 0.3 },
        border = "rounded",
      },
    },

    config = function(_, opts)
      require("trouble").setup(opts)

      -- Define diagnostic signs for the gutter
      local signs = {
        { name = "DiagnosticSignError", text = "┃" },
        { name = "DiagnosticSignWarn",  text = "┃" },
        { name = "DiagnosticSignInfo",  text = "┃" },
        { name = "DiagnosticSignHint",  text = "┃" },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
          text = sign.text,
          texthl = sign.name,
          numhl = ""
        })
      end

      -- Apply custom highlight groups
      if MyColors then
        local highlights = {
          { "DiagnosticSignError", { bg = MyColors.primary, fg = MyColors.warn } },
          { "DiagnosticSignWarn",  { bg = MyColors.primary, fg = MyColors.yellow } },
          { "DiagnosticSignInfo",  { bg = MyColors.primary, fg = MyColors.gold } },
          { "DiagnosticSignHint",  { bg = MyColors.primary, fg = MyColors.hint } },
          { "TroubleCode",         { bg = MyColors.primary, fg = MyColors.hint } },
        }

        for _, hl in ipairs(highlights) do
          vim.api.nvim_set_hl(0, hl[1], hl[2])
        end
      end
    end,
  },
}

