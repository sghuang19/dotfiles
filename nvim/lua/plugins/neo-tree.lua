return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- requires imagemagick, ueberzugpp and config, and tmux config
		-- { "3rd/image.nvim", build = false, opts = {} },
	},
	-- load lazily if no directory is opened
	lazy = vim.fn.argc() == 0 or vim.fn.filereadable(vim.fn.argv(0)) == 1,
	cmd = "Neotree",
	opts = {
		window = {
			width = 25,
			mappings = {
				["P"] = { "toggle_preview", config = {
					use_image_nvim = true,
				} },
			},
		},
	},
}
