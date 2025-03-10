return {
	-- Project management

	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = { "BufRead", "BufNewFile" },
		opts = {}, -- required
	},
	{
		-- TODO: need to figure this out
		"LintaoAmons/bookmarks.nvim",
		dependencies = {
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope.nvim",
			"stevearc/dressing.nvim", -- optional: better UI
		},
		event = { "BufRead", "BufNewFile" }, -- needed for bookmarks rendering
		cmd = {
			"BookmarksCommands",
			"BookmarksGrep",
			"BookmarksInfo",
			"BookmarksLists",
			"BookmarksNewLists",
			"BookmarksQuery",
		},
		config = function()
			require("bookmarks").setup() -- required for DB initailization
		end,
	},

	-- Language support

	{
		"github/copilot.vim",
		cmd = "Copilot",
		event = "InsertEnter",
		-- TODO: is this really needed?
		config = function()
			vim.g.copilot_filetypes = { ["*"] = true }
		end,
	},
	{
		-- TODO: evaluate this plugin
		"ludovicchabant/vim-gutentags",
		event = { "BufRead", "BufNewFile" },
	},
	{
		-- provides context breadcrumbs, symbols outline, etc
		-- TODO: better key binding since this is helpful
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "LspAttach",
		opts = { lightbulb = { enable = false } }, -- takes up to much space
	},
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		-- FIXME: need to remap this, Aerial jumps based on function only
		keys = {
			{ "{", "<Cmd>AerialPrev<CR>" },
			{ "}", "<Cmd>AerialNext<CR>" },
		},
		cmd = {
			"AerialInfo",
			"AerialNavOpen",
			"AerialNavToggle",
			"AerialOpen",
			"AerialOpenAll",
			"AerialToggle",
		},
		opts = {}, -- required
	},

	-- Editing tools

	-- TODO: need to figure out how to use these plugins
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{ "tpope/vim-unimpaired", event = "VeryLazy" },
	{
		-- TODO: need to compare more align plugins
		"echasnovski/mini.align",
		opts = {},
	},
	-- TODO: nvim-autopairs
	-- TODO: vim-sleuth

	-- Misc

	{ "tpope/vim-sensible", event = "VimEnter" },
	{
		-- TODO: figure this out
		"easymotion/vim-easymotion",
		keys = { "<Leader><Leader>" },
	},
	{
		-- TODO: doesn't work in terminal window, create an issue
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<C-h>", "<Cmd><C-U>TmuxNavigateLeft<CR>" },
			{ "<C-j>", "<Cmd><C-U>TmuxNavigateDown<CR>" },
			{ "<C-k>", "<Cmd><C-U>TmuxNavigateUp<CR>" },
			{ "<C-l>", "<Cmd><C-U>TmuxNavigateRight<CR>" },
		},
	},
	{
		-- TODO: the naviations after entering Zen mode doesn't persist, the
		-- status line are also showing up when exiting neo-tree, create issue
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = { { "<Leader>z", "<Cmd>ZenMode<CR>", desc = "Toggle [Z]en Mode" } },
		opts = {
			plugins = {
				options = { laststatus = 0 }, -- hide statusline
				tmux = { enabled = true },
				kitty = { enabled = true, font = "+4" },
				wezterm = { enabled = true, font = "+4" },
				neovide = {
					enabled = true,
					scale = 1.2,
					disable_animations = false,
				},
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		-- FIXME: first invocation of key map doesn't work sometimes
		keys = "<C-\\>",
		opts = { open_mapping = [[<C-\>]] },
	},
	{
		"sitiom/nvim-numbertoggle",
		event = "InsertEnter",
		init = function()
			vim.opt.number = true
			vim.opt.relativenumber = true
		end,
	},
	{ "echasnovski/mini.animate", cond = not vim.g.neovide, opts = {} },
}
