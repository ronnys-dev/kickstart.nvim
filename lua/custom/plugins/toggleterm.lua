return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      -- терминал снизу
      direction = 'horizontal',
      -- высота окна терминала (в строках)
      size = 12,
      -- сразу входить в режим ввода
      start_in_insert = true,
      -- запоминать размер между открытиями
      persist_size = true,
      -- можно добавить красивое затемнение (по вкусу)
      shade_terminals = true,
    }

    -- Хоткей: <leader>tt — открыть/закрыть терминал снизу
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', {
      desc = 'Терминал снизу (toggleterm)',
    })
  end,
}
