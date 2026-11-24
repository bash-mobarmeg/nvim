-----------------------------------------------------------
-- 🌈 NeoVim Cool Theme (Refined & Structured)
-- Author: You
-- Style: Muted Warm + Cold Mix (Artisan Gray Aesthetic)
-----------------------------------------------------------

-- #dfdcbc , #eeecec
-- 🎨 Palette ------------------------------------------------
local colors = {
    yellow      = "#764E2D",
    orange      = "#654124",
    blue        = "#48668e",
    blue_gray   = "#4e5660",
    red         = "#a36161",
    purple      = "#6b5971",
    green       = "#708146",
    cyan        = "#3E5452",
    gray        = "#221b18",
    brown       = "#514d4a",
    light_gray  = "#392f2a",
    faint_gray  = "#29221e",
    dark_white  = "#695c53",
    black       = "#161311",
    linenr      = "#392f2a",
    white       = "#717171",
    ui_text     = "#656565",
    ui_text_rev = "#161311",
    comment     = "#372d2d",
    string      = "#5c5a56",
}




-----------------------------------------------------------
-- 🪄 Highlight Groups
-----------------------------------------------------------
local highlights = {

  ---------------------------------------------------------
  -- 🧱 Base UI
  ---------------------------------------------------------
  ["Normal"]             = { fg = colors.ui_text, bg = MyColors.primary },
  ["OpencodeBackground"] = { fg = colors.ui_text, bg = '#000000' },
  ["NormalFloat"]        = { fg = colors.ui_text, bg = 'NONE' },
  ["NonText"]            = { fg = "#2b2420", bold = false },

  ["LineNr"]          = { fg = colors.yellow,  bg = MyColors.secondary, bold = true },
  ["LineNrAbove"]     = { fg = colors.ui_text, bg = MyColors.primary },
  ["LineNrBelow"]     = { fg = colors.ui_text, bg = MyColors.primary },

  ["Float"]           = { bg = "NONE",  fg = colors.red },
  ["FloatBorder"]     = { bg = MyColors.primary,  fg = colors.ui_text },
  ["Notification"]    = { bg = MyColors.primary,  fg = colors.ui_text },
  ["NoiceFormatKind"] = { bg = MyColors.primary,  fg = colors.ui_text },
  ["Visual"]          = { bg = colors.ui_text, fg = colors.black },

  ---------------------------------------------------------
  -- Noise
  ---------------------------------------------------------
  ["NoiceCmdline"]            = { bg = MyColors.primary, fg = colors.ui_text },
  ["NoiceCmdlinePopup"]       = { bg = MyColors.primary, fg = colors.ui_text },
  ["NoiceCmdlinePopupBorder"] = { bg = MyColors.primary, fg = colors.ui_text },
  ["MsgArea"]                 = { bg = MyColors.primary, fg = colors.ui_text },

  ---------------------------------------------------------
  -- ⚠️ Messages
  ---------------------------------------------------------
  ["ErrorMsg"]      = { fg = colors.red },
  ["WarningMsg"]    = { fg = colors.orange },
  ["InfoMsg"]       = { fg = colors.yellow },

  ["NotifyBackground"]  = { bg = MyColors.primary },
  ["NotifyERRORBorder"] = { bg = MyColors.primary, fg = colors.red },
  ["NotifyWARNBorder"]  = { bg = MyColors.primary, fg = colors.orange },
  ["NotifyINFOBorder"]  = { bg = MyColors.primary, fg = colors.green },
  ["NotifyDEBUGBorder"] = { bg = MyColors.primary, fg = colors.gray },
  ["NotifyTRACEBorder"] = { bg = MyColors.primary, fg = colors.yellow },

  ["NotifyERRORIcon"]   = { bg = MyColors.primary, fg = colors.red },
  ["NotifyWARNIcon"]    = { bg = MyColors.primary, fg = colors.orange },
  ["NotifyINFOIcon"]    = { bg = MyColors.primary, fg = colors.green },
  ["NotifyDEBUGIcon"]   = { bg = MyColors.primary, fg = colors.gray },
  ["NotifyTRACEIcon"]   = { bg = MyColors.primary, fg = colors.yellow },

  ["NotifyERRORTitle"]  = { bg = MyColors.primary, fg = colors.red },
  ["NotifyWARNTitle"]   = { bg = MyColors.primary, fg = colors.orange },
  ["NotifyINFOTitle"]   = { bg = MyColors.primary, fg = colors.green },
  ["NotifyDEBUGTitle"]  = { bg = MyColors.primary, fg = colors.gray },
  ["NotifyTRACETitle"]  = { bg = MyColors.primary, fg = colors.yellow },

  ["NotifyERRORBody"]   = { bg = MyColors.primary, link = "Normal" },
  ["NotifyWARNBody"]    = { bg = MyColors.primary, link = "Normal" },
  ["NotifyINFOBody"]    = { bg = MyColors.primary, link = "Normal" },
  ["NotifyDEBUGBody"]   = { bg = MyColors.primary, link = "Normal" },
  ["NotifyTRACEBody"]   = { bg = MyColors.primary, link = "Normal" },

  ---------------------------------------------------------
  -- 💬 Syntax Groups
  ---------------------------------------------------------
  ["comment"]                   = { fg = colors.comment, italic = false },

  -- Constants
  ["constant"]                  = { fg = colors.ui_text },
  ["@constant"]                 = { fg = colors.ui_text },
  ["@constant.builtin"]         = { fg = colors.yellow  },
  ["@constant.c"]               = { fg = colors.yellow  },
  ["@constant.macro.c"]         = { fg = colors.yellow  },
  ["@constant.numeric"]         = { fg = colors.ui_text },
  ["@constant.character"]       = { fg = colors.yellow  },
  ["@constant.builtin.boolean"] = { fg = colors.yellow  },

  -- Functions
  ["function"]              = { fg = colors.ui_text   },
  ["@function"]             = { fg = colors.ui_text   },
  ["function.c"]            = { fg = colors.ui_text   },
  ["function.call"]         = { fg = colors.ui_text   },
  ["@function.call.c"]      = { fg = colors.ui_text   },
  ["@function.call"]        = { fg = colors.ui_text   },
  ["@function.builtin"]     = { fg = colors.ui_text   },
  ["@function.macro"]       = { fg = colors.ui_text   },
  ["@lsp.type.macro.c"]     = { fg = colors.yellow    },
  ["@lsp.type.macro.cpp"]   = { fg = colors.yellow    },
  ["@lsp.type.operator.c"]  = { fg = colors.ui_text   },
  ["rustFuncCall"]          = { fg = colors.blue_gray },

  -- Keywords
  ["keyword"]                      = { fg = colors.orange, bg = 'NONE' },
  ["Keyword"]                      = { fg = colors.orange, bg = 'NONE' },
  ["@keyword"]                     = { fg = colors.orange, bg = 'NONE' },
  ["@keyword.type.cpp"]            = { fg = colors.yellow, bg = 'NONE' },
  ["@type.cpp"]                    = { fg = colors.yellow, bg = 'NONE' },
  ["@keyword.type.c"]              = { fg = colors.yellow, bg = 'NONE' },
  ["keyword.import.c"]             = { fg = colors.purple, bg = 'NONE' },
  ["@keyword.operator.typescript"] = { fg = colors.yellow, bg = 'NONE' },
  ["typescriptCall"]               = { bg = 'NONE' },

  -- Strings
  ["string"]                = { fg = colors.string  },
  ["@string.c"]             = { fg = colors.string  },
  ["@string.lua"]           = { fg = colors.string  },
  ["@string.typescript"]    = { fg = colors.string  },
  ["@string.escape"]        = { fg = colors.ui_text },
  ["@string.special"]       = { fg = colors.green   },

  -- Types
  ["type"]                  = { fg = colors.ui_text },
  ["@type"]                 = { fg = colors.white   },
  ["@type.c"]               = { fg = colors.yellow  },
  ["@type.builtin.c"]       = { fg = colors.brown   },

  -- Variables & Fields
  ["@variable"]                       = { fg = colors.ui_text    },
  ["@variable.typescript"]            = { fg = colors.ui_text    },
  ["@variable.member"]                = { fg = colors.ui_text    },
  ["@variable.member.typescript"]     = { fg = colors.ui_text    },
  ["variable.builtin"]                = { fg = colors.ui_text    },
  ["@variable.parameter"]             = { fg = colors.ui_text    },
  ["@variable.parameter.typescript"]  = { fg = colors.red        },
  ["@property"]                       = { fg = colors.ui_text    },
  ["@field"]                          = { fg = colors.yellow     },
  ["@lsp.mod.declaration.c"]          = { fg = colors.ui_text    },
  ["@lsp.mod.declaration.typescript"] = { fg = colors.ui_text    },
  ["@lsp.mod.local.typescript"]       = { fg = colors.red        },
  ["@lsp.mod.readonly.typescript"]    = { fg = colors.ui_text    },
  ["@lsp.type.function.typescript"]   = { fg = colors.blue_gray  },
  ["@lsp.typemod.variable.readonly.typescript"] = { fg = colors.ui_text },
  ["@lsp.typemod.variable.definition.c"] = { fg = colors.cyan },
  ["@lsp.typemod.variable.declaration.c"] = { fg = colors.cyan },

  -- Clangd
  ["@variable.c"]                = { fg = colors.white      },
  ["@type.typescript"]           = { fg = colors.yellow     },
  ["@keyword.coroutine.typescript"] = { fg = colors.yellow  },
  ["@keyword.modifier.typescript"] = { fg = colors.yellow   },
  ["@lsp.type.class.typescript"] = { fg = colors.yellow     },
  ["@type.function.c"]           = { fg = colors.ui_text    },
  ["@lsp.type.function.c"]       = { fg = colors.ui_text    },
  ["@lsp.type.function.cpp"]     = { fg = colors.white      },
  ["@lsp.type.class.c"]          = { fg = colors.orange     },
  ["@lsp.type.class.cpp"]        = { fg = colors.orange     },
  ["@type.definition.c"]         = { fg = colors.cyan       },
  ["@lsp.definition.c"]          = { fg = colors.cyan       },
  ["@type.definition.cpp"]       = { fg = colors.yellow     },
  ["@lsp.type.variable.c"]       = { fg = colors.cyan       },
  ["@lsp.mod.functionScope.c"]   = { fg = colors.ui_text    },
  ["@lsp.typemod.variable.functionScope.c"] = { fg = colors.cyan },
  ["@lsp.type.enumMember.c"]     = { fg = colors.yellow  },
  ["@lsp.type.enumMember.cpp"]   = { fg = colors.yellow  },


  -- Operators & Punctuation
  ["operator"]             = { fg = colors.ui_text },
  ["punctuation"]          = { fg = colors.ui_text },
  ["@punctuation.special"] = { fg = colors.green   },

  -- Misc
  ["@enum"]         = { fg = colors.orange  },
  ["constructor"]   = { fg = colors.blue    },
  ["special"]       = { fg = colors.ui_text },

  ---------------------------------------------------------
  -- 🧬 Markup & Docs
  ---------------------------------------------------------
  ["markup.heading"]        = { fg = colors.gray  },
  ["markup.raw.inline"]     = { fg = colors.green },
  ["markup.bold"]           = { fg = colors.yellow, modifiers = { "bold" }   },
  ["markup.italic"]         = { fg = colors.purple, modifiers = { "italic" } },
  ["markup.strikethrough"]  = { modifiers = { "crossed_out" } },
  ["markup.list"]           = { fg = colors.gray   },
  ["markup.quote"]          = { fg = colors.yellow },
  ["markup.link.url"]       = { fg = colors.cyan, modifiers = { "underlined" } },
  ["markup.link.text"]      = { fg = colors.purple },

  ---------------------------------------------------------
  -- 🖥️ UI Elements
  ---------------------------------------------------------
  ["ui.background"]           = { bg = colors.ui_text_rev  },
  ["ui.gutter"]               = { bg = colors.gray         },
  ["ui.virtual"]              = { fg = colors.faint_gray   },
  ["ui.virtual.indent-guide"] = { fg = colors.faint_gray   },
  ["ui.virtual.ui_textspace"] = { fg = colors.light_gray   },
  ["ui.virtual.ruler"]        = { bg = colors.gray         },
  ["ui.virtual.inlay-hint"]   = { fg = colors.blue_gray, modifiers = { "bold" } },

  -- Cursor / Selection
  ["ui.cursor"]             = { fg = colors.ui_text, modifiers = { "reversed" } },
  ["ui.cursor.primary"]     = { fg = colors.ui_text, modifiers = { "reversed" } },
  ["ui.cursor.match"]       = { fg = colors.blue, modifiers = { "underlined" }  },
  ["ui.selection"]          = { bg = colors.faint_gray },
  ["ui.selection.primary"]  = { bg = colors.blue_gray },
  ["ui.cursorline.primary"] = { bg = colors.gray },

  -- Highlight
  ["ui.highlight"]           = { bg = colors.gray },
  ["ui.highlight.frameline"] = { bg = colors.red  },

  -- Line Numbers
  ["ui.linenr"]           = { fg = colors.linenr  },
  ["ui.linenr.selected"]  = { fg = colors.ui_text },

  -- Statusline
  ["ui.statusline"]           = { fg = colors.ui_text, bg = colors.gray     },
  ["ui.statusline.inactive"]  = { fg = colors.light_gray, bg = colors.black },
  ["ui.statusline.normal"]    = { fg = colors.black, bg = colors.blue       },
  ["ui.statusline.insert"]    = { fg = colors.black, bg = colors.green      },
  ["ui.statusline.select"]    = { fg = colors.black, bg = colors.purple     },

  -- Text
  ["ui.text"]         = { fg = colors.ui_text },
  ["ui.text.focus"]   = { fg = colors.ui_text, bg = colors.blue_gray, modifiers = { "bold" } },

  -- Popups / Menus
  ["ui.help"]           = { fg = colors.ui_text, bg = colors.gray },
  ["ui.popup"]          = { bg = MyColors.primary },
  ["ui.window"]         = { fg = colors.gray },
  ["ui.menu"]           = { fg = colors.ui_text, bg = colors.gray },
  ["ui.menu.selected"]  = { fg = colors.ui_text_rev, bg = colors.blue },
  ["ui.menu.scroll"]    = { fg = colors.ui_text, bg = colors.light_gray },

  ---------------------------------------------------------
  -- Telescope
  ---------------------------------------------------------
  ["TelescopeResultsNormal"]  = { fg = colors.ui_text, bg = MyColors.primary },
  ["TelescopeResultsBorder"]  = { fg = colors.ui_text, bg = MyColors.primary },
  ["TelescopeResultsTitle"]   = { fg = colors.ui_text, bg = MyColors.primary },
  ["TelescopePromptNormal"]   = { fg = colors.ui_text, bg = MyColors.primary },
  ["TelescopePromptBorder"]   = { fg = colors.ui_text, bg = MyColors.primary },
  ["TelescopePromptTitle"]    = { fg = colors.ui_text, bg = MyColors.primary },

  ["FoldLineCurrent"]         = { fg = MyColors.accent, bg = "NONE" },
  ["Error"]                   = { fg = MyColors.red, bg = "NONE" },

  -- Braces & Brackets
  ["Delimiter"]               = { fg = colors.ui_text },
  ["@punctuation.bracket"]    = { fg = colors.white },
  ["@punctuation.delimiter"]  = { fg = colors.ui_text },

  -- Matching Brackets
  ["MatchParen"]              = { fg = colors.yellow, bg = colors.faint_gray, bold = true },

  -- Rainbow Brackets
  ["rainbowcol1"] = { fg = colors.yellow },
  ["rainbowcol2"] = { fg = colors.orange },
  ["rainbowcol3"] = { fg = colors.green },
  ["rainbowcol4"] = { fg = colors.blue },
  ["rainbowcol5"] = { fg = colors.purple },
  ["rainbowcol6"] = { fg = colors.cyan },
  ["rainbowcol7"] = { fg = colors.red },
}


-----------------------------------------------------------
-- ⚙️ Apply Highlights
-----------------------------------------------------------
local function apply_theme()
  for group, opts in pairs(highlights) do
    local hl = {}

    hl.fg = opts.fg
    hl.bg = opts.bg
    hl.bold = opts.bold
    hl.italic = opts.italic
    hl.underline = opts.underline

    if opts.modifiers then
      for _, mod in ipairs(opts.modifiers) do
        if mod == "bold"         then hl.bold = true end
        if mod == "italic"       then hl.italic = true end
        if mod == "underlined"   then hl.underline = true end
        if mod == "crossed_out"  then hl.strikethrough = true end
        if mod == "reversed"     then hl.reverse = true end
        if mod == "dim"          then hl.standout = true end
      end
    end

    vim.api.nvim_set_hl(0, group, hl)
  end
end

local ok, _ = pcall(vim.cmd, "colorscheme lackluster-dark")
if not ok then
  vim.notify("Colorscheme 'lackluster-dark' not found! Using default.", vim.log.levels.WARN)
end

apply_theme()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_theme,
})


