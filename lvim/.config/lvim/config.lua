-- auto pair, tree, zz, harpoon, tabs
lvim.format_on_save = false
-- lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
-- vim.o.background = "light" -- or "light" for light mode lvim.leader = "space" -- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>" lvim.builtin.terminal.direction = "horizontal"
-- lvim.builtin.terminal.shading_factor = 1
-- lvim.keys.normal_mode["<C-a>"] = ":ToggleTermToggleAll<cr>"
-- lvim.keys.term_mode["<C-a>"] = "<cmd>ToggleTermToggleAll<cr>"
-- lvim.keys.normal_mode["<C-r>"] = "<Plug>RestNvim"
vim.o.relativenumber = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
lvim.keys.normal_mode["<C-d>"] = "<C-d> zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u> zz"
lvim.keys.normal_mode["<leader>e"] = ":E<CR>"
-- lvim.keys.normal_mode["<C-h>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- harpoon
lvim.keys.normal_mode["<leader>a"] = ":lua require('harpoon.mark').add_file()<CR>"
lvim.keys.normal_mode["<C-e>"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"
lvim.keys.normal_mode["<C-h>"] = ":lua require('harpoon.ui').nav_file(1)<CR>"
lvim.keys.normal_mode["<C-j>"] = ":lua require('harpoon.ui').nav_file(2)<CR>"
lvim.keys.normal_mode["<C-k>"] = ":lua require('harpoon.ui').nav_file(3)<CR>"
lvim.keys.normal_mode["<C-l>"] = ":lua require('harpoon.ui').nav_file(4)<CR>"
-- netrw
vim.g.netrw_liststyle = 2
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- markdown
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
lvim.builtin.terminal.active = false
-- lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree._setup_called = false
lvim.builtin.nvimtree.active = false
lvim.builtin.bufferline.active = false
vim.opt.showtabline = 0
lvim.builtin.autopairs.active = false
lvim.builtin.treesitter.ensure_installed = {
	"json",
	"http",
}

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
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

-- Gdiff
lvim.keys.normal_mode["gdh"] = ":diffget //2<CR>"
lvim.keys.normal_mode["gdl"] = ":diffget //3<CR>"

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

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.hcl = {
  filetype = "hcl", "terraform",
}
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
	-- { "tpope/vim-surround" },
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- { "godlygeek/tabular" },
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				menu = {
					width = vim.api.nvim_win_get_width(0) - 4,
				},
			})
		end,
	},
	{ "plasticboy/vim-markdown" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- TSInstall http, json
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to nil if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	},
	{
		"mcauley-penney/tidy.nvim",
		config = function()
			require("tidy").setup()
		end,
	},
}
