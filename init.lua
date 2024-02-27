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
	'hrsh7th/cmp-nvim-lsp',
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
    lazy = true,
    dependencies = { "zidhuss/neotest-minitest" }
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 500,
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
