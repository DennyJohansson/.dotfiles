-- vim.keymap.set("n", "<leader>n", "<cmd>Note")
vim.g.notes_directories = {
  '~/Notes',
}
vim.g.nofoldenable = true
vim.g.foldmethod = 'manual'
vim.g.foldlevelstart = 99
vim.cmd [[
  augroup notes
    autocmd!
    autocmd BufWritePost,BufEnter * set nofoldenable foldmethod=manual foldlevelstart=99
  augroup END
]]
