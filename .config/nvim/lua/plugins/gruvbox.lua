return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      -- 1. Standard Settings
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_enable_italic = 1

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_highlights_gruvbox", {}),
        pattern = "gruvbox-material",
        callback = function()
          local config = vim.fn["gruvbox_material#get_configuration"]()
          local palette =
            vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
          local set_hl = vim.fn["gruvbox_material#highlight"]

          -- Force the Floating Terminal background to be transparent/same as editor
          vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.grey0[1], bg = "NONE" })

          -- Optional: Fix the border color specifically for LazyVim's terminal
          vim.api.nvim_set_hl(0, "LazyTerm", { link = "Normal" })
          vim.api.nvim_set_hl(0, "LazyTermBorder", { fg = palette.grey0[1], bg = "NONE" })
        end,
      })
    end,
  },

  { "folke/tokyonight.nvim", enabled = false },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
