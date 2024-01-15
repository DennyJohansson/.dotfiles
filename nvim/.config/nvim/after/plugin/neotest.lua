require('neotest').setup({
    adapters = {
        require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function()
                return vim.fn.getcwd()
            end,
        }),
    }
})

vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
{})
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>lua require('neotest').summary.toggle()<cr>", {})
