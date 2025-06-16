vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })
-- vim.keymap.set("i", "jk", "<ESC>")
-- vim.keymap.set("v", "jk", "<ESC>")
-- vim.keymap.set("c", "jk", "<C-C>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "[J]oin lines" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll [D]own half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll [U]p half page" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center [N]ext search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center prev search result" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]aste without yanking" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to system clipboard" })

-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "[S]ed word under cursor" })
vim.keymap.set("n", "<leader>xf", "<cmd>!chmod +x %<CR>", { silent = true, desc = "E[X]ecutable [F]ile" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>sb', ":<C-u>marks<CR>:normal! `", { desc = 'Show marks' })
