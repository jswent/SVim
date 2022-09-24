local M = {}

local if_nil = vim.F.if_nil

local function git_cmd(opts)
  local plenary_loaded, Job = pcall(require, "plenary.job")
  if not plenary_loaded then
    return 1, { "" }
  end

  opts = opts or {}

  local stderr = {}
  local stdout, ret = Job
    :new({
      command = "git",
      args = opts.args,
      on_stderr = function(_, data)
        table.insert(stderr, data)
      end,
    })
    :sync()

  return ret, stdout
end

function M.get_svim_branch()
  local _, results = git_cmd { args = { "rev-parse", "--abbrev-ref", "HEAD" } }
  local branch = vim.F.if_nil(results[1], "")
  return branch
end

function M.get_svim_current_sha() 
  local args = { "rev-parse", "--short=8", "HEAD" }  

  local _, results = git_cmd { args = args}
  local abbrev_version = if_nil(results[1], "")
  return abbrev_version
end

function M.get_svim_version()
  local current_branch = M.get_svim_branch()

  local svim_version = current_branch .. "-" .. M.get_svim_current_sha()
  return svim_version
end

return M
