local M = {}

function M.setup()
  vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

  local state = {
    split_open = false,
    buf = -1, -- keep track of the terminal buffer
  }

  local group = vim.api.nvim_create_augroup("FloaterminalEvents", { clear = true })
  vim.api.nvim_create_autocmd("TermClose", {
    group = group,
    pattern = "*",
    callback = function(args)
      if tonumber(args.buf) == state.buf then
        state.buf = -1
        state.split_open = false
      end
    end,
  })

  local function open_or_focus_terminal(cmd)
    if state.split_open then
      -- Terminal is visible, hide it
      vim.cmd("hide")
      state.split_open = false
    else
      if state.buf == -1 or not vim.api.nvim_buf_is_valid(state.buf) then
        -- Create a new terminal if we don’t have a valid one
        vim.cmd("botright 10split")
        if cmd then
          vim.cmd("terminal " .. cmd) -- run `run filename`
        else
          vim.cmd("terminal")
        end
        vim.cmd("startinsert")
        state.buf = vim.api.nvim_get_current_buf()
      else
        -- If the buffer still exists, just re-open it
        vim.cmd("botright 10split | buffer " .. state.buf)
        vim.cmd("startinsert")
        -- If cmd is provided, you could also feed keys to re-run something,
        -- but generally if the job is still running, it will just be visible.
      end
      state.split_open = true
    end
  end

  local function run_current_file()
    local filename = vim.fn.expand("%")
    if filename == "" then
      vim.notify("No file in current buffer.", vim.log.levels.ERROR)
      return
    end
    -- Opens the terminal and runs `run "filename"`
    open_or_focus_terminal("run " .. vim.fn.shellescape(filename))
  end

  vim.api.nvim_create_user_command("Floaterminal", function()
    open_or_focus_terminal()
  end, {})

  -- Create a command that runs the current buffer’s file
  vim.api.nvim_create_user_command("FloaterminalRunFile", run_current_file, {})

  -- Map <leader>rf to run the current file in the floaterminal
  vim.keymap.set("n", "<leader>rf", ":FloaterminalRunFile<CR>", { silent = true })
  vim.keymap.set("n", "<leader>tt", ":Floaterminal<CR>", { silent = true })
end

return M
