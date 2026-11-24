return {
  -- Mason
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
      })
    end,
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },

  -- LSP (Neovim 0.11+ style)
  {
    "neovim/nvim-lspconfig",
    dependencies = 'saghen/blink.cmp',
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      -- local capabilities = require("blink.cmp").get_lsp_capabilities();
      -- require("lspconfig").lua_ls.setup { capabilities = capabilities }

      --------------------------------------------------
      -- Large file guard
      --------------------------------------------------
      local MAX = 1024 * 1024 -- 1MB

      local function is_big(buf)
        local name = vim.api.nvim_buf_get_name(buf)
        if name ~= "" then
          local stat = vim.loop.fs_stat(name)
          if stat and stat.size > MAX then
            return true
          end
        end
        return false
      end

      --------------------------------------------------
      -- LspAttach
      --------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_global", { clear = true }), -- FIXED: prevents duplicate firing
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if not client or is_big(bufnr) then
            if client then client.stop() end
            return
          end

          local opts = { buffer = bufnr }

          -- Keymaps
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          -- Document highlight (guarded)
          if client.supports_method("textDocument/documentHighlight") then -- FIXED: supports_method is more reliable than server_capabilities
            local group = vim.api.nvim_create_augroup("lsp_highlight_" .. bufnr, { clear = true })

            vim.api.nvim_create_autocmd("CursorHold", {
              group = group,
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd("CursorMoved", {
              group = group,
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_set_hl(0, "LspReferenceText",  { bg = MyColors.secondary })
            vim.api.nvim_set_hl(0, "LspReferenceRead",  { bg = MyColors.secondary })
            vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = MyColors.secondary })
          end
        end,
      })

      --------------------------------------------------
      -- Hover border
      --------------------------------------------------
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "single",
          title = "hover",
        }
      )

      --------------------------------------------------
      -- Diagnostics
      --------------------------------------------------
      vim.diagnostic.config({
        update_in_insert = false,
        float = {
          border = "rounded",
        },
      })

      --------------------------------------------------
      -- LSP configs (Neovim 0.11+)
      --------------------------------------------------
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")
    end,
  },
}
