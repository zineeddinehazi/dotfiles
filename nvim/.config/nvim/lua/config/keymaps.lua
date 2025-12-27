local map = vim.keymap.set

-- Panel/window navigation (splits)
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Code actions / hover docs
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
		map("n", "D", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
		map(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "Code actions" })
		)
	end,
})
