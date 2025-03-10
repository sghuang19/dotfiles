return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim",  -- delay until needed
			-- "s1n7ax/nvim-window-picker", -- delay until needed
		},
		-- load eagerly if directory is opened
		lazy = vim.fn.argc() == 0 or vim.fn.filereadable(vim.fn.argv(0)) == 1,
		-- we want :e to always work, which can't be specified with cmd
		event = "VeryLazy",
		keys = {
			-- Neotree recommended key mappings
			{
				"\\", -- Neotree recommends / by default, which is used for searching
				"<Cmd>Neotree toggle current reveal_force_cwd<CR>",
				desc = "Toggle Neotree (current dir)",
			},
			{
				"|",
				"<Cmd>Neotree reveal left<CR>",
				desc = "Reveal file in Neotree",
			},
			{
				"gd",
				"<Cmd>Neotree float reveal reveal_force_cwd<CR>",
				desc = "Show file in floating Neotree",
			},
			{
				"<Leader>b",
				"<Cmd>Neotree toggle show buffers right<CR>",
				desc = "Toggle buffer explorer",
			},
			{
				"<Leader>s",
				"<Cmd>Neotree toggle float git_status<CR>",
				desc = "Show Git status in Neotree",
			},
		},
		opts = {
			filesystem = { hijack_netrw_behavior = "open_current" },
			window = {
				width = 25,
				mappings = {
					["P"] = { "toggle_preview", config = { use_image_nvim = true } },
				},
			},
			source_selector = { winbar = true }, -- statusline is taken
		},
	},
	{
		"s1n7ax/nvim-window-picker",
		lazy = true, -- delay until needed
		opts = {
			hint = "floating-big-letter",
			picker_config = { handle_mouse_click = true },
		},
	},
	{
		-- update import paths when renaming files
		-- FIXME: somehow doesn't work without manually reloading, see
		-- https://github.com/antosha417/nvim-lsp-file-operations/issues/44
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		event = "LspAttach",
		opts = {}, -- required
	},
}
