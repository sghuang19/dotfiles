return {
	{
		"williamboman/mason.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"cssls",
					"html",
					"jsonls",
					"lua_ls",
					"ruff",
					"ts_ls",
					"unocss",
					"volar",
				},
			})
			require("mason-lspconfig").setup_handlers({
				function(server)
					require("lspconfig")[server].setup({})
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				--Linters
				"markdownlint-cli2",
				"stylua",
				--Formatters
				"prettier",
				"prettierd",
				"shfmt",
			},
			auto_update = true,
		},
	},
}
