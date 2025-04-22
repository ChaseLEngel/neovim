local wk_ok, which_key = pcall(require, "which-key")
if not wk_ok then
  return
end

which_key.setup({
  plugins = {
    spelling = {
      enabled = true,
    },
  },
  window = {
    border = "single", -- none, single, double, shadow
  },
  layout = {
    align = "center",
  },
})

which_key.register({
  -- Test related mappings
  t = {
    name = "Tests",
    n = { function() require("neotest").run.run() end, "Run Nearest" },
    f = { function() require("neotest").run.run(vim.fn.expand("%")) end, "Run File" },
    l = { function() require("neotest").run.run_last() end, "Run Last" },
    o = { function() require("neotest").output.open({ enter = true }) end, "Open Output" },
    s = { function() require("neotest").summary.toggle() end, "Toggle Summary" },
    S = { function() require("neotest").run.stop() end, "Stop Running" },
  },

  -- LSP related mappings
  l = {
    name = "LSP",
    d = { "<cmd>Telescope lsp_definitions<cr>", "Go to Definition" },
    r = { "<cmd>Telescope lsp_references<cr>", "Go to References" },
    i = { "<cmd>Telescope lsp_implementations<cr>", "Go to Implementation" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
    h = { vim.lsp.buf.hover, "Hover Documentation" },
    R = { vim.lsp.buf.rename, "Rename" },
    a = { vim.lsp.buf.code_action, "Code Action" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
  },

  -- Git related mappings (using gitsigns)
  g = {
    name = "Git",
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
  },

  -- File / Buffer related mappings
  f = {
    name = "File/Buffer",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep Files" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
  },

}, { prefix = "<leader>" })
