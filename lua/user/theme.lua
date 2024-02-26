require("catppuccin").setup({
    integrations = {
        cmp = true,
        gitsigns = false,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        native_lsp = {
        enabled = true,
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
      },
      telescope = {
        enabled = true,
        -- style = "nvchad"
      }
    }
})

vim.cmd.colorscheme "catppuccin-mocha"
