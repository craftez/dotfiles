return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nevim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"telescope-dap.nvim",
		"nvim-telescope/telescope-frecency.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")

		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["esc"] = actions.close,
					},
				},
				file_ignore_patterns = {
					"codegen.ts",
					".git",
					"lazy-lock.json",
					"*-lock.yaml",
					"node_modules",
					"%.lock",
				},
				dynamic_preview_title = true,
				path_display = { "smart" },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			layout_config = {
				horizontal = {
					preview_cutoff = 100,
					preview_width = 0.5,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				frecency = {
					default_workspace = "CWD",
					show_scores = true,
					show_unindexed = true,
					disable_devicons = false,
					ignore_patterns = {
						"*.git/*",
						"*/tmp/*",
						"*/lua-language-server/*",
					},
				},
			},
		})

		local wk = require("which-key")
		wk.register({
			f = {
				name = "+Find/Files",
				p = { builtin.lsp_document_symbols, "Document Symbols" },
				P = { builtin.lsp_dynamic_workspace_symbols, "Workspace Symbols" },
				f = { builtin.find_files, "Find Files" },
				a = {
					function()
						builtin.find_files({ follow = true, no_ignore = true, hidden = true })
					end,
					"Find Files (all)",
				},
				b = { builtin.buffers, "Open buffers" },
				z = { builtin.frecency, "Frecency" },
				-- Search
				h = { builtin.help_tags, "Find Help" },
				H = { builtin.highlights, "Find highlight groups" },
				M = { builtin.man_pages, "Man Pages" },
				o = { builtin.oldfiles, "Open Recent File" },
				R = { builtin.registers, "Registers" },
				t = { builtin.live_grep, "Live Grep" },
				T = { builtin.grep_string, "Grep String" },
				k = { builtin.keymaps, "Keymaps" },
				C = { builtin.commands, "Commands" },
				l = { builtin.resume, "Resume Last Search" },
				d = {
					name = "+Dap",
					c = { "<CMD>Telescope dap comamnds<CR>", "Dap Commands" },
					b = { "<CMD>Telescope dap list_breakpoints<CR>", "Dap Breakpoints" },
					s = { "<CMD>Telescope dap configurations<CR>", "Dap Configurations" },
					v = { "<CMD>Telescope dap variables<CR>", "Dap Variables" },
					f = { "<CMD>Telescope dap frames<CR>", "Dap Frames" },
				},
			},
			l = {
				i = { builtin.lsp_implementations, "Implementation" },
				w = { builtin.diagnostics, "Diagnostics" },
			},
			g = {
				s = { builtin.git_status, "Status" },
				b = { builtin.git_branches, "Branches" },
				c = { builtin.git_commits, "Commits" },
				h = { builtin.git_bcommits, "File history" },
				S = { builtin.git_stash, "Stash" },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})

		local telescope = require("telescope")
		telescope.load_extension("fzf")
		telescope.load_extension("dap")
		telescope.load_extension("frecency")
	end,
}
