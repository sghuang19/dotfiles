return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = {
		{ "<leader>lg", desc = "LazyGit" },
	},
	config = function()
		vim.g.lazygit_floating_window_scaling_factor = 0.9
	end,
}
