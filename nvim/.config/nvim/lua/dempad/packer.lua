return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- use("sbdchd/neoformat")
  use("jose-elias-alvarez/null-ls.nvim")

  -- Simple plugins can be specified as strings
  use("TimUntersberger/neogit")
  use("samoshkin/vim-mergetool")

  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
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
  -- Primeagen doesn"t create lodash
  use("ThePrimeagen/git-worktree.nvim")
  use("ThePrimeagen/harpoon")

  use("mbbill/undotree")

  -- Colorscheme section
  -- use("gruvbox-community/gruvbox")
  -- use("folke/tokyonight.nvim")

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
  use({ "tpope/vim-unimpaired" })
  use({ "david-Kunz/jester" })
  use({ "xolox/vim-misc" })
  use({ "xolox/vim-notes" })
  use({
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
  })
end)
