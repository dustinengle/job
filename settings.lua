
--- settings
settings = {}

--- Get the id of a block string.
function settings:getId(block)
  return settings[block]
end

--- Load the ini file into memory.
function settings:load()
  local file = cIniFile()
  
  -- Try to read settings.ini file.
  if file:ReadFile(f:path() .. 'settings.ini') then
    -- Loop over setting key values.
    for v = 0, (file:GetNumValues('settings') - 1) do
      -- Get the setting name.
      local setting = file:GetValueName('settings', v)
      
      -- Add to in-memory table.
      self[setting] = file:GetValueI('settings', setting)
    end
    
    return true
  end
  
  return false
end

return settings