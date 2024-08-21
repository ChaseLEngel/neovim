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

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  'neovim/nvim-lspconfig', -- Language server config
  'nvim-tree/nvim-tree.lua', -- Explorer
  'tpope/vim-rails',
  'hrsh7th/cmp-nvim-lsp',
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  'rgroli/other.nvim',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp', -- The compeltion plugin
	'saadparwaiz1/cmp_luasnip',
  "L3MON4D3/LuaSnip", -- Snippet engine
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "catppuccin/nvim", name = "catppuccin" }, -- Theme
  { 'nvim-telescope/telescope.nvim', dependencies = { { 'nvim-lua/plenary.nvim' } } }, -- Search
  {
    "nvim-neotest/neotest",
    dependencies = {
      "zidhuss/neotest-minitest",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
      format_on_save = {
        lsp_fallback = true,
      },
      formatters_by_ft = {
        ruby = { 'rubocop' }
      },
    },
  }
})

-- [nvim-tree.lua] disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Function to create a new file with the name [current file]_test.rb
function create_test_file()
  -- Get the current file's name and path
  local current_file = vim.fn.expand('%:p')

  -- Check if the current file is a Ruby file
  if not current_file:match('%.rb$') then
    print('Current file is not a Ruby file.')
    return
  end

  -- Construct the new filename
  local new_file = current_file:gsub('%.rb$', '_test.rb'):gsub('app', 'test')

  -- Create the new file and open it in a new buffer
  vim.cmd('vsplit ' .. new_file)
end

-- Add the function to the global namespace
_G.create_test_file = create_test_file

-- Create a command to call the function
vim.api.nvim_create_user_command('CreateTestFile', create_test_file, {})

require "user.other"
require "user.options"
require "user.lsp"
require "user.keymaps"
require "user.explorer"
require "user.treesitter"
require "user.cmp"
require "user.theme"
require "user.snippets"
require "user.search"
require "user.test_runner"
