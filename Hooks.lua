
-- When a brewing process has completed.
function OnBrewingCompleted(world, stand)
  -- Brewer
  return false
end

-- When a player picks up an item.
function OnCollectingPickup(player, pickup)
  local item = pickup.GetItem(pickup)
  local reward = jobs:dispatch(player:GetUUID(), "gatherer", item.m_ItemType) 
  
  if reward then
    local amount = cPluginManager:CallPlugin("Coin", "Credit", player:GetUUID(), reward)
    player:SendMessageSuccess("Gatherer reward: " .. amount)
  end
   
  return false
end

-- When a player or mob dies.
function OnKilled(victim, tdi, message)
  -- ?
  return false
end

-- When a player breaks a block reward them for it.
function OnPlayerBrokenBlock(player, bx, by, bz, bface, btype, bmeta)
  local reward1 = jobs:dispatch(player:GetUUID(), "miner", btype)  
  local reward2 = jobs:dispatch(player:GetUUID(), "woodcutter", btype)  
  
  if reward1 then
    local amount = cPluginManager:CallPlugin("Coin", "Credit", player:GetUUID(), reward1)
    player:SendMessageSuccess("Miner reward: " .. amount)
  end  
  if reward2 then
    local amount = cPluginManager:CallPlugin("Coin", "Credit", player:GetUUID(), reward2)
    player:SendMessageSuccess("Woodcutter reward: " .. amount)
  end
  
  return false
end

-- When a player leaves the game save the jobs to disk.
function OnPlayerDestroyed(player)
  jobs:save()
  return false
end

-- When a player has fished.
function OnPlayerFished(player, reward)
  local _reward = 0.00
  
  for i = 0, (reward:Size() - 1) do
    local item = reward.Get(reward, i)
    local r = jobs:dispatch(player:GetUUID(), "fisherman", item.m_ItemType)
    if r then _reward = _reward + r end
  end
  
  if _reward > 0.00 then
    local amount = cPluginManager:CallPlugin("Coin", "Credit", player:GetUUID(), _reward)
    player:SendMessageSuccess("Fisherman reward: " .. amount)
  end
  
  return false
end

-- After a player has placed a block.
function OnPlayerPlacedBlock(player, bx, by, bz, btype, bmeta)
  local reward = jobs:dispatch(player:GetUUID(), "builder", btype) 
  
  if reward then
    local amount = cPluginManager:CallPlugin("Coin", "Credit", player:GetUUID(), reward)
    player:SendMessageSuccess("Builder reward: " .. amount)
  end
  
  return false
end

-- After a player has used a block: chest, lever, button, etc.
function OnPlayerUsedBlock(player, bx, by, bz, bface, cx, cy, cz, btype, bmeta)
  -- ?
  return false
end

-- After a player has used an item hoe, place fluid, etc.
function OnPlayerUsedItem(player, bx, by, bz, bface, cx, cy, cz, btype, bmeta)
  -- ?
  return false
end

-- After a player has crafted an item.
function OnPostCrafting(player, grid, recipe)
  local item = recipe:GetResult()
  local reward = jobs:dispatch(player:GetUUID(), "crafter", item.m_ItemType)
  
  if reward then
    local amount = cPluginManager:CallPlugin("Coin", "Credit", player:GetUUID(), reward)
    player:SendMessageSuccess("Crafter reward: " .. amount)
  end
  
  return false
end
