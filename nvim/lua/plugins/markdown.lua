local obsidian_path = vim.fn.resolve(vim.fn.expand("~/obsidian"))

return {
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]() -- more robust than yarn install
		end,
		cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
		keys = {
			{ "<C-s>", "<Plug>MarkdownPreview", desc = "Start Markdown preview" },
			{ "<M-s>", "<Plug>MarkdownPreviewStop", desc = "Stop Markdown preview" },
			{ "<C-p>", "<Plug>MarkdownPreviewToggle", desc = "Toggle Markdown preview" },
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = "RenderMarkdown",
		ft = "markdown",
		opts = {
			completions = { lsp = { enabled = true } },
			-- handover math rendering to nabla
			latex = { enabled = false },
			win_options = { conceallevel = { rendered = 2 } },
		},
	},
	-- { "Thiago4532/mdmath.nvim" }, -- no support for iTerm2 yet
	{
		"jbyuki/nabla.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = { ensure_installed = "latex" },
		},
		ft = "markdown",
		config = function()
			require("nabla").enable_virt({ autogen = true })
		end,
	},
	{
		-- this plugin is oriented for Zettelkasten/all-in-one method
		"epwalsh/obsidian.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
		cmd = {
			"ObsidianCheck",
			"ObsidianDebug",
			"ObsidianNew",
			"ObsidianNewFromTemplate",
			"ObsidianQuickSwitch",
		},
		keys = {
			{
				"gf",
				function()
					if require("obsidian").util.cursor_on_markdown_link() then
						return "<cmd>ObsidianFollowLink<CR>"
					else
						return "gf"
					end
				end,
				noremap = false,
				expr = true,
				desc = "Follow Obsidian link",
			},
		},
		event = { "BufReadPost " .. obsidian_path .. "/*.md" },
		opts = {
			ui = { enable = false }, -- use render-markdown instead
			workspaces = { { name = "TECH", path = obsidian_path } },
			disable_frontmatter = true,
			open_app_foreground = true,
			picker = { "telescope.nvim" },
			mappings = {}, -- disable default mappings
		},
	},
}
