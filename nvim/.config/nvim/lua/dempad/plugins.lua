local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- , event = "VeryLazy"},
require("lazy").setup({
  { "jose-elias-alvarez/null-ls.nvim" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-fugitive" },
  { "idanarye/vim-merginal" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-pack/nvim-spectre" },
  { "folke/neodev.nvim" },
  { "DennyJohansson/git-worktree.nvim" },
  { "mbbill/undotree" },
  { "nvim-treesitter/playground" },
  { "romgrk/nvim-treesitter-context" },
  { "folke/zen-mode.nvim" },
  { "github/copilot.vim" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-sleuth" },
  { "godlygeek/tabular" },
  { 'findango/vim-mdx' },
  { 'BlackLight/nvim-http' },
  { 'mfussenegger/nvim-dap' },
  { 'numToStr/Comment.nvim' },
  { 'lbrayner/vim-rzip' },
  {
    "xolox/vim-notes",
    dependencies = { "xolox/vim-misc" }
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      icons = false,
      -- position = "right",
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim',                  config = true },
      'williamboman/mason-lspconfig.nvim',

      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',                        opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',   opts = {} },
  { "EdenEast/nightfox.nvim" },
  -- { "folke/tokyonight.nvim" },

  -- { "blazkowolf/gruber-darker.nvim" },
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  { 'lewis6991/gitsigns.nvim' },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
  -- {
  --   "NTBBloodbath/rest.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   ft = { "markdown" },
  --
  --
  --   build = "cd app && npm install",
  --   config = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --     vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle <CR>", {})
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-neotest/neotest-jest",
  --   },
  --   lazy = true,
  -- },
  { 'simrat39/rust-tools.nvim' },
  { 'ThePrimeagen/harpoon' },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  -- Java LSP
  {
    -- https://github.com/mfussenegger/nvim-jdtls
    'mfussenegger/nvim-jdtls',
    ft = 'java', -- Enable only on .java file extensions
  },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
      -- https://github.com/mfussenegger/nvim-dap
      'mfussenegger/nvim-dap',
      -- https://github.com/theHamsta/nvim-dap-virtual-text
      'theHamsta/nvim-dap-virtual-text',   -- inline variable text while debugging
      -- https://github.com/nvim-telescope/telescope-dap.nvim
      'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
    }
  },
  { "nvim-neotest/nvim-nio" },
  {
    -- https://github.com/theHamsta/nvim-dap-virtual-text
    'theHamsta/nvim-dap-virtual-text',
    lazy = true,
    opts = {
      -- Display debug text as a comment
      commented = true,
      -- Customize virtual text
      display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == 'inline' then
          return ' = ' .. variable.value
        else
          return variable.name .. ' = ' .. variable.value
        end
      end,
    },
  },
  {
    -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  -- Debugging Support
  {
    -- https://github.com/rcarriga/nvim-dap-ui
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
      -- https://github.com/mfussenegger/nvim-dap
      'mfussenegger/nvim-dap',
      -- https://github.com/theHamsta/nvim-dap-virtual-text
      'theHamsta/nvim-dap-virtual-text',   -- inline variable text while debugging
      -- https://github.com/nvim-telescope/telescope-dap.nvim
      'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
    },
  },
}, {})
