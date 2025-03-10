-- TODO: experimental setting, needs improvements

return {
	{
		"saghen/blink.cmp",
		version = "*", -- needed for fuzzy binary downloa
		dependencies = "rafamadriz/friendly-snippets",
		event = "InsertEnter",
		opts = {
			keymap = { preset = "default" },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
		},
	},
	{
		-- FIXME: temporary fix for https://github.com/neovim/nvim-lspconfig/issues/3494
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason-lspconfig.nvim", -- let Mason setup all servers
		},
		events = "VeryLazy",
		opts = { servers = {} },
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local blink = require("blink.cmp")
			for server, config in pairs(opts.servers) do
				config.capabilities = blink.get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
