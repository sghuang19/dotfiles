return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- FIXME: this plugin isn't working yet
	},
	-- load lazily if no directory is opened
	lazy = vim.fn.argc() == 0 or vim.fn.filereadable(vim.fn.argv(0)) == 1,
	cmd = "Neotree",
	keys = {
		-- Neotree recommended key mappings
		{
			"\\", -- Neotree recommended / by default, which is used for searching
			"<cmd>Neotree toggle current reveal_force_cwd<cr>",
			desc = "Toggle Neotree (current dir)",
		},
		{
			"|",
			"<cmd>Neotree reveal left<cr>",
			desc = "Reveal file in Neotree",
		},
		{
			"gd",
			":Neotree float reveal_file=<cfile> reveal_force_cwd<cr>",
			desc = "Show file in floating Neotree",
		},
		{
			"<leader>b",
			"<cmd>Neotree toggle show buffers right<cr>",
			desc = "Toggle buffer explorer",
		},
		{
			"<leader>s",
			"<cmd>Neotree toggle float git_status<cr>",
			desc = "Show Git status in Neotree",
		},
	},
	opts = {
		filesystem = { hijack_netrw_behavior = "open_current" },
		window = {
			width = 25,
			mappings = {
				["P"] = { "toggle_preview", config = { use_image_nvim = true } },
			},
		},
	},
}
