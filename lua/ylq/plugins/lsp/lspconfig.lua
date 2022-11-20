local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

-- enable keybinds for avaiable lsp server
local on_attach = function(client, bufnr)
    local opts = {noremap = true, silent = true, buffer = bufnr }
    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsage lsp_finder<CR>", opts)
    keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap.set("n", "gD", "<cmd>Lspsage peek_definition<CR>", opts)
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig['clangd'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['pyright'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['jsonls'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig['sumneko_lua'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
      Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {globals = {"vim"}, },
          -- make language server aware of runtime files
          workspace = {library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.stdpath("config") .. "/lua"] = true}}
      }
  }
})

lspconfig['dockerls'].setup({
  capabilities = capabilities,
  on_attach = on_attach
})
