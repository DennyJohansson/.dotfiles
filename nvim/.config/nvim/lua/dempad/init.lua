require("dempad.set")
require("dempad.remap")
-- needs to be after remap else leader will not be correct
require("dempad.plugins")
-- require("dempad.packer")
require("dempad.invert")

function R(name)
  require("plenary.reload").reload_module(name)
end

-- TODO: https://github.com/bcampolo/nvim-starter-kit/blob/java/.config/nvim/init.lua#L18
-- Initialize lazy with dynamic loading of anything in the plugins directory
-- require("lazy").setup("plugins", {
--    change_detection = {
--     enabled = true, -- automatically check for config file changes and reload the ui
--     notify = false, -- turn off notifications whenever plugin changes are made
--   },
-- })
--
vim.cmd [[
augroup tmux
  autocmd!
  if exists('$TMUX')
    autocmd BufReadPost,FileReadPost,BufNewFile,FocusGained * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave,FocusLost * call system("tmux set-window-option automatic-rename")
  endif
augroup END
]]
