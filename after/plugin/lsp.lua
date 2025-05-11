-- Make sure mason and mason-lspconfig are set up
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",  -- Rust
    "julia-lsp",      -- Julia
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
local lsp = require('lsp-zero')
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


-- hot keys that will be used if part of LSP
lsp.on_attach(function (client, bufnr)
	print("help")
   local opts = {buffer = bufnr, remap = false}

   vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
