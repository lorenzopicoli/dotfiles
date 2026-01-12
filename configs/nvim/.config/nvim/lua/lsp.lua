-- ~/.config/nvim-new/lua/lsp.lua
vim.lsp.enable({
  "lua_ls",
  "ts_ls",
})
vim.diagnostic.config({ virtual_text = true })

vim.lsp.config('lua_ls', 
)

vim.lsp.config('ts_ls', {})
