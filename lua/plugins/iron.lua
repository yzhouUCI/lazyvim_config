return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            command = { "ipython" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
          },
          sh = {
            command = { "zsh" },
          },
        },
        repl_filetype = function(_, ft)
          return ft
        end,

        -- ✅ 你选择的 repl 打开方式
        repl_open_cmd = view.offset({
          width = 60,
          height = math.floor(vim.o.lines * 0.4),
          w_offset = view.helpers.flip(2),
          h_offset = view.helpers.proportion(0.9),
        }),
      },
      keymaps = {
        toggle_repl = "<space>rr",
        restart_repl = "<space>rR",
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_paragraph = "<space>sp",
        send_until_cursor = "<space>su",
        send_mark = "<space>sm",
        send_code_block = "<space>sb",
        send_code_block_and_move = "<space>sn",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },
      highlight = { italic = true },
      ignore_blank_lines = true,
    })

    vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
  end,
}
