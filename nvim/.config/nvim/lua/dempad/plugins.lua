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
  { "folke/tokyonight.nvim" },
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
  { 'folke/which-key.nvim',  opts = {} },
  { "EdenEast/nightfox.nvim" },

  -- { "blazkowolf/gruber-darker.nvim" },
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
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
    opts = {
      controls = {
        element = "repl",
        enabled = false,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = ""
        }
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" }
        }
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
      },
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.50
            },
            {
              id = "stacks",
              size = 0.30
            },
            {
              id = "watches",
              size = 0.10
            },
            {
              id = "breakpoints",
              size = 0.10
            }
          },
          size = 40,
          position = "left", -- Can be "left" or "right"
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 10,
          position = "bottom", -- Can be "bottom" or "top"
        }
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
      },
      render = {
        indent = 1,
        max_value_lines = 100
      }
    },
    config = function(_, opts)
      local dap = require('dap')
      require('dapui').setup(opts)

      dap.listeners.after.event_initialized["dapui_config"] = function()
        require('dapui').open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        -- Commented to prevent DAP UI from closing when unit tests finish
        -- require('dapui').close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        -- Commented to prevent DAP UI from closing when unit tests finish
        -- require('dapui').close()
      end

      -- Add dap configurations based on your language/adapter settings
      -- Q
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
      -- dap.configurations.java = {
      -- 	{
      -- 		javaExec = "java",
      -- 		request = "launch",
      -- 		type = "java",
      -- 	},
      -- 	{
      -- 		type = 'java',
      -- 		request = 'attach',
      -- 		name = "Debug (Attach) - Remote",
      -- 		hostName = "127.0.0.1",
      -- 		port = 5005,
      -- 	},
      -- }
      dap.configurations.java = {
        {
          name = "Debug Launch (2GB)",
          type = 'java',
          request = 'launch',
          vmArgs = "" ..
              "-Xmx2g "
        },
        {
          name = "Debug Attach (8000)",
          type = 'java',
          request = 'attach',
          hostName = "127.0.0.1",
          port = 8000,
        },
        {
          name = "Debug Attach (5005)",
          type = 'java',
          request = 'attach',
          hostName = "127.0.0.1",
          port = 5005,
        },
        {
          name = "FeatureToggle",
          type = "java",
          request = "launch",
          -- You need to extend the classPath to list your dependencies.
          -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
          -- classPaths = {},

          -- If using multi-module projects, remove otherwise.
          -- projectName = "yourProjectName",

          -- javaExec = "java",
          mainClass = "replace.with.your.fully.qualified.MainClass",

          -- If using the JDK9+ module system, this needs to be extended
          -- `nvim-jdtls` would automatically populate this property
          -- modulePaths = {},
          vmArgs = "" ..
              "-Xmx2g "
        },
      }
    end
  },
}, {})
