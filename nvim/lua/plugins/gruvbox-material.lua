return {
	"sainnhe/gruvbox-material",
	config = function()
		vim.g.gruvbox_material_enable_bold = true
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_transparent_background = 2
		vim.g.airline_theme = "gruvbox_material"
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
