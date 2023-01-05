require'nvim-jest'.setup {
  -- Jest executable
  -- By default finds jest in the relative project directory
  -- To override with an npm script, provide 'npm test --' or similar
  --  jest_cmd = '/relative/project/dir/node_modules/jest/bin/jest.js',

  -- Prevents tests from printing messages
  -- silent = true,
  --
}

vim.keymap.set("n", "<leader>tf", ":JestFile<CR>")
vim.keymap.set("n", "<leader>tn", ":JestSingle<CR>")
vim.keymap.set("n", "<leader>tc", ":JestCoverage<CR>")
vim.keymap.set("n", "<leader>tp", ":Jest<CR>")
