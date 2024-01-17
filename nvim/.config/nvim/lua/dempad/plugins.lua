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
  { "tpope/vim-fugitive" },
  { "idanarye/vim-merginal" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "folke/tokyonight.nvim" },
  { "nvim-pack/nvim-spectre" },
  { "folke/neodev.nvim" },
  { "ThePrimeagen/git-worktree.nvim" },
  { "mbbill/undotree" },
  { "nvim-treesitter/playground" },
  { "romgrk/nvim-treesitter-context" },
  { "folke/zen-mode.nvim" },
  { "github/copilot.vim" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-sleuth" },
  { "xolox/vim-notes", dependencies = { "xolox/vim-misc" } },
  { "godlygeek/tabular" },
  { "mickael-menu/zk-nvim" },
  { 'findango/vim-mdx' },
  { 'BlackLight/nvim-http' },
  { 'mfussenegger/nvim-dap' },
  { 'numToStr/Comment.nvim' },
  { 'lbrayner/vim-rzip' },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  },
  {
    "folke/trouble.nvim",
    
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      icons = false,
    },
  },

  -- {
  --   -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     { 'williamboman/mason.nvim', config = true },
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     -- Useful status updates for LSP
  --     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --     { 'j-hui/fidget.nvim', opts = {} },
  --
  --     -- Additional lua configuration, makes nvim stuff amazing!
  --     'folke/neodev.nvim',
  --   },
  -- },
  --
  -- {
  --   -- Autocompletion
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     -- Snippet Engine & its associated nvim-cmp source
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',
  --
  --     -- Adds LSP completion capabilities
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --
  --     -- Adds a number of user-friendly snippets
  --     'rafamadriz/friendly-snippets',
  --   },
  -- },
  --
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    "NTBBloodbath/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
    lazy = true,
  },
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
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    lazy = true,
  }
})
