-- Make sure mason and mason-lspconfig are set up
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",  -- Rust
    "julials",        -- Julia
    "pyright",        -- Python
    "clangd",         -- C/C++
    "texlab",         -- LaTeX
    "ruff",
    "eslint",
  },
  automatic_installation = true,
})

-- Setup handlers for each language server
local lspconfig = require("lspconfig")
local default_handler = function(server_name)
  lspconfig[server_name].setup({})
end

require("mason-lspconfig").setup_handlers({
  default_handler,
})

-- Autocomplete:
local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  },

  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<C-y>'] = cmp.mapping.confirm({select = true}),

    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
})
