-- Find local IP address according to active connections
function conky_myaddr()
  return conky_parse('${addr ' .. findInterface() .. '}')
end

-- Find up/download speed
function conky_myspeed(upordown)
  print(findInterface())
  return conky_parse('${' .. upordown .. 'speed ' .. findInterface() .. '}')
end

-- Find the string representing the connection's interface (e.g.  eth0)
function findInterface()
  local handle = io.popen('route | grep default | awk \'{print $8}\'')
  local result = handle:read()
  handle:close()
  return result
end
