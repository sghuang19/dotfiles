return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- requires imagemagick, ueberzugpp and config, and tmux config
		{ "3rd/image.nvim", build = false, opts = {} },
	},
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
