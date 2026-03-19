vim.api.nvim_create_user_command("StageQ", function()
  local file = vim.fn.expand "%"
  if file == "" then
    vim.notify("Current buffer has no file name", vim.log.levels.WARN)
    return
  end

  vim.cmd "write"
  vim.fn.system { "git", "add", file }

  if vim.v.shell_error == 0 then
    vim.cmd "quit"
  else
    vim.notify("git add failed", vim.log.levels.ERROR)
  end
end, {})

vim.api.nvim_create_user_command("Path", function()
  local path = vim.fn.expand "%:p"
  if path == "" then
    vim.notify("Current buffer has no file name", vim.log.levels.WARN)
    return
  end
  -- "+" is the clipboard register
  vim.fn.setreg("+", path)
  vim.notify(path)
end, {})
