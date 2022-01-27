--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
vim.opt.shell = "/bin/sh"
-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "catppuccin"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["G"] = {
  name = "+LazyGit",
  g = { "<cmd>LazyGit<cr>", "Open Lazygit"},
  c = { "<cmd>LazyGitConfig<cr>", "Open Configuration"}
}
lvim.builtin.which_key.mappings["x"] = {
  name = "+FTerm",
  n = { "<cmd>lua require('FTerm').toggle()<cr>", "Toggle Terminal" },
  x = { "<cmd>lua require('FTerm').exit()<cr>", "Close Terminal"},
  o = { "<cmd>lua require('FTerm').open()<cr>", "Open Terminal"}
}
lvim.builtin.which_key.mappings["C"] = {
  name="+CosmicUI",
  n = {"<cmd>lua require('cosmic-ui').rename()<cr>", "Rename"},
  a = {"<cmd>lua require('cosmic-ui').code_actions()<cr>", "Code Actions"},
  v = {"<cmd>lua require('cosmic-ui).range_code_actions<cr>", "Range Code Actions"}
}
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
 local formatters = require "lvim.lsp.null-ls.formatters"
 formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
   {
     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
     command = "prettier",
     ---@usage arguments to pass to the formatter
     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
     extra_args = { "--print-with", "100" },
     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
     filetypes = { "typescript", "typescriptreact" },
   },
 }

-- -- set additional linters
 local linters = require "lvim.lsp.null-ls.linters"
 linters.setup {
--   { command = "flake8", filetypes = { "python" } },
   {
     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
     extra_args = { "--severity", "warning" },
   },
   {
     command = "codespell",
     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
     filetypes = { "javascript", "python" },
   },
  {
    command = "eslint",
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
  }
 }

-- Additional Plugins
lvim.plugins = {
  {
    'CosmicNvim/cosmic-ui',
    requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim'},
    config = function ()
      require('cosmic-ui').setup()
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
  },
  {
    'folke/twilight.nvim',
    config = function ()
      require("twilight").setup{}
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function ()
      require("zen-mode").setup{
        kitty = {
          enabled = true,
          font = "+4"
        }
      }
    end
  },
  {
    "projekt0n/github-nvim-theme",
    config = function ()
      require("github-theme").setup({
        comment_style = "italic",
        keyword_style = "italic",
        function_style = "italic",
        variable_style = "italic"
      })
    end
  },
  {
    "kdheepak/lazygit.nvim"
  },
  {
    "numToStr/FTerm.nvim",
    config = function ()
      require("FTerm").setup({
        border = 'double'
      })
    end
  },
  {
    "dsznajder/vscode-es7-javascript-react-snippets"
  },
  {
    "andweeb/presence.nvim"
  },
  {
    "catppuccin/nvim",
    as = "catppuccin"
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
      require("trobule").setup {}
    end
  }
}
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
  lvim.autocommands.custom_groups = {
  {"CursorHold,CursorHoldI", "*", "lua require('nvim-lightbulb').update_lightbulb()"},
}
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
require("luasnip.loaders.from_vscode").load()
