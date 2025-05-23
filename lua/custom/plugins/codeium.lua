return {
  'Exafunction/codeium.vim',
  config = function()
    -- disable codeium by default
    vim.g.codeium_enabled = false
    vim.g.codeium_disable_bindings = 1
    -- Change '<C-g>' here to any keycode you like.
    -- vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<C-c>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}
