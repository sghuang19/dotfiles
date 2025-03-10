# Guidelines for NeoVim Config

- Use Vim script, unless Lua does it absolutely better.
- If in Lua, use NeoVim API whenever possible (avoid `vim.cmd()`).
- If a plugin doesn't need config (e.g. `plenary.nvim`), or only one plugin
  depends on it (e.g. `twilight.nvim`), put it in the spec of the plugin that
  depends on it.
- Use defaults and recommended settings as much as possible.
- Try to make specs self-contained. For example, if plugin A tweaks a config of
  plugin B, try to put that tweak inside spec of plugin A instead of B.
- Group plugins that offer similar functionalities into one Lua file, until it
  becomes too long.
- Document each non-obvious config decision.
- Use `opts` variable to reduce levels of indentation, unless `opts` is small.
- If explicit `setup()` is needed, use `opts = {}` instead of `config = true`,
  according to [documentation](https://lazy.folke.io/spec#spec-setup).
- Describe every kep mapping, and emphasize the mnemonics, e.g. `af` is
  described by `Select [a] [f]unction`
- When specifying key mappings, minic NeoVim documentation style to capitalize
  key names, i.e. prefer `<Leader>`, `<C-v>`, `<Cmd>`, and `<CR>`.
