util.AddNetworkString(SCP_263_CONFIG.SetQuestions)
util.AddNetworkString(SCP_263_CONFIG.SetConvarClientSide)
util.AddNetworkString(SCP_263_CONFIG.StartTimer)
util.AddNetworkString(SCP_263_CONFIG.StopTimer)

-- The total time the player is burned
SCP_263_CONFIG.TimeToBurn = CreateConVar( "SCP263_TimeToBurn", 42, {FCVAR_PROTECTED, FCVAR_ARCHIVE}, "The total time the player is burned", 1, 999 )

-- The total time the player has for answer the questions
SCP_263_CONFIG.TimeToAnswer = CreateConVar( "SCP263_TimeToAnswer", 45, {FCVAR_PROTECTED, FCVAR_ARCHIVE}, "The total time the player has for answer the questions", 1, 600 )

-- The maximum distance delimitation of the game
SCP_263_CONFIG.MaximumDelimitationGame = CreateConVar( "SCP263_MaximumDelimitationGame", 200, {FCVAR_PROTECTED, FCVAR_ARCHIVE}, "The maximum distance delimitation of the game", 10, 9999 )