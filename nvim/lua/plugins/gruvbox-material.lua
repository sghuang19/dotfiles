return {
	"sainnhe/gruvbox-material",
	-- event = "VimEnter",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_transparent_background = 2
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
