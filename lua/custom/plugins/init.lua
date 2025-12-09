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
  {
    'nosduco/remote-sshfs.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function()
      require('remote-sshfs').setup {
        connections = {
          ssh_configs = { -- which ssh configs to parse for hosts list
            vim.fn.expand '$HOME' .. '/.ssh/config',
            '/etc/ssh/ssh_config',
            -- "/path/to/custom/ssh_config"
          },
          ssh_known_hosts = vim.fn.expand '$HOME' .. '/.ssh/known_hosts',
          -- NOTE: Can define ssh_configs similarly to include all configs in a folder
          -- ssh_configs = vim.split(vim.fn.globpath(vim.fn.expand "$HOME" .. "/.ssh/configs", "*"), "\n")
          sshfs_args = { -- arguments to pass to the sshfs command
            '-o reconnect',
            '-o ConnectTimeout=5',
          },
        },
        mounts = {
          base_dir = vim.fn.expand '$HOME' .. '/.sshfs/', -- base directory for mount points
          unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
        },
        handlers = {
          on_connect = {
            change_dir = true, -- when connected change vim working directory to mount point
          },
          on_disconnect = {
            clean_mount_folders = false, -- remove mount point folder on disconnect/unmount
          },
          on_edit = {}, -- not yet implemented
        },
        ui = {
          select_prompts = false, -- not yet implemented
          confirm = {
            connect = true, -- prompt y/n when host is selected to connect to
            change_dir = false, -- prompt y/n to change working directory on connection (only applicable if handlers.on_connect.change_dir is enabled)
          },
        },
        log = {
          enabled = false, -- enable logging
          truncate = false, -- truncate logs
          types = { -- enabled log types
            all = false,
            util = false,
            handler = false,
            sshfs = false,
          },
        },
      }
    end,
  },
  {
    'yetone/avante.nvim',
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = 'avante.md',
      -- for example
      provider = 'claude',
      providers = {
        claude = {
          endpoint = 'https://api.anthropic.com',
          model = 'claude-sonnet-4-5-20250929',
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        vertex = nil,
        vertex_claude = nil,
        -- moonshot = {
        --   endpoint = 'https://api.moonshot.ai/v1',
        --   model = 'kimi-k2-0711-preview',
        --   timeout = 30000, -- Timeout in milliseconds
        --   extra_request_body = {
        --     temperature = 0.75,
        --     max_tokens = 32768,
        --   },
        -- },
      },
      behaviour = {
        -- не даём Avante ничего применять/запускать без нас
        auto_apply_diff_after_generation = false, -- патчи в код не льются сами
        auto_approve_tool_permissions = false, -- ВСЕ инструменты спрашивают разрешение
        confirmation_ui_style = 'popup', -- вместо мелких кнопок сбоку будет попап
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-mini/mini.pick', -- for file_selector provider mini.pick
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      'stevearc/dressing.nvim', -- for input provider dressing
      'folke/snacks.nvim', -- for input provider snacks
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
