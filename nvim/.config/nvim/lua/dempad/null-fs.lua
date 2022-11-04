local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- --stdin --fix-to-stdout
null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua.with({
      filetype = "lua",
    }),
		formatting.eslint_d.with({
			arg = { "--stdin --fix-to-stdout" },
			filetype = { "typescript", "typescriptreact", "javascript" },
		}),
		--        formatting.prettier,
		--        diagnostics.prettier,
		diagnostics.eslint_d,
		-- diagnostics.stylua,
	},
})
