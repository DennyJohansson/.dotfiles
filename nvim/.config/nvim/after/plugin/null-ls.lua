local null_ls = require("null-ls")

local default_opt = { silent = true, noremap = true }

local root_has_file = function(files)
  return function(utils)
    return utils.root_has_file(files)
  end
end

-- local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
-- local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
local stylua_root_files = { "stylua.toml", ".stylua.toml" }
local elm_root_files = { "elm.json" }

local opts = {
  eslint_formatting = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    -- condition = function(utils)
    --   local has_eslint = root_has_file(eslint_root_files)(utils)
    --   local has_prettier = root_has_file(prettier_root_files)(utils)
    --   return has_eslint and not has_prettier
    -- end,
  },
  eslint_diagnostics = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    -- condition = root_has_file(eslint_root_files),
  },
  prettier_formatting = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    -- condition = root_has_file(prettier_root_files),
  },
  stylua_formatting = {
    condition = root_has_file(stylua_root_files),
  },
  elm_format_formatting = {
    condition = root_has_file(elm_root_files),
  },
}

local function on_attach(client, _)
  if client.server_capabilities.document_formatting then
    vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
  end
end

null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
    -- null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
    null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
    null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
    null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
    null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
    null_ls.builtins.formatting.elm_format.with(opts.elm_format_formatting),
    null_ls.builtins.code_actions.eslint_d.with(opts.eslint_diagnostics),
  },
  on_attach = on_attach,
})

local lsp_format_async = function()
  vim.lsp.buf.format({ async = true })
end


vim.keymap.set("n", "<leader>f", lsp_format_async, default_opt)
