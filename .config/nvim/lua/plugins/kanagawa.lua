return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      theme = "wave",
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- 1. FLOATING WINDOWS (The most common ugly blocks)
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- 2. POPUP MENUS (Autocomplete, etc.)
          Pmenu = { bg = "none" },
          PmenuSel = { bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          -- 3. TELESCOPE (Search window)
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = "none" },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "none" },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
          TelescopePreviewNormal = { bg = "none" },
          TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },

          -- 4. UTILITY WINDOWS (Mason, Lazy, Info)
          MasonNormal = { bg = "none" },
          LazyNormal = { bg = "none" },

          -- 5. GUTTERS & LINE NUMBERS
          LineNr = { bg = "none" },
          SignColumn = { bg = "none" },
          FoldColumn = { bg = "none" },

          -- 6. STATUS LINE (optional, usually looks better opaque, but try it)
          StatusLine = { bg = "none" },
          StatusLineNC = { bg = "none" },
        }
      end,
    },
  },
}
