
--- The current list of jobs in the system.
local jobList = {
  "builder",
  "crafter",
  "fisherman",
  "gatherer",
  "miner",
  "woodcutter",
}

--- Jobs
jobs = {}

--- Add a player to a job.
function jobs:add(uuid, job, lvl)
  -- Make sure the player will not go
  -- over the max job limit in settings.
  if self:count(uuid) < settings.maxJobs then
    self[job][uuid] = lvl or 0 -- Default to zero.
  else
    return false
  end
  
  return true
end

--- Get the numbers of jobs a player has.
function jobs:count(uuid)
  local c = 0
  
  for i = 1, #jobList do
    if self[jobList[i]][uuid] then
      c = c + 1
    end
  end
  
  return c
end

--- Dispatch a job.
function jobs:dispatch(uuid, job, btype)
  if self:has(uuid, job) then
    return values:coin(job, btype)
  end
  
  return nil
end

--- Remove player from job.
function jobs:drop(uuid, job)
  -- Set to nil and get cleaned up in
  -- garbage collection.
  self[job][uuid] = nil
  
  return true
end

--- Does the player have the job.
function jobs:has(uuid, job)
  -- The same as == nil
  return self[job] and self[job][uuid]
end

--- Return a list of jobs for player id.
function jobs:list(uuid, job)
  local s = {}
  
  for i = 1, #jobList do
    if self[jobList[i]][uuid] then
      table.insert(s, jobList[i])
    end
  end
  
  return table.concat(s, ", ")
end

--- Get the player level for a job.
function jobs:level(uuid, job)
  return self[job][uuid]
end

--- Level up a player in a job.
function jobs:lvlPlayer(uuid, job)
  -- Get current job level.
  local lvl = self:level(uuid, job)
  -- Add a level.
  lvl = lvl + 1
  -- Update the player's level.
  self[job][uuid] = lvl
  -- Return level.
  return lvl
end

--- Load the ini file into memory.
function jobs:load()
  local file = cIniFile()
  
  -- Try to read settings.ini file.
  if file:ReadFile(f:path() .. 'jobs.ini') then
    -- Loop over job keys.
    for k = 0, (file:GetNumKeys() - 1) do
      -- Get the name of the job key.
      local job = file:GetKeyName(k)
      self[job] = {}
      
      -- Loop over the players and
      -- load their job levels into memory.
      for v = 0, (file:GetNumValues(k) - 1) do
        -- Get the uuid of the player.
        local uuid = file:GetValueName(k, v)
        -- Add to in-memory table.
        self[job][uuid] = file:GetValueI(k, v)
      end
    end
    
    return true
  end
  
  return false
end

--- Save player jobs to the ini file.
function jobs:save()
  local file = cIniFile()
  
  for i = 1, #jobList do
    local job = jobList[i]
    local k = file:AddKeyName(job)
    
    for uuid, lvl in pairs(jobs[job]) do
      file:SetValueI(job, uuid, lvl, true)
    end
  end
  
  if file:WriteFile(f:path() .. 'jobs.ini') then
    f:log("jobs.ini file saved.")
  else
    f:log("unable to save jobs.ini file.")
  end
end

return jobs