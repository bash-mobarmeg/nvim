return {
  "bash-mobarmeg/rgx.nvim",
  config = function()
    require("rgx").setup({
      -- optional: override defaults here
    })

    -- Recommended keymap
    vim.keymap.set("n", "<leader>gr", function()
      require("rgx").open()
    end, { desc = "Rgx: Search regex in files" })
  end,
}

