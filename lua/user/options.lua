local tab_width = 2
vim.opt.tabstop = tab_width
vim.opt.shiftwidth = tab_width
vim.opt.expandtab = true

vim.opt.wrap = false

-- Show trailing whitespace
vim.opt.listchars["trail"] = "·"

vim.opt.list = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set colorscheme
vim.o.background = "dark" -- or "light" for light mode

-- Show line numbers.
vim.opt.number = true

-- Show where the cursor is using row,column.
vim.opt.ruler = true

-- Highlight current line
vim.opt.cursorline = true

 -- otherwise it bounces in and out, not strictly needed though
vim.opt.signcolumn = "yes"

-- When substituting, opens a bottom split with matches that will be replaced
vim.opt.inccommand = 'split'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
