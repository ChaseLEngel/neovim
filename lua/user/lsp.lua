local ok, configs = pcall(require, 'lspconfig.configs')
if not ok then
  return
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

-- Check if the config is already defined (useful when reloading this file)
if not configs.ruby_lsp then
 local enabled_features = {
   "documentHighlights",
   "documentSymbols",
   "foldingRanges",
   "selectionRanges",
   -- "semanticHighlighting",
   "formatting",
   "codeActions",
 }

 configs.ruby_lsp = {
   default_config = {
     cmd = { "bundle", "exec", "ruby-lsp" },
     filetypes = { "ruby" },
     root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
     init_options = {
        enabledFeatures = enabled_features,
        formatter = "auto",
     },
     root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
     settings = {},
   },
 }
end

lspconfig.ruby_ls.setup{}
