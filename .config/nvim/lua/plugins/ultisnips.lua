return {
  "SirVer/ultisnips",
  lazy = false,
  init = function()
    vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
    vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
  end,
}
