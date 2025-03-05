return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			theme = "gruvbox-material",
			extensions = { "mason", "neo-tree" },
		},
	},
	init = function()
		vim.opt.laststatus = 3 -- lualine spans whole window
	end,
}
