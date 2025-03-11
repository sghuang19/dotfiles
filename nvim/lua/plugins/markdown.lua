local OBSIDIAN_VAULT = vim.fn.resolve(vim.fn.expand("~/obsidian"))

return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
			"jbyuki/nabla.nvim",
		},
		cmd = "RenderMarkdown",
		ft = "markdown",
		opts = {
			render_modes = true,
			completions = { lsp = { enabled = true } },
			win_options = { conceallevel = { rendered = 2 } },
			-- handover math rendering to nabla
			latex = { enabled = false },
			on = {
				attach = function()
					-- must be called after render-markdown is attached
					require("nabla").enable_virt({ autogen = true })
				end,
			},
		},
	},
	-- { "Thiago4532/mdmath.nvim", build = "brew install librsvg" },
	{
		"jbyuki/nabla.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.configs").setup({ ensure_installed = "latex" })
		end,
		keys = {
			{
				"<Leader>m",
				function()
					require("nabla").popup()
				end,
				desc = "Show Nabla [m]ath preview popup",
			},
		},
		cmd = "NablaToggleVirt",
		init = function()
			vim.api.nvim_create_user_command("NablaToggleVirt", function()
				local nabla = require("nabla")
				nabla.toggle_virt()
				print("Nabla " .. (nabla.is_virt_enabled() and "enabled" or "disabled"))
			end, { nargs = 0 })
		end,
	},
	{
		-- mermaid rendering
		"3rd/diagram.nvim",
		build = "bun install -g @mermaid-js/mermaid-cli",
		dependencies = "3rd/image.nvim",
		ft = "markdown",
		cond = false, -- currently not working due to a bug
		config = function()
			require("diagram").setup({
				integrations = { require("diagram.integrations.markdown") },
			})
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
			{ "<leader>oo", "<Cmd>ObsidianOpen<CR>", desc = "[O]pen note in [O]bsidian" },
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
		event = { "BufReadPost " .. OBSIDIAN_VAULT .. "/*.md" },
		opts = {
			ui = { enable = false }, -- use render-markdown instead
			workspaces = { { name = "TECH", path = OBSIDIAN_VAULT } },
			disable_frontmatter = true,
			open_app_foreground = true,
			picker = { "telescope.nvim" },
			mappings = {}, -- disable default mappings
		},
	},
	{ "ellisonleao/glow.nvim", opts = {}, cmd = "Glow" },
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]() -- more robust than yarn install
		end,
		ft = "markdown", -- cannot load lazier since the commands are not global
		keys = {
			{ "<C-s>", "<Plug>MarkdownPreview", desc = "Start Markdown preview" },
			{ "<M-s>", "<Plug>MarkdownPreviewStop", desc = "Stop Markdown preview" },
			{ "<C-p>", "<Plug>MarkdownPreviewToggle", desc = "Toggle Markdown preview" },
		},
	},
}
