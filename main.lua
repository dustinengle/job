
-- Global plugin object.
Plugin = nil

-- Initialize the plugin.
function Initialize(plugin)
  -- Setup configuration file.
  dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
  
  -- Configure plugin name and version.
  plugin:SetName(PLUGIN)
  plugin:SetVersion(VERSION)
  
  -- Set plugin to global.
  Plugin = plugin
  
  -- Load the config files.
  items:load()
  jobs:load()
  settings:load()
  values:load()
  
  -- Hooks
  cPluginManager:AddHook(cPluginManager.HOOK_BREWING_COMPLETED, OnBrewingCompleted)
  cPluginManager:AddHook(cPluginManager.HOOK_COLLECTING_PICKUP, OnCollectingPickup)
  cPluginManager:AddHook(cPluginManager.HOOK_KILLED, OnKilled)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_BROKEN_BLOCK, OnPlayerBrokenBlock)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_DESTROYED, OnPlayerDestroyed)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_FISHED, OnPlayerFished)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_PLACED_BLOCK, OnPlayerPlacedBlock)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_USED_BLOCK, OnPlayerUsedBlock)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_USED_ITEM, OnPlayerUsedItem)
  cPluginManager:AddHook(cPluginManager.HOOK_POST_CRAFTING, OnPostCrafting)
  
  -- Register in-game commands.
  RegisterPluginInfoCommands()
  
  LOG("Initialized " .. PLUGIN .. " v." .. VERSION)
  return true
end

-- When the plugin is closing down save data.
function OnDisable()
  LOG("Closing " .. PLUGIN .. " v." .. VERSION)
end