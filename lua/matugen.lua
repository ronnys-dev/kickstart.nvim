local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#1f1f28', -- Default Background
    base01 = '#2a2a37', -- Lighter Background
    base02 = '#363646', -- Selection Background
    base03 = '#435965', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#c8c093', -- Dark Foreground
    base05 = '#dcd7ba', -- Default Foreground
    base06 = '#dcd7ba', -- Light Foreground
    base07 = '#dcd7ba', -- Lightest Foreground
    -- Accent colors
    base08 = '#c4746e', -- Variables, XML Tags, Errors
    base09 = '#938aa9', -- Integers, Constants
    base0A = '#8ea49e', -- Classes, Search Background
    base0B = '#c4b28a', -- Strings, Diff Inserted
    base0C = '#938aa9', -- Regex, Escape Chars
    base0D = '#c4b28a', -- Functions, Methods
    base0E = '#8ea49e', -- Keywords, Storage
    base0F = '#c4746e', -- Deprecated, Embedded Tags
  }
end

return M
