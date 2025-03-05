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
			markdown = { "markdownlint-cli2", "prettierd" },
			python = { "ruff" },
			["_"] = { "prettierd" },
		},
		format_options = {
			async = true,
			lsp_fallback = true,
		},
	},
}
