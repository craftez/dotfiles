local M = {
	"LukasPietzschmann/telescope-tabs",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>aa"] = {
			"<CMD>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode = 'normal', prompt_title = 'Tabs'})<CR>",
			"Find Tabs",
		},
	})

	require("telescope-tabs").setup({
		show_preview = false,
		close_tab_shortcut_i = "<C-d>",
		close_tab_shortcut_n = "dd",
		entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
			local entry_string = table.concat(file_names, ",")
			return string.format("%d: %s%s", tab_id, entry_string, is_current and " " or "")
		end,
	})
end

return M
