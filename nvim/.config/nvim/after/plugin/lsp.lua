-- require("mason").setup()
-- require("mason-lspconfig").setup()
local lsp = require("lsp-zero")
-- require('lspconfig').lua_ls.setup({})
local cmp = require('cmp')

lsp.preset("recommended")

-- lsp.ensure_installed({
--   'tsserver',
--   'rust_analyzer',
-- })
--
-- Fix Undefined global 'vim'
-- lsp.nvim_workspace()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
  mapping = cmp_mappings,
})

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, opts)
  vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
  vim.keymap.set("n", "gI", require('telescope.builtin').lsp_implementations, opts)
  vim.keymap.set("n", "<leader>D", require('telescope.builtin').lsp_type_definitions, opts)
  vim.keymap.set("n", "<leader>ds", require('telescope.builtin').lsp_document_symbols, opts)
  vim.keymap.set("n", "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  -- vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts)
  -- vim.keymap.set("n", "<leader>lrr", vim.lsp.buf.references, opts)
  -- vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
--  vim.keymap.set({'n', 'x'}, '<leader>f', function()
--     vim.lsp.buf.format({async = false, timeout_ms = 10000})
--  end, opts)
  -- vim.keymay.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
--
-- lsp.configure('tsserver', {
--   settings = {
--     root_dir = lspconfig.util.root_pattern("package.json"),
--     single_file_support = false
--   }
-- })
--
-- lsp.configure('denols', {
--   settings = {
--     root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
--   }
-- })

-- lsp.denols.setup {
--   on_attach = lsp.on_attach,
--   root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }
--
-- lsp.tsserver.setup {
--   on_attach = lsp.on_attach,
--   root_dir = lsp.util.root_pattern("package.json"),
--   single_file_support = false
-- }
