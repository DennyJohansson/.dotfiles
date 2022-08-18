lvim.format_on_save = false
-- lvim.lint_on_save = true
lvim.colorscheme = "ayu"
-- vim.o.background = "light" -- or "light" for light mode lvim.leader = "space" -- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.shading_factor = 1
lvim.keys.normal_mode["<C-a>"] = ":ToggleTermToggleAll<cr>"
lvim.keys.term_mode["<C-a>"] = "<cmd>ToggleTermToggleAll<cr>"

vim.o.relativenumber = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

vim.g["notes_smart_quotes"] = 0
vim.g["notes_conceal_italic"] = 0
vim.g["notes_conceal_bold"] = 0
vim.g["notes_conceal_url"] = 0
vim.g["notes_conceal_code"] = 0
vim.g["vim_markdown_conceal"] = 0
vim.g["tex_conceal"] = 1
vim.g["vim_markdown_math"] = 1

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

lvim.lsp.diagnostics.virtual_text = false
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
	local actions = require("telescope.actions")
	-- for input mode
	lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
	lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
	lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
	lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
	-- for normal mode
	lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
	lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

lvim.builtin.which_key.mappings["t"] = {
	name = "jest test",
	n = { ":lua require'jester'.run()<CR>", "test nearest" },
	f = { ":lua require'jester'.run_file()<CR>", "test file" },
	l = { ":lua require'jester'.run_last()<CR>", "run last test" },
	d = { ":lua require'jester'.debug()<CR>", "debug nearest" },
	g = { ":lua require'jester'.debug_file()<CR>", "debug file" },
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["Z"] = { "<cmd>ZenMode<CR>", "zen mode" }

lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

-- Gdiff
lvim.keys.normal_mode['gdh'] = ":diffget //2<CR>"
lvim.keys.normal_mode['gdl'] = ":diffget //3<CR>"

local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({
	-- brew install rust
	{ command = "stylua", filetypes = { "lua" } },
	{
		command = "prettier",
		filetypes = { "typescript", "typescriptreact", "javascript" },
	},
	{
		command = "eslint_d",
		filetypes = { "typescript", "typescriptreact", "javascript" },
		args = { "--stdin --fix-to-stdout" },
	},
})

local linters = require("lvim.lsp.null-ls.linters")

linters.setup({
	{
		command = "eslint_d",
		filetypes = { "typescript", "typescriptreact", "javascript" },
	},
})

-- call mkdp#util#install()
-- Additional Plugins
lvim.plugins = {
	{ "lunarvim/colorschemes" },
	{ "folke/tokyonight.nvim" },
	{ "ayu-theme/ayu-vim" },
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
		event = "BufRead",
	},
	{ "tpope/vim-unimpaired" },
	{ "david-Kunz/jester" },
	{ "folke/lsp-colors.nvim" },
	{ "xolox/vim-misc" },
	{ "xolox/vim-notes" },
	{
		"tpope/vim-fugitive",
	},
	{ "tpope/vim-surround" },
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "godlygeek/tabular" },
	{ "elzr/vim-json" },
	{ "plasticboy/vim-markdown" },
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
}
