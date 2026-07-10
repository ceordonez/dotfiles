-- install markdown-preview.nvim without yarn or npm
-- return {
-- 	"iamcco/markdown-preview.nvim",
-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
-- 	ft = { "markdown" },
-- 	build = function()
-- 		vim.cmd([[Lazy load markdown-preview.nvim]])
-- 		vim.fn["mkdp#util#install"]()
-- 	end,
-- }

-- require('lazy').setup({
return 
    -- Your other plugins
    {
        'jakewvincent/mkdnflow.nvim',
        ft = { 'markdown', 'rmd' },  -- Add custom filetypes here if configured
        config = function()
            require('mkdnflow').setup({
                -- Your config
            })
        end
    }
    -- Your other plugins
-- })
