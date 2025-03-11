return {
	{ "folke/lazydev.nvim", ft = "lua" },
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				default = { "lazydev" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- prioritize lazydev
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
