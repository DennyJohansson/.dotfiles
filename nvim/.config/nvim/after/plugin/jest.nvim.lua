-- require'nvim-jest'.setup {
  -- Prevents tests from printing messages
  -- silent = true,
-- }

vim.keymap.set("n", "<leader>tf", "<cmd>lua require('nvim-jest').test_file()<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>lua require('nvim-jest').test_single()<CR>")
