
--- Items
items = {}

--- Get the id of a block string.
function items:getId(block)
  return items[block]
end

--- Load the ini file into memory.
function items:load()
  local file = cIniFile()
  
  -- Try to read items.ini file.
  if file:ReadFile(f:path() .. 'items.ini') then
    -- Loop over item key values.
    for v = 0, (file:GetNumValues('items') - 1) do
      -- Get the block name.
      local block = file:GetValueName('items', v)
      
      -- Add to in-memory table.
      self[block] = file:GetValueI('items', block)
    end
    
    return true
  end
  
  return false
end

return items