local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = 'Toggle Trouble' })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
  { desc = 'Toggle Trouble [W]orkspace Diagnostics' })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
  { desc = 'Toggle Trouble [D]ocument Diagnostics' })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end,
  { desc = 'Toggle Trouble [Q]uickfix' })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end,
  { desc = 'Toggle Trouble [L]oclist' })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end,
  { desc = 'Toggle Trouble [R]eferences' })

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

-- toggle trouble with optional mode
-- require("trouble").toggle(mode?)
--
-- -- open trouble with optional mode
-- require("trouble").open(mode?)

-- close trouble
-- require("trouble").close()
vim.keymap.set("n", "<leader>xc", function() require("trouble").close() end, { desc = '[C]lose Trouble' })

-- jump to the next item, skipping the groups
-- require("trouble").next({skip_groups = true, jump = true});
vim.keymap.set("n", "<c-n>", function() require("trouble").next({ skip_groups = true, jump = true }) end,
  { desc = 'Jump to [N]ext item' })

-- jump to the previous item, skipping the groups
-- require("trouble").previous({skip_groups = true, jump = true});

vim.keymap.set("n", "<c-p>", function() require("trouble").previous({ skip_groups = true, jump = true }) end,
  { desc = 'Jump to [P]revious item' })

-- jump to the first item, skipping the groups
-- require("trouble").first({skip_groups = true, jump = true});
--
-- -- jump to the last item, skipping the groups
-- require("trouble").last({skip_groups = true, jump = true});
