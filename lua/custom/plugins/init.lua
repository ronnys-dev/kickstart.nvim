-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false, -- <== ДОБАВИТЬ: грузить сразу при старте
    priority = 1000, -- чтобы тема подгрузилась до остальных плагинов
    config = function()
      require('kanagawa').setup {
        -- сюда потом можно докинуть настройки
      }
      vim.cmd 'colorscheme kanagawa'
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- нужно для нормальных цветов
      vim.opt.termguicolors = true

      require('bufferline').setup {
        options = {
          mode = 'buffers', -- показываем буферы как "табы"
          separator_style = 'slant', -- для красоты (можно "thin", "padded" и т.п.)
          show_buffer_close_icons = false,
          show_close_icon = false,

          -- тут самое главное — имя буфера = путь относительно текущей директории
          name_formatter = function(buf)
            -- buf.path есть в bufferline.nvim
            -- ':.` -> путь относительно текущей рабочей директории Neovim :contentReference[oaicite:0]{index=0}
            return vim.fn.fnamemodify(buf.path or buf.name, ':.')
          end,
        },
      }
    end,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  },
}
