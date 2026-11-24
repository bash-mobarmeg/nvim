return {
  "bash-mobarmeg/mograph.nvim",
  event = "VeryLazy", -- or lazy-load on a command/keymap if you prefer
  config = function()
    require("mograph").setup({
      data_dir = ".mograph",
      data_file = "connections.json",

      storage = {
        mode = "global",
        global_path = vim.fn.stdpath("data") .. "/mograph/connections.json",
      },

      -- Files/directories that mark the workspace root, searched upward from cwd.
      workspace_markers = { ".mograph", ".git" },

      signs = {
        enabled = true,
        single = "→",
        multiple = "⇉",
        unresolved = "⨯",
        sign_hl = "DiagnosticInfo",
        sign_hl_multi = "DiagnosticWarn",
        sign_hl_unresolved = "DiagnosticError",
      },

      keymaps = {
        enabled = true,
        create = "<leader>mc",
        add = "<leader>ma",
        list_current = "<leader>ml",
        list_all = "<leader>mg",
        remove = "<leader>md",
        next = "<leader>mn",
        previous = "<leader>mp",
      },

      ui = {
        float_border = "rounded",
      },
    })
  end,
}
