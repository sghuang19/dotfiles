-- EDITTING TOOLS

return {
	{ "tpope/vim-unimpaired", event = { "BufRead", "BufNewFile" } },
	{ "tpope/vim-commentary", event = { "BufRead", "BufNewFile" } },
	{ "kylechui/nvim-surround", event = { "BufRead", "BufNewFile" }, opts = {} },
	{
		"mbbill/undotree",
		keys = {
			{ "<Leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [u]ndo tree" } },
		},
		cmd = { "UndotreeToggle", "UndotreeShow" },
		config = function()
			vim.g.undotree_WindowLayout = 2
		end,
	},
	-- TODO: need to compare more align plugins
	{
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
