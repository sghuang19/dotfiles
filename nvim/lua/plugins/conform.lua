---@type {[string]: string[]}
local formatters_by_ft = {
	fish = { "fish_indent" },
	lua = { "stylua" },
	markdown = { "markdownlint-cli2", "prettierd" },
	python = { "ruff" },
	["_"] = { "trim_whitespace", "trim_newlines" },
}

for _, ft in ipairs({ "sh", "zsh" }) do
	formatters_by_ft[ft] = { "shfmt" }
end

for _, ft in ipairs({ "javascript", "typescript", "vue" }) do
	formatters_by_ft[ft] = { "prettierd" }
end

---@type LazySpec
return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	event = "BufWritePre", -- in case format on save
	keys = {
		{
			"<Leader>cf", -- avoid prefix conflict with Telescope
			function()
				require("conform").format()
			end,
			desc = "[c]ode [f]ormat (Conform)",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = formatters_by_ft,
		format_options = { async = true, lsp_fallback = true },
	},
	config = function(_, opts)
		require("conform").setup(opts)
		require("conform").formatters.prettierd = {
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("$DOTS/.prettierrc.yaml"),
			},
		}
	end,
}
