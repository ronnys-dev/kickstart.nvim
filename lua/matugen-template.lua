local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '{{colors.surface.default.hex}}', -- Default Background
    base01 = '{{colors.surface_container.default.hex}}', -- Lighter Background
    base02 = '{{colors.surface_container_high.default.hex}}', -- Selection Background
    base03 = '{{colors.outline.default.hex}}', -- Comments, Invisibles
    -- Foreground tones
    base04 = '{{colors.on_surface_variant.default.hex}}', -- Dark Foreground
    base05 = '{{colors.on_surface.default.hex}}', -- Default Foreground
    base06 = '{{colors.on_surface.default.hex}}', -- Light Foreground
    base07 = '{{colors.on_background.default.hex}}', -- Lightest Foreground
    -- Accent colors
    base08 = '{{colors.error.default.hex}}', -- Variables, XML Tags, Errors
    base09 = '{{colors.tertiary.default.hex}}', -- Integers, Constants
    base0A = '{{colors.secondary.default.hex}}', -- Classes, Search Background
    base0B = '{{colors.primary.default.hex}}', -- Strings, Diff Inserted
    base0C = '{{colors.tertiary_fixed_dim.default.hex}}', -- Regex, Escape Chars
    base0D = '{{colors.primary_fixed_dim.default.hex}}', -- Functions, Methods
    base0E = '{{colors.secondary_fixed_dim.default.hex}}', -- Keywords, Storage
    base0F = '{{colors.error_container.default.hex}}', -- Deprecated, Embedded Tags
  }

  vim.g.terminal_color_0 = '{{colors.terminal_normal_black.default.hex}}'
  vim.g.terminal_color_1 = '{{colors.terminal_normal_red.default.hex}}'
  vim.g.terminal_color_2 = '{{colors.terminal_normal_green.default.hex}}'
  vim.g.terminal_color_3 = '{{colors.terminal_normal_yellow.default.hex}}'
  vim.g.terminal_color_4 = '{{colors.terminal_normal_blue.default.hex}}'
  vim.g.terminal_color_5 = '{{colors.terminal_normal_magenta.default.hex}}'
  vim.g.terminal_color_6 = '{{colors.terminal_normal_cyan.default.hex}}'
  vim.g.terminal_color_7 = '{{colors.terminal_normal_white.default.hex}}'
  vim.g.terminal_color_8 = '{{colors.terminal_bright_black.default.hex}}'
  vim.g.terminal_color_9 = '{{colors.terminal_bright_red.default.hex}}'
  vim.g.terminal_color_10 = '{{colors.terminal_bright_green.default.hex}}'
  vim.g.terminal_color_11 = '{{colors.terminal_bright_yellow.default.hex}}'
  vim.g.terminal_color_12 = '{{colors.terminal_bright_blue.default.hex}}'
  vim.g.terminal_color_13 = '{{colors.terminal_bright_magenta.default.hex}}'
  vim.g.terminal_color_14 = '{{colors.terminal_bright_cyan.default.hex}}'
  vim.g.terminal_color_15 = '{{colors.terminal_bright_white.default.hex}}'
end

return M
