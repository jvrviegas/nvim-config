local comment = require("Comment")
local utils = require("Comment.utils")

local pre_hook = function(ctx)
  -- Only calculate commentstring for tsx filetypes
  if vim.bo.filetype == "typescriptreact" then
    -- Determine whether to use linewise or blockwise commentstring
    local type = ctx.ctype == utils.ctype.line and "__default" or "__multiline"

    -- Determine the location where to calculate commentstring from
    local location = nil
    if ctx.ctype == utils.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring({
      key = type,
      location = location,
    })
  end
end

---LHS of toggle mappings in NORMAL + VISUAL mode
local toggler = {
  ---Line-comment toggle keymap
  line = "<leader>c<leader>",
  ---Block-comment toggle keymap
  block = "gbc",
}

---LHS of operator-pending mappings in NORMAL + VISUAL mode
local opleader = {
  ---Line-comment keymap
  line = "gc",
  ---Block-comment keymap
  block = "<leader>c<leader>",
}

comment.setup({
  pre_hook = pre_hook,
  toggler = toggler,
  opleader = opleader,
})
