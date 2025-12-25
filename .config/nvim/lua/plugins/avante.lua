return {
  {
    "yetone/avante.nvim",
    build = "make", -- Requires 'make' and 'cargo' (Rust)
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- 1. Tell Avante to use Gemini for EVERYTHING
      provider = "gemini",
      auto_suggestions_provider = "gemini",

      -- CHANGE THIS: Use snacks instead of telescope
      selector = {
        provider = "snacks",
        provider_opts = {},
      },
      behaviour = {
        auto_suggestions = false, -- (We disabled this for your Free Tier)

        -- 1. Auto Apply Diffs
        -- If true, Avante applies code changes immediately without opening the diff view.
        -- Recommended: false (You want to see the Red/Green diff before accepting)
        auto_apply_diff_after_generation = false,

        -- 2. Auto Keymaps
        -- If true, Avante sets up <leader>aa, <leader>ae, etc.
        -- If false, you must manually define every keybinding in your config.
        auto_set_keymaps = true,

        -- 3. Auto Highlights
        -- If true, it sets the default colors for the sidebar and diffs.
        auto_set_highlight_group = true,

        -- 4. Paste Support (Images)
        -- Allows pasting images into the chat (Gemini Pro supports vision!).
        -- If true, pasting an image file path or blob sends it to the AI.
        support_paste_from_clipboard = false,

        -- 5. Minimize Diff
        -- If true, the diff window opens in a smaller, compacted view by default.
        minimize_diff = false,
      },
      providers = {
        gemini = {
          model = "gemini-2.5-pro",
          temperature = 0,
          max_tokens = 8192,
        },
      },
    },
  },
}
