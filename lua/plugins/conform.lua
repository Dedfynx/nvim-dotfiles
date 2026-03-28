return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			rust = { "rustfmt" },
			asm = { "asmfmt" },
			nasm = { "asmfmt" },
			s = { "asmfmt" },
		},
		formatters = {
			["clang-format"] = {
				prepend_args = {
					"--style={ \
        				BasedOnStyle: Google, \
        				SortIncludes: false, \
        				ColumnLimit: 0, \
        				AllowShortFunctionsOnASingleLine: All, \
        				IndentWidth: 4, \
        				NamespaceIndentation: All, \
        				AlignAfterOpenBracket: DontAlign \
      					}",
				},
			},
			prettier = {
				prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
			},
			prettierd = {
				prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
			},
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
}
