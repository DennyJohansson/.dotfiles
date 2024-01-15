require('todo-comments').setup {}

vim.keymap.set("n", "<leader>do", "<cmd>:TodoTelescope<cr>", { noremap = true, silent = true })
