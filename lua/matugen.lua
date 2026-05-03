local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#1f1f28', -- Default Background
    base01 = '#2a2a37', -- Lighter Background
    base02 = '#333343', -- Selection Background
    base03 = '#526e7c', -- Comments, Invisibles
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
    base0C = '#ae96e9', -- Regex, Escape Chars
    base0D = '#e9cf96', -- Functions, Methods
    base0E = '#96e9d2', -- Keywords, Storage
    base0F = '#64201b', -- Deprecated, Embedded Tags
  }

  vim.g.terminal_color_0 = '#393836'
  vim.g.terminal_color_1 = '#c4746e'
  vim.g.terminal_color_2 = '#699469'
  vim.g.terminal_color_3 = '#c4b28a'
  vim.g.terminal_color_4 = '#435965'
  vim.g.terminal_color_5 = '#a292a3'
  vim.g.terminal_color_6 = '#8ea49e'
  vim.g.terminal_color_7 = '#c8c093'
  vim.g.terminal_color_8 = '#aca9a4'
  vim.g.terminal_color_9 = '#cc928e'
  vim.g.terminal_color_10 = '#72a072'
  vim.g.terminal_color_11 = '#d4c196'
  vim.g.terminal_color_12 = '#698a9b'
  vim.g.terminal_color_13 = '#b4a7b5'
  vim.g.terminal_color_14 = '#96ada7'
  vim.g.terminal_color_15 = '#d5cd9d'
end

return M
