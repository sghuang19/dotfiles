return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	event = { "BufWritePre" }, -- in case format on save
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			desc = "Format document",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			markdown = { "markdownlint-cli2", "prettier" },
			-- python = { "black" },
			-- ["*"] = { "codespell" },
			["_"] = { "prettier" },
		},
		format_options = {
			async = false,
			lsp_fallback = true,
		},
	},
}
