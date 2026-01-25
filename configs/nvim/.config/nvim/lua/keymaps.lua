-- Avoids space being used in normal mode which causes some weirdness when using space as a leader
vim.keymap.set("", "<Space>", "<Nop>")

vim.g.mapleader = " "
-- leader + PV opens explorer
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>", {
	desc = "Open Oil (project view)",
})
-- File finder
vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").combine({ pickers = "oldfiles;git_files" })
end)
-- File home. Look for file in all of home dir
vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").files({
		cwd = vim.env.HOME,
		prompt = "Home ❯ ",
		fd_opts = "--ignore-file ~/.config/fd/ignore",
		hidden = false,
	})
end, { desc = "FZF: Search files in HOME" })
-- File search
vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep({ resume = true })
end)

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")

-- Make sure that default delete won't act as cut. So text won't go to clipboard
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')
-- Scroll half page with Control + J + "zz" which centers the buffer on the cursor. Makes scrolling simpler
vim.keymap.set("n", "<C-J>", "<C-D>zz")
-- Scrop up half a page with Control + K + "zz" which centers the buffer on the cursor. Makes scrolling simpler
vim.keymap.set("n", "<C-K>", "<C-U>zz")
-- Both in normal and visual mode, Shift + d acts as default d so it acts
-- as cutting moving the text to clipboard
vim.keymap.set("n", "D", "d")
vim.keymap.set("n", "DD", "dd")
vim.keymap.set("v", "D", "d")
vim.keymap.set("v", "DD", "dd")

vim.keymap.set("n", "cc", "gcc", { remap = true })
vim.keymap.set("v", "cc", "gcc", { remap = true })
-- vim.keymap.set("n", "gd", "gri", { remap = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { remap = true })

-- Code action if kind is quickfix
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action({
		filter = function(action, client)
			local kind = action.kind

			if kind and kind:find("quickfix", 1, true) then
				return true
			end

			return false
		end,
	})
end, { noremap = true, silent = true })
-- Diagnostics
vim.keymap.set("n", "H", "<cmd>lua vim.diagnostic.open_float()<CR>")

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	callback = function()
		vim.wo.winhighlight = "Normal:Normal,NormalNC:NormalNC"
	end,
})

vim.keymap.set("n", "<leader>w", function()
	vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle line wrap" })

-- Clear the search register to stop highlight
vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
	vim.fn.setreg("/", "")
end, { silent = true })

vim.keymap.set("n", "<leader>a", function()
	local harpoon = require("harpoon")
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-1>", function()
	local harpoon = require("harpoon")
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-2>", function()
	local harpoon = require("harpoon")
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-3>", function()
	local harpoon = require("harpoon")
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-4>", function()
	local harpoon = require("harpoon")
	harpoon:list():select(4)
end)
