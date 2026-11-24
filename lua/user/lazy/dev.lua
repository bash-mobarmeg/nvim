return {
  {
    "Equilibris/nx.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts  = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },

    -- Plugin will load when you use these keys
    keys = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "nx actions"}
    },
  },

  {
    enabled = false,
    "rest-nvim/rest.nvim",
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = true,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = true,
        -- Stay in current window (.http file) or change to results window (default)
        stay_in_current_window_after_split = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- Toggle showing URL, HTTP info, headers at top of result window
          show_url = true,
          -- Show the generated curl command
          show_curl_command = true,
          show_http_info = true,
          show_headers = true,
          -- Table of curl `--write-out` variables or false if disabled
          show_statistics = true,
          -- Executables or functions for formatting response body
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },

  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    -- Color picker
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup()
    end
  },

  {
  "oysandvik94/curl.nvim",
  cmd = { "CurlOpen" },
  config = function()
    local curl = require("curl")
    curl.setup({})

    vim.keymap.set("n", "<leader>cc", function()
      curl.open_curl_tab()
    end, { desc = "Open a curl tab scoped to the current working directory" })

    vim.keymap.set("n", "<leader>co", function()
      curl.open_global_tab()
    end, { desc = "Open a curl tab with gloabl scope" })

    -- These commands will prompt you for a name for your collection
    vim.keymap.set("n", "<leader>csc", function()
      curl.create_scoped_collection()
    end, { desc = "Create or open a collection with a name from user input" })

    vim.keymap.set("n", "<leader>cgc", function()
      curl.create_global_collection()
    end, { desc = "Create or open a global collection with a name from user input" })

    -- vim.keymap.set("n", "<leader>fsc", function()
    --   curl.pick_scoped_collection()
    -- end, { desc = "Choose a scoped collection and open it" })
    --
    -- vim.keymap.set("n", "<leader>fgc", function()
    --   curl.pick_global_collection()
    -- end, { desc = "Choose a global collection and open it" })
    end,
  },

  {
    enabled = false,
    'tanvirtin/vgit.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    -- Lazy loading on 'VimEnter' event is necessary.
    event = 'VimEnter',
    config = function()
      require("vgit").setup()
    end,
  }
}
