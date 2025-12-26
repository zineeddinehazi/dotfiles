return {
	{
		"saghen/blink.cmp",
		version = "*",
		event = "InsertEnter",
		opts = {
			keymap = { preset = "super-tab" },
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
			},
		},
	},
}
