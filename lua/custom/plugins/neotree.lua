return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          -- открыть файл / зайти в директорию
          ['<cr>'] = 'open',
          ['l'] = 'open',

          -- свернуть директорию / «назад»
          ['h'] = 'close_node',

          -- открыть в сплитах
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',

          -- остальные дефолты можно не трогать, они подтянутся сами
        },
      },
    }

    vim.keymap.set('n', '<leader>e', function()
      vim.cmd 'Neotree toggle left'
    end, { desc = 'Neo-tree: файловое дерево слева' })

    vim.keymap.set('n', '<leader>E', function()
      vim.cmd 'Neotree reveal left'
    end, { desc = 'Neo-tree: показать текущий файл в дереве' })
  end,
}
