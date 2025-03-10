-- Editing tools

return {
	-- TODO: need to figure out how to use these plugins
	{ "mbbill/undotree", cmd = "UndotreeToggle" },

	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{ "tpope/vim-unimpaired", event = "VeryLazy" },

	{
		-- TODO: need to compare more align plugins
		"echasnovski/mini.align",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = function()
			local ft = { "astro", "html", "jsx", "md", "tsx", "vue", "xml" }
			return "InsertEnter *.{" .. table.concat(ft, ",") .. "}"
		end,
		opts = {}, -- required
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { check_ts = true, fast_wrap = {} },
	},
	-- TODO: vim-sleuth
}
