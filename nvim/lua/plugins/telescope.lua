---@type LazySpec
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
		{ "<Leader>t", "<Cmd>Telescope<CR>", desc = "Open [t]elescope" },
		-- recommended by Telescope
		{
			"<leader>ff",
			require("telescope.builtin").find_files,
			desc = "[f]ind [f]iles (Telescope)",
		},
		{
			"<leader>fg",
			require("telescope.builtin").live_grep,
			desc = "[l]ive [g]rep (Telescope)",
		},
		{
			"<leader>fb",
			require("telescope.builtin").buffers,
			desc = "[f]ind [b]uffers (Telescope)",
		},
		{
			"<leader>fh",
			require("telescope.builtin").help_tags,
			desc = "[f]ind [h]elp tags (Telescope)",
		},
	},
	---@module "telescope"
	opts = {
		defaults = {
			---@type TelescopeLayout.config
			---@diagnostic disable-next-line: missing-fields
			layout_config = { horizontal = {
				preview_cutoff = 30,
				preview_width = 0.8,
			} },
		},
	},
	config = function()
		for _, e in ipairs({ "fzf", "lazy_plugins" }) do
			require("telescope").load_extension(e)
		end
	end,
}
