-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Fix double-backspace in Kitty
vim.cmd([[set t_TI=]])
vim.cmd([[set t_TE=]])
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "text" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})
