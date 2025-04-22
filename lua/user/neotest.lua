local ok, neotest = pcall(require, 'neotest')
if not ok then
  return
end

neotest.setup({
  adapters = {
    require("neotest-minitest"),
  },
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Run nearest test
map("n", "<leader>tn", function()
  neotest.run.run()
end, { desc = "Run [N]earest test" })

-- Run current file's tests
map("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run [F]ile tests" })

-- Run last test
map("n", "<leader>tl", function()
  neotest.run.run_last()
end, { desc = "Run [L]ast test" })

-- Open test output window
map("n", "<leader>to", function()
  neotest.output.open({ enter = true })
end, { desc = "Open test [O]utput" })

-- Toggle summary window
map("n", "<leader>ts", function()
  neotest.summary.toggle()
end, { desc = "Toggle test [S]ummary" })

-- Stop running tests
map("n", "<leader>tS", function()
  neotest.run.stop()
end, { desc = "[S]top running tests" })

