local M = {}

local function max_len_line(lines)
  local max_len = 0

  for _, line in ipairs(lines) do
    local line_len = line:len()
    if line_len > max_len then
      max_len = line_len
    end
  end

  return max_len
end

function M.align_center(container, lines, alignment)
  local output = {}
  local max_len = max_len_line(lines)

  for _, line in ipairs(lines) do
    local padding = string.rep(" ", (math.max(container.width, max_len) - line:len()) * alignment)
    table.insert(output, padding .. line)
  end

  return output
end

return M
