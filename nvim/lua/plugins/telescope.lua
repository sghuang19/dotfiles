return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"polirritmico/telescope-lazy-plugins.nvim",
	},
	build = "brew install rg fd", -- for extended functionality
	cmd = "Telescope",
	keys = {
		-- custom mappings
		{ "<leader>t", "<cmd>Telescope<cr>" },
		-- recommended by Telescope
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope find files" },
		{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Telescope live grep" },
		{ "<leader>fb", require("telescope.builtin").buffers, desc = "Telescope buffers" },
		{ "<leader>fh", require("telescope.builtin").help_tags, desc = "Telescope help tags" },
	},
	opts = {
		defaults = { layout_config = { horizontal = {
			preview_cutoff = 30,
			preview_width = 0.8,
		} } },
	},
	config = function()
		for _, e in ipairs({ "fzf", "lazy_plugins" }) do
			require("telescope").load_extension(e)
		end
	end,
}
