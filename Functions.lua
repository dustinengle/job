
--- Functions
f = {}

--- Generate an alert message.
function f:alert(msg)
  return cChatColor.Red .. msg
end

--- Get the length of a table.
function f:length(t)
  local x = 0
  for _ in pairs(t) do
    x = x + 1
  end
  return x
end

--- Log a message to the console.
function f:log(msg)
  msg = msg or "EMPTY"
  LOG(PLUGIN .. ": " .. msg)
end

--- Get the plugin folder path.
function f:path()
  return cPluginManager:GetPluginsPath() .. "/" .. PLUGIN .. "/"
end

--- Generate a success message.
function f:success(msg)
  return cChatColor.Green .. msg
end

return f