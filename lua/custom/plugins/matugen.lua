return {
  'RRethy/base16-nvim',
  name = 'base16-nvim',
  lazy = false,
  priority = 1001,
  config = function()
    vim.opt.termguicolors = true

    require('matugen').setup()
    pcall(vim.cmd.TransparentEnable)

    -- Noctalia/Matugen can send SIGUSR1 after regenerating this template.
    if _G.noctalia_matugen_signal then
      _G.noctalia_matugen_signal:stop()
      _G.noctalia_matugen_signal:close()
    end

    local signal = vim.uv.new_signal()
    signal:start(
      'sigusr1',
      vim.schedule_wrap(function()
        package.loaded.matugen = nil
        require('matugen').setup()
        pcall(vim.cmd.TransparentEnable)
        vim.cmd 'redraw!'
      end)
    )

    _G.noctalia_matugen_signal = signal
  end,
}
