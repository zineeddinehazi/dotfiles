return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					-- Go / Lua
					"gopls",
					"lua_ls",

					--[[ 
					-- Web
					"html",
					"cssls",
					"tailwindcss",
					-- JS/TS (+ JSX/TSX via react filetypes)
					"ts_ls",
					-- Lint
					"eslint",
					]]
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

		--[[ 
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

		vim.api.nvim_create_user_command("EslintFixAll", function()
			local bufnr = vim.api.nvim_get_current_buf()

			-- Find an attached eslint client for this buffer
			local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })
			local client = clients[1]
			if not client then
				vim.notify("eslint LSP not attached", vim.log.levels.WARN)
				return
			end

			-- Ask eslint-language-server to apply all fixes for this file
			client.request("workspace/executeCommand", {
				command = "eslint.applyAllFixes",
				arguments = {
					{
						uri = vim.uri_from_bufnr(bufnr),
					},
				},
			}, nil, bufnr)
		end, {})
		]]

		-- Enable servers (Nvim 0.11+)
		vim.lsp.enable({
			"gopls",
			"lua_ls",

			--[[ 
			"html",
			"cssls",
			"tailwindcss",
			"ts_ls",
			"eslint",
			]]
		})
	end,
}
