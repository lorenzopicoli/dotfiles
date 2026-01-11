-- ~/.config/nvim-new/lua/plugins.lua
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/stevearc/oil.nvim.git" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/rachartier/tiny-code-action.nvim" },
})

require("mini.icons").setup()
require("gitsigns").setup({ signcolumn = false })
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "stylua", "lua_ls", "ts_ls", "biome" },
})
require("nvim-autopairs").setup({})
require("lualine").setup({
	options = { theme = "gruvbox" },
})
require("fzf-lua").setup({ "fzf-native" })
require("tiny-code-action").setup()

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true,
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	max_file_length = 40000,
})

require("blink.cmp").setup({
	keymap = { preset = "enter" },

	appearance = {
		nerd_font_variant = "mono",
	},

	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
		"size",
	},
	delete_to_trash = true,
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,
	},
	keymaps = {
		-- Show previews on the right most pane and toggle it with Control P
		-- https://github.com/stevearc/oil.nvim/issues/454
		["<C-p>"] = {
			callback = function()
				local oil = require("oil")
				local util = require("oil.util")
				local entry = oil.get_cursor_entry()
				if not entry then
					vim.notify("Could not find entry under cursor", vim.log.levels.ERROR)
					return
				end
				local winid = util.get_preview_win()
				if winid then
					local cur_id = vim.w[winid].oil_entry_id
					if entry.id == cur_id then
						vim.api.nvim_win_close(winid, true)
						if util.is_floating_win() then
							local layout = require("oil.layout")
							local win_opts = layout.get_fullscreen_win_opts()
							vim.api.nvim_win_set_config(0, win_opts)
						end
						return
					end
				end
				oil.open_preview({ vertical = true, split = "botright" })
			end,
		},
	},
})
