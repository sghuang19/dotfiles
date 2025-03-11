-- EDITTING TOOLS

---@type LazySpec
return {
	{ "tpope/vim-unimpaired", event = { "BufRead", "BufNewFile" } },
	{ "tpope/vim-commentary", event = { "BufRead", "BufNewFile" } },
	{
		-- sets shiftwidth expandtab heuristically
		"tpope/vim-sleuth",
		event = { "BufRead", "BufNewFile" },
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "kylechui/nvim-surround", event = { "BufRead", "BufNewFile" }, opts = {} },
	{
		"mbbill/undotree",
		keys = {
			{
				"<Leader>u",
				vim.cmd.UndotreeToggle,
				{ desc = "Toggle [u]ndo tree" },
			},
		},
		cmd = { "UndotreeToggle", "UndotreeShow" },
		config = function()
			vim.g.undotree_WindowLayout = 2
		end,
	},
	-- TODO: need to compare more align plugins
	{ "echasnovski/mini.align", opts = {} },
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = function()
			local ft = { "astro", "html", "jsx", "md", "tsx", "vue", "xml" }
			-- TODO: type annotation wants this to be an array, create issue
			return { "InsertEnter *.{" .. table.concat(ft, ",") .. "}" }
		end,
		opts = {}, -- required
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { check_ts = true, fast_wrap = {} },
	},
}
