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
