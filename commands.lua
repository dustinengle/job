
local jobList = "builder, crafter, fisherman, gatherer, miner, woodcutter"

-- Drop from a job.
function HandleJobDrop(args, player)
  if #args < 3 then
    player:SendMessageFailure("Please provide a job name: " .. cChatColor.Blue .. jobList)
    return true
  end
  
  jobs:drop(player:GetUUID(), args[3])  
  player:SendMessageSuccess("You left your job as a " .. cChatColor.Blue .. args[3])
  return true
end

-- List jobs for player.
function HandleJobList(args, player)
  local list = jobs:list(player:GetUUID())  
  player:SendMessageSuccess("Current jobs: " .. cChatColor.Blue .. list)
  return true
end

-- Join a job.
function HandleJobJoin(args, player)
  if #args < 3 then
    player:SendMessageFailure("Please provide a job name: " .. cChatColor.Blue .. jobList)
    return true
  end
  
  local job = args[3]
  
  -- Verify that the job is valid.
  if job ~= "builder" and job ~= "crafter" and job ~= "fisherman" and job ~= "gatherer" and job ~= "miner" and job ~= "woodcutter" then
    player:SendMessageFailure("The job name provided is invalid. Should be one of: " .. cChatColor.Blue .. jobList)
    return true
  end
    
  -- Attempt to add player to job.  If rejected it probably because
  -- the player has reached their maxed jobs limit.
  if jobs:add(player:GetUUID(), job) then
    player:SendMessageSuccess("You are now a " .. cChatColor.Blue .. job)
  else
    player:SendMessageFailure("You can only have " .. settings.maxJobs .. " jobs.")
  end
  
  return true
end