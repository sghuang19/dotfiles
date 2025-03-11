---@type LazySpec
return {
	"nvimdev/dashboard-nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = vim.fn.argc() ~= 0, -- load lazily if opening a dir entry
	cmd = "Dashboard",
	init = function()
		-- TODO: somehow the default start screen is flashed
		vim.opt.shortmess:append("I") -- disables the msg as a workaround
	end,
	opts = {
		hide = { statusline = true },
		config = {
			week_header = { enable = true },
			footer = { "", " 尽心，知性，知天" },
			shortcut = {
				{
					key = "g",
					icon = " ",
					desc = "GitHub",
					group = "@property",
					action = "!open https://github.com/sghuang19/",
				},
				{
					icon = " ",
					desc = "Files",
					group = "@number",
					action = "Telescope find_files",
					key = "f",
				},
				{
					icon = " ",
					desc = "Dots",
					group = "@label",
					action = "Neotree current dir=~/dev/dotfiles",
					key = "d",
				},
				{
					icon = "󰒲 ",
					desc = "Lazy",
					group = "@string",
					action = "Lazy",
					key = "l",
				},
				{
					icon = " ",
					desc = "Obsidian",
					group = "@attribute",
					action = "Neotree current dir=~/obsidian",
					key = "o",
				},
			},
		},
	},
	config = function(_, opts)
		require("dashboard").setup(opts)
	end,
}
