-- SCP-263, A representation of a paranormal object on a fictional series on the game Garry's Mod.
-- Copyright (C) 2023  MrMarrant aka BIBI.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

util.AddNetworkString(SCP_263_CONFIG.SetQuestions)
util.AddNetworkString(SCP_263_CONFIG.SetConvarClientSide)
util.AddNetworkString(SCP_263_CONFIG.StartTimer)
util.AddNetworkString(SCP_263_CONFIG.StopTimer)
util.AddNetworkString(SCP_263_CONFIG.SetConvarInt)
util.AddNetworkString(SCP_263_CONFIG.SetConvarBool)

-- The total time the player is burned
SCP_263_CONFIG.TimeToBurn = CreateConVar( "SCP263_TimeToBurn", 42, {FCVAR_PROTECTED, FCVAR_ARCHIVE}, "The total time the player is burned", 1, 999 )

-- The total time the player has for answer the questions
SCP_263_CONFIG.TimeToAnswer = CreateConVar( "SCP263_TimeToAnswer", 45, {FCVAR_PROTECTED, FCVAR_ARCHIVE}, "The total time the player has for answer the questions", 1, 600 )

-- The maximum distance delimitation of the game
SCP_263_CONFIG.MaximumDelimitationGame = CreateConVar( "SCP263_MaximumDelimitationGame", 500, {FCVAR_PROTECTED, FCVAR_ARCHIVE}, "The maximum distance delimitation of the game", 10, 9999 )

-- Enable the anti cheat system of the game
SCP_263_CONFIG.EnableAntiCheat = CreateConVar( "SCP263_EnableAntiCheat", 1, {FCVAR_PROTECTED, FCVAR_ARCHIVE}, "Enable the anti cheat system of the game", 0, 1 )