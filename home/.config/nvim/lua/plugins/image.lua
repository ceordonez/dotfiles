return {
	"3rd/image.nvim",
	build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
	-- opts = {
	-- 	processor = "magick_cli",
	-- },
	opts = {
		backend = "kitty", -- whatever backend you would like to use
		max_width = nil,
		max_height = nil,
		max_height_window_percentage = math.huge,
		max_width_window_percentage = math.huge,
		window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	},
	config = function()
		require("image").setup({
			-- backend = "kitty", -- or "ueberzug" or "sixel"
			processor = "magick_cli", -- or "magick_rock"
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup", -- or "inline"
					floating_windows = false, -- if true, images will be rendered in floating markdown windows
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
				neorg = {
					enabled = true,
					filetypes = { "norg" },
				},
				typst = {
					enabled = true,
					filetypes = { "typst" },
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
			-- max_width = nil,
			-- max_height = nil,
			-- max_width_window_percentage = math.huge,
			-- max_height_window_percentage = math.huge,
			scale_factor = 1.0,
			-- window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			-- window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
		})
		vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
			pattern = "*.md",
			callback = function(args)
				if vim.lsp.buf_is_attached(args.buf, "ltex") then
					local ok, image = pcall(require, "image")
					if ok then
						vim.defer_fn(function()
							image.clear()
							image.redraw()
						end, 300)
					end
				end
			end,
		})
	end,
}
