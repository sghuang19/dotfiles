-- requires imagemagick, ueberzugpp and config, and tmux config
return {
	{
		"3rd/image.nvim",
		build = false,
		cond= false, -- FIXME: this plugin isn't working yet
		opts = {
			backend = "ueberzug",
			processor = "magick_cli",
			rocks = { hererocks = true },
		},
	},
}
