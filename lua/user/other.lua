require("other-nvim").setup({
    mappings = {
        "rails"
    },
    transformers = {
        -- defining a custom transformer
        lowercase = function (inputString)
            return inputString:lower()
        end
    },
    style = {
        -- How the plugin paints its window borders
        -- Allowed values are none, single, double, rounded, solid and shadow
        border = "solid",

        -- Column seperator for the window
        seperator = "|",

	-- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
	width = 0.7,

	-- min height in rows.
	-- when more columns are needed this value is extended automatically
	minHeight = 2
    },
})

vim.api.nvim_set_keymap("n", "<leader>ol", "<cmd>:Other<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>otn", "<cmd>:OtherTabNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>op", "<cmd>:OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ov", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>oc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ot", "<cmd>:Other test<CR>", { noremap = true, silent = true })
