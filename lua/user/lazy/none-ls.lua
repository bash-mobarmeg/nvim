return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "mason.nvim",
    "nvimtools/none-ls-extras.nvim", -- required for eslint_d and other extras
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      name = "none-ls",
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- JS/TS formatting
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript", "typescript",
            "javascriptreact", "typescriptreact",
            "css", "html", "json", "yaml", "markdown",
          },
        }),

        -- JS/TS linting (requires none-ls-extras.nvim)
        require("none-ls.diagnostics.eslint_d"),

        -- Spell completion
        null_ls.builtins.completion.spell,
      },
    })
  end,
}
