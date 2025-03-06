-- Basic settings
local options = {
	tabstop = 4,
	shiftwidth = 4,
	number = true,
	relativenumber = true,
	mouse = "a",
	colorcolumn = "80",
	termguicolors = true,
	signcolumn = "yes",
	foldmethod = "syntax",
	incsearch = true,
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Key mappings
local keymaps = {
	-- mode, key, command, options
	{ "n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true } },
	{ "n", "<F5>", ":UndotreeToggle<CR>", { noremap = true } },
}
for _, map in ipairs(keymaps) do
	vim.keymap.set(unpack(map))
end

-- Plugin-specific settings
vim.g.gitgutter_highlight_linenrs = 1
vim.g.gitgutter_set_sign_background = 1
vim.g.vim_markdown_math = 1

-- Highlight linking
vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
