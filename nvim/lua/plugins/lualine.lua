---@type LazySpec
return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = { "BufRead", "BufNewFile" },
	opts = {
		options = {
			theme = "gruvbox-material",
			extensions = {
				"aerial",
				"fugitive",
				"lazy",
				"mason",
				"neo-tree",
				"toggleterm",
			},
		},
	},
	init = function()
		vim.opt.laststatus = 3 -- lualine spans whole window
	end,
}
