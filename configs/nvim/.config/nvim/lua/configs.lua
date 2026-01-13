-- ~/.config/nvim-new/lua/configs.lua
local opt = vim.opt
opt.colorcolumn = "120" -- Highlight column 80
opt.signcolumn = "yes:1" -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = true -- Ignore case in search
opt.swapfile = false -- Disable swap files
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces for a tab
opt.softtabstop = 2 -- Number of spaces for a tab when editing
opt.shiftwidth = 2 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.listchars = "tab: ,multispace:|   " -- Characters to show for tabs, spaces, and end of line
opt.list = true -- Show whitespace characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.numberwidth = 2 -- Width of the line number column
opt.wrap = false -- Disable line wrapping
opt.cursorline = true -- Highlight the current line
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files
opt.undofile = true -- Enable persistent undo
opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
opt.winborder = "rounded" -- Use rounded borders for windows
opt.hlsearch = true -- Enable highlighting of search results

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation

-- Believe this shares the clipboard with system?
vim.opt.clipboard = "unnamedplus"

vim.o.laststatus = 3
-- Format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		vim.lsp.buf.format()
-- 	end,
-- })
-- Show diagnostics inline
vim.diagnostic.config({ virtual_text = true })
