
g_PluginInfo = {
  Name = PLUGIN,
  Date = "2016-11-17",
  Description = "Simple Job plugin with Coin rewards.",
  
  -- Information about plugin.
  AdditionalInfo = {
    {
      Title = PLUGIN .. " Plugin",
      Contents = "Get rewarded for playing!",
    },
  },
  
  -- Plugin commands.
  Commands = {
    ["/job"] = {
      Permission = "",
      HelpString = PLUGIN .. " plugin main command.",
      Handler = nil,
      Subcommands = {
        drop = {
          HelpString = "Drop from a job.",
          Permission = "",
          Handler = HandleJobDrop,
          ParameterCombinations = {
            {
              Params = "job",
              Help = "Drop from the provided job."
            },
          },
        },
        list = {
          HelpString = "List your jobs.",
          Permission = "",
          Handler = HandleJobList,
          ParameterCombinations = {
            {
              Params = "job",
              Help = "List your current jobs."
            },
          },
        },
        join = {
          HelpString = "Join a job.",
          Permission = "",
          Handler = HandleJobJoin,
          ParameterCombinations = {
            {
              Params = "job",
              Help = "Join the job with matching name.",
            },
          },
        },
      },
    },
  },
  
  -- TODO: Add console command for the server console.
  ConsoleCommands = {},
  
  -- Setup permissions
  Permissions = {},
}