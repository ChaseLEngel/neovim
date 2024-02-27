local ok, neotest = pcall(require, 'neotest')
if not ok then
  return
end

neotest.setup({
  adapters = {
    require("neotest-minitest"),
  },
})

local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tc", ":lua require('neotest').run.run()<CR>", opts)
keymap("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
keymap("n", "<leader>to", ":lua require('neotest').output.open()<CR>", opts)
