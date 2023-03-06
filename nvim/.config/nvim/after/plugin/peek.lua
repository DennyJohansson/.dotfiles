vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

vim.keymap.set('n', '<leader>pp', ':PeekOpen<CR>', { noremap = true })
vim.keymap.set('n', '<leader>pc', ':PeekClose<CR>', { noremap = true })
