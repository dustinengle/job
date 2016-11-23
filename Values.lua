
--- Values
values = {}

--- Get the value of a block for a job.
function values:coin(job, btype)
  return self[job][btype]
end

--- Load the ini file into memory.
function values:load()
  local file = cIniFile()
  
  -- Try to read values.ini file.
  if file:ReadFile(f:path() .. 'values.ini') then
    -- Get job list.
    for k = 0, (file:GetNumKeys() - 1)  do
      local job = file:GetKeyName(k)
      self[job] = {}
      
      -- Get block list per job.
      for v = 0, (file:GetNumValues(k) - 1) do
        -- Get the name of the block.
        local block = file:GetValueName(k, v)
        
        -- Set to local in-memory table.
        -- Get the block id from items.
        -- Make sure the block exists, if not
        -- then do nothing.
        if items:getId(block) then
          local amount = file:GetValue(k, v)
          self[job][items:getId(block)] = tonumber(amount)
        end
      end
    end
    
    return true
  end
  
  return false
end

return values