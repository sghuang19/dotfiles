return {
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		keys = "<c-\\>",
		opts = { open_mapping = [[<c-\>]] },
	},
	{
		"sitiom/nvim-numbertoggle",
		event = "InsertEnter",
		init = function()
			vim.opt.number = true
			vim.opt.relativenumber = true
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "BufEnter",
		opts = { duration_multiplier = "0.8" },
	},
	-- Project management
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufRead", "BufNewFile" },
		opts = {},
	},
	{
		"LintaoAmons/bookmarks.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua" },
			{ "nvim-telescope/telescope.nvim" },
			{ "stevearc/dressing.nvim" }, -- optional: better UI
		},
		event = { "BufRead", "BufNewFile" },
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

	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "{", "<cmd>AerialPrev<cr>" },
			{ "}", "<cmd>AerialNext<cr>" },
			{ "<leader>a", "<cmd>AerialToggle<cr>" },
		},
		cmd = {
			"AerialInfo",
			"AerialNavOpen",
			"AerialNavToggle",
			"AerialOpen",
			"AerialOpenAll",
			"AerialToggle",
		},
		opts = {}, -- required for setup
	},

	-- Language support
	{
		"github/copilot.vim",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			vim.g.copilot_filetypes = { ["*"] = true }
		end,
	},
	{
		"ludovicchabant/vim-gutentags",
		event = { "BufRead", "BufNewFile" },
	},

	-- Editing tools
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{ "tpope/vim-unimpaired", event = "VeryLazy" },

	-- General
	{ "tpope/vim-sensible", event = "VimEnter" },
	{ "easymotion/vim-easymotion", keys = { "<leader><leader>" } },
	{
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		},
	},
	{
		-- provides context breadcrumbs, symbols outline, etc
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "LspAttach",
		opts = { lightbulb = { enable = false } },
	},
	{
		"nvimdev/dashboard-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
		opts = {
			hide = { statusline = true },
			config = {
				week_header = { enable = true },
				footer = { "", " 尽心，知性，知天" },
				shortcut = {
					{
						key = "g",
						icon = " ",
						desc = "GitHub",
						group = "@property",
						action = "!open https://github.com/sghuang19/",
					},
					{
						icon = " ",
						desc = "Files",
						group = "@number",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						desc = "Dots",
						group = "@label",
						action = "Neotree current dir=~/dev/dotfiles",
						key = "d",
					},
					{
						icon = "󰒲 ",
						desc = "Lazy",
						group = "@string",
						action = "Lazy",
						key = "l",
					},
					{
						icon = " ",
						desc = "Obsidian",
						group = "@attribute",
						action = "Neotree current dir=~/obsidian",
						key = "o",
					},
				},
			},
		},
		config = function(_, opts)
			require("dashboard").setup(opts)
		end,
	},
}
