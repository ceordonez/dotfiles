return{
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
          local nordic = require("nordic")
          local palette = require("nordic.colors")
          local opts = {
            -- Enable bold keywords.
            bold_keywords = true,
            -- Enable italic comments.
            italic_comments = true,
            -- Enable general editor background transparency.
            transparent = {
              bg = false,
            },
            -- Enable brighter float border.
            bright_border = false,
            -- Reduce the overall amount of blue in the theme (diverges from base Nord).
            reduced_blue = false,
            -- Swap the dark background with the normal one.
            swap_backgrounds = false,
            -- Override the styling of any highlight group.
            on_highlight = function(highlights, palette_nordic)
              highlights.Visual = { bg = palette_nordic.grey2 }
              highlights.FloatBorder = {
                fg = palette_nordic.yellow.base,
                bold = true
              }
              highlights.NormalFloat = { bg = palette_nordic.grey2 }
              highlights.WikiLinkWiki = {
                fg = palette_nordic.blue1,
                underline = true
              }
              -- Color for the scrollbar in cmp
              highlights.PmenuThumb = { bg = palette_nordic.blue0 }
            end,
            -- Cursorline options.  Also includes visual/selection.
            cursorline = {
              -- Bold font in cursorline.
              bold = false,
              -- Bold cursorline number.
              bold_number = true,
              -- Available styles: 'dark', 'light'.
              theme = "dark",
              -- Blending the cursorline bg with the buffer bg.
              blend = 0.85,
            },
            noice = {
              -- Available styles: `classic`, `flat`.
              style = "classic",
            },
            telescope = {
              -- Available styles: `classic`, `flat`.
              style = "classic",
            },
            leap = {
              -- Dims the backdrop when using leap.
              dim_backdrop = false,
            },
            ts_context = {
              -- Enables dark background for treesitter-context window
              dark_background = true,
            },
          }
          -- opts.override['Underlined'] = { fg = palette.cyan.base }
          nordic.setup(opts)
          nordic.load()
        end,
    },
}
