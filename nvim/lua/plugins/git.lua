return {
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "airblade/vim-gitgutter", event = { "BufRead", "BufNewFile" } },
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
			"LazyGitLog",
		},
		keys = {
			{ "<leader>lg", ":LazyGit<cr>", desc = "LazyGit" },
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.9
		end,
	},
}
