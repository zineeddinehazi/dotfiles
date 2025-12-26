return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					-- Go
					"gopls",
					-- Web
					"html",
					"cssls",
					"tailwindcss",
					-- JS/TS (+ JSX/TSX via react filetypes)
					"ts_ls",
					-- Lint
					"eslint",
				},
				automatic_installation = true,
			},
		},

		-- Optional but recommended: if you use blink.cmp, this integrates LSP capabilities
	},
	config = function()
		-- Capabilities (completion integration)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local ok_blink, blink = pcall(require, "blink.cmp")
		if ok_blink and blink.get_lsp_capabilities then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		-- Define/customize configs (Nvim 0.11+)
		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})

		vim.lsp.config("html", {
			capabilities = capabilities,
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
		})

		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			filetypes = {
				"html",
				"css",
				"javascript",
				"javascriptreact", -- jsx
				"typescript",
				"typescriptreact", -- tsx
			},
		})

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})

		vim.lsp.config("eslint", {
			capabilities = capabilities,
			on_attach = function(_, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		-- Enable servers (Nvim 0.11+)
		vim.lsp.enable({
			"gopls",
			"html",
			"cssls",
			"tailwindcss",
			"ts_ls",
			"eslint",
		})
	end,
}
