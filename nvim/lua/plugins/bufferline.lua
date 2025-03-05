return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			separator_style = "slope",
			hover = {
				enabled = true,
				reveal = { "close" },
			},
		},
	},
	init = function()
		vim.opt.termguicolors = true
		vim.opt.mousemoveevent = true
	end,
}
