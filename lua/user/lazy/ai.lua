return {
  {
    "sudo-tee/opencode.nvim",
    config = function()
      require("opencode").setup({})

      vim.api.nvim_set_hl(0, 'OpencodeBackground', { bg = '#000000' })
      vim.api.nvim_set_hl(0, 'OpencodeBorder', { bg = '#000000', fg = '#616161' })
    end,
    dependencies = {
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { 'markdown', 'opencode_output' },
        },
        ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
      },
      -- Optional, for file mentions and commands completion, pick only one
      'saghen/blink.cmp',
      -- 'hrsh7th/nvim-cmp',

      -- Optional, for file mentions picker, pick only one
      'folke/snacks.nvim',
      -- 'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
      -- 'nvim_mini/mini.nvim',
    },
  },

  {
    "monkoose/neocodeium",
    keys = {
      {
        "<A-f>",
        function()
          require("neocodeium").accept()
        end,
        mode = "i",
        desc = "Accept NeoCodeium suggestion",
      },
      {
        "<A-]>",
        function()
          require("neocodeium").next()
        end,
        mode = "i",
        desc = "Next NeoCodeium suggestion",
      },
      {
        "<A-[>",
        function()
          require("neocodeium").previous()
        end,
        mode = "i",
        desc = "Previous NeoCodeium suggestion",
      },
    },
    config = function()
      local neocodeium = require("neocodeium")
      local ok, blink = pcall(require, "blink.cmp")

      neocodeium.setup({
        filter = function(bufnr)
          local name = vim.api.nvim_buf_get_name(bufnr)

          if vim.endswith(name, ".env") then
            return false
          end

          if vim.bo[bufnr].buftype ~= "" then
            return false
          end

          if ok and blink.is_visible() then
            return false
          end

          -- return not cmp.visible()
          return true
        end,
      })

      neocodeium.start()
    end,
  },
}

