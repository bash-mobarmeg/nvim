return {
  enabled = false,
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'saghen/blink.lib',
  },

  version = "v0.*",

  build = function()
    require('blink.cmp').build():pwait()
  end,

  opts = {
    keymap = {
      preset = 'default',
      ["<CR>"] = { "select_and_accept", "fallback" },
  },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    signature = { enabled = true }
  },
}
