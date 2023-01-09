return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- use("sbdchd/neoformat")
  use("jose-elias-alvarez/null-ls.nvim")

  -- use('tpope/vim-fugitive')
  use("TimUntersberger/neogit")
  use("samoshkin/vim-mergetool")

  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({ "ellisonleao/gruvbox.nvim",
    as = "gruvbox",
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  })

  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
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
  })

  use("ThePrimeagen/git-worktree.nvim")
  use("ThePrimeagen/harpoon")

  use("mbbill/undotree")

  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate",
  })

  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")
  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use({ 'mattkubej/jest.nvim' })
  use({ "tpope/vim-unimpaired" })
  use({ "xolox/vim-misc" })
  use({ "xolox/vim-notes" })
  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
end)
