return {
	{ "sitiom/nvim-numbertoggle" },
	{
		"karb94/neoscroll.nvim",
		opts = { duration_multiplier = "0.8" },
	},
	-- Project management
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
	},
	{
		"airblade/vim-gitgutter",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"MattesGroeger/vim-bookmarks",
		event = "VeryLazy",
	},
	{
		"preservim/tagbar",
		cmd = "TagbarToggle",
	},

	-- Language support
	{
		"github/copilot.vim",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		"ludovicchabant/vim-gutentags",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"godlygeek/tabular",
		cmd = "Tabularize",
	},
	{
		"preservim/vim-markdown",
		ft = "markdown",
		dependencies = { "godlygeek/tabular" },
	},

	-- Editing tools
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{ "tpope/vim-unimpaired", event = "VeryLazy" },
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "javascript" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- General
	{ "tpope/vim-sensible", priority = 1000 }, -- Load early
	{
		"easymotion/vim-easymotion",
		keys = { "<leader><leader>" },
	},
	{ "christoomey/vim-tmux-navigator" },
}
