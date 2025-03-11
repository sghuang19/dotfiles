---@type LazySpec
return {
	"folke/which-key.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy", -- we still need the help to popup
	keys = {
		{
			"<Leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	---@module "which-key"
	---@type wk.Config
	---@diagnostic disable-next-line: missing-fields
	opts = {
		preset = "helix",
		delay = function(ctx)
			return ctx.plugin and 0 or 500
		end,
		keys = {
			scroll_down = "<Down>",
			scroll_up = "<Up>",
		},
	},
}
