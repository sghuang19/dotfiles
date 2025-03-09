-- requires imagemagick and tmux config
return {
	"3rd/image.nvim",
	build = "brew install imagemagick",
	cond = not vim.g.neovide, -- not supported in neovide yet
	lazy = true, -- delay until needed
	opts = { processor = "magick_cli" },
}
