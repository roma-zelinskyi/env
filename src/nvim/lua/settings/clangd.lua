
local function isInWorkRepo(currentPath)
  local workRepoPath = os.getenv("WORK_REPO")

  local pattern = "^" .. workRepoPath

  return currentPath:find(pattern) ~= nil
end

local function getCmd()
  local currentPath = vim.api.nvim_buf_get_name(0)
  local workRepoPath = os.getenv("WORK_REPO")
  if isInWorkRepo(currentPath) then
    return { 'docker', 'run', '-i', '--rm', '-v', workRepoPath .. ':' .. workRepoPath,
            'arm64v8/aos_devenv', 'clangd', '--background-index' }
  else
    return {'clangd', '--background-index'}
  end
end

return {
  cmd = getCmd(),
}

