return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"unocss",
			},
			automatic_installation = true,
		})
		require("mason-lspconfig").setup_handlers({
			function(server)
				require("lspconfig")[server].setup({})
			end,
		})
	end,
}
