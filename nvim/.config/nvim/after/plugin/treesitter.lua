vim.defer_fn(function()
	require("nvim-treesitter.configs").setup({
		-- A list of parser names, or "all"
		-- ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust", "http", "json" },
		ensure_installed = {
			"c",
			"cpp",
			"go",
			"lua",
			"python",
			"rust",
			"tsx",
			"javascript",
			"typescript",
			"vimdoc",
			"vim",
			"bash",
			"jq",
			"java",
		},

		-- incremental_selection = {
		--   enable = true,
		--   keymaps = {
		-- init_selection = '<c-t>',
		-- node_incremental = '<c-t>',
		-- scope_incremental = '<c-s>',
		-- node_decremental = '<M-t>',
		-- },
		-- },

		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			-- swap = {
			--   enable = true,
			--   swap_next = {
			--         ['<leader>a'] = '@parameter.inner',
			--   },
			--   swap_previous = {
			--         ['<leader>A'] = '@parameter.inner',
			--   },
			-- },
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		highlight = {
			-- `false` will disable the whole extension
			enable = true,
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
	})
end, 0)
