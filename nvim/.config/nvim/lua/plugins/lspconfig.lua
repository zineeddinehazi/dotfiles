return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- UPDATED: Use the new 'mason-org' repo instead of 'williamboman'
			{ "mason-org/mason.nvim", config = true },
			"mason-org/mason-lspconfig.nvim",

			-- Capability Provider (for suggestions)
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- 1. PREPARE CAPABILITIES (Suggestions)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			if has_cmp then
				capabilities = cmp_lsp.default_capabilities()
			end

			-- 2. PREPARE ON_ATTACH (Keymaps & Settings)
			local on_attach = function(client, bufnr)
				-- Auto-format on save (optional)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end

				-- Toggle Inlay Hints (Golang specific)
				if client.supports_method("textDocument/inlayHint") then
					vim.keymap.set("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(
						not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
					end, { buffer = bufnr, desc = "[T]oggle [H]ints" })
				end
			end

			-- 3. SETUP MASON-LSPCONFIG (Using new native API)
			-- Note: mason-lspconfig 2.0+ automates 'vim.lsp.enable'
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls" },
				handlers = {
					-- Default Handler
					function(server_name)
						-- The 'lspconfig' plugin bridge is still required to
						-- translate Mason paths to Neovim's config.
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach,
						})
					end,

					-- Gopls Specific Handler
					["gopls"] = function()
						require("lspconfig").gopls.setup({
							capabilities = capabilities,
							on_attach = on_attach,
							cmd = { "gopls" },
							filetypes = { "go", "gomod", "gowork", "gotmpl" },
							root_markers = { "go.work", "go.mod", ".git" },
							settings = {
								gopls = {
									completeUnimported = true,
									usePlaceholders = true,
									analyses = {
										unusedparams = true,
										shadow = true,
										nilness = true,
										unusedwrite = true,
									},
									staticcheck = true,
									gofumpt = true,
									hints = {
										assignVariableTypes = true,
										compositeLiteralFields = true,
										parameterNames = true,
									},
								},
							},
						})
					end,
				}
			})
		end
	}
}
