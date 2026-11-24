return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" }, -- better than VeryLazy for reliability

  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("Treesitter not found!", vim.log.levels.ERROR)
      return
    end

    -- ==========================
    -- Large file protection
    -- ==========================
    local MAX_FILESIZE = 200 * 1024 -- 200 KB (adjust if needed)
    local MAX_LINES = 15000

    local function is_large_file(lang, buf)
      local name = vim.api.nvim_buf_get_name(buf)

      -- File size check
      if name ~= "" then
        local ok_stat, stats = pcall(vim.loop.fs_stat, name)
        if ok_stat and stats and stats.size > MAX_FILESIZE then
          return true
        end
      end

      -- Line count fallback
      local ok_lines, line_count = pcall(vim.api.nvim_buf_line_count, buf)
      if ok_lines and line_count > MAX_LINES then
        return true
      end

      return false
    end

    configs.setup({
      ensure_installed = {
        "vimdoc",
        "c",
        "lua",
        "bash",
        "http",
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        disable = is_large_file,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
        disable = is_large_file,
      },

      incremental_selection = {
        enable = true,
      },
    })

    -- ==========================
    -- Custom parser: templ
    -- ==========================
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.templ = {
      install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ.git",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "master",
      },
      filetype = "templ",
    }

    vim.treesitter.language.register("templ", "templ")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "json", "log" },
      callback = function()
        vim.treesitter.stop()
      end,
    })
  end,
}
