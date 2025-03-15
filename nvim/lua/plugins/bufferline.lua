---@type LazySpec
return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufEnter",
	init = function()
		vim.opt.termguicolors = true
		vim.opt.mousemoveevent = true
	end,
	opts = {
		---@module "bufferline"
		---@type bufferline.Options
		options = {
			separator_style = "slope",
			hover = { enabled = true, reveal = { "close" } },
		},
	},
}
