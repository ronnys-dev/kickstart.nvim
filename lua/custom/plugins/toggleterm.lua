return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    vim.env.COLORTERM = 'truecolor'

    require('toggleterm').setup {
      -- терминал снизу
      direction = 'horizontal',
      -- высота окна терминала (в строках)
      size = 12,
      -- сразу входить в режим ввода
      start_in_insert = true,
      -- запоминать размер между открытиями
      persist_size = true,
      env = {
        COLORTERM = 'truecolor',
      },
      -- не затемнять фон, чтобы терминал оставался прозрачным
      shade_terminals = false,
      highlights = {
        Normal = {
          guibg = 'NONE',
        },
        NormalFloat = {
          guibg = 'NONE',
        },
        FloatBorder = {
          guibg = 'NONE',
        },
      },
    }

    -- Хоткей: <leader>tt — открыть/закрыть терминал снизу
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', {
      desc = 'Терминал снизу (toggleterm)',
    })
  end,
}
