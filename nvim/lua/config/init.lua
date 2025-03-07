-- Basic settings
local options = {
	tabstop = 4,
	shiftwidth = 4,
	mouse = "a", -- enable mouse in all modes
	termguicolors = true,
	signcolumn = "auto:3",
	colorcolumn = "80,100,120"
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Key mappings
local keymaps = {
	-- mode, key, command, options
	{ "n", "<F5>", ":UndotreeToggle<CR>", { noremap = true } },
}
for _, map in ipairs(keymaps) do
	vim.keymap.set(unpack(map))
end

-- Plugin-specific settings
