local Remap = require("dempad.keymap")
local nnoremap = Remap.nnoremap

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

nnoremap("<leader>pw", function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end)
nnoremap("<leader>pb", function()
  require("telescope.builtin").buffers()
end)
nnoremap("<leader>vh", function()
  require("telescope.builtin").help_tags()
end)

nnoremap("<leader>gc", function()
  require("dempad.telescope").git_branches()
end)
nnoremap("<leader>gw", function()
  require("telescope").extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
  require("telescope").extensions.git_worktree.create_git_worktree()
end)
