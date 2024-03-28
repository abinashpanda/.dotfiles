local M = {}

function M.log(msg)
  local log_file_path = vim.fn.stdpath "cache" .. "/nvim.log"
  local log_msg = string.format("[%s] %s\n", os.date "%Y-%m-%d %H:%M:%S", msg)
  local file = io.open(log_file_path, "a")
  if file then
    file:write(log_msg)
    file:close()
  else
    error("Unable to open " .. log_file_path)
  end
end

return M
