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
