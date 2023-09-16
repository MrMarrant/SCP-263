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

--[[
* Detect if a player is speaking to the current player who is playing a game
* @Player plyTalker The player who is talking.
* @Player plyListener The player whi is listening.
--]]
local function DetectSpeakingToPlayer(plyTalker, plyListener)
    if not IsValid(plyTalker) or not IsValid(plyListener) then
        return false
    end

    local DirectionSpeaker = (plyListener:GetPos() - plyTalker:GetPos()):GetNormalized()
    local DirectionTalker = plyTalker:EyeAngles():Forward()

    local DotResult = DirectionTalker:Dot(DirectionSpeaker)

    -- Un produit scalaire proche de 1 indique que le joueur qui parle, regarde dans la direction de l'autre joueur
    local tolerance = 0.95

    return DotResult >= tolerance
end

--[[
* Start the 'anticheat' system.
* @Player ply The player to inspect.
* @Entity ent SCP-263
--]]
function SCP_263.InitAntiCheat(ply, ent)
    hook.Add( "PlayerCanHearPlayersVoice", "PlayerCanHearPlayersVoice.SCP263_AntiCheat_".. ent:EntIndex(), function( listener, talker )
        if (IsValid(ent) and IsValid(ply)) then
            if (ent:GetIsOn() and ent:GetIsWaitingAnswer() and not ent:GetIsEndingGame()) then
                --? We check if a player is speaking to the player who is playing the game and the distance is < 150
                if (talker:IsSpeaking() and listener == ply and listener:GetPos():Distance(talker:GetPos()) <= 120) then
                    local IsCheating = DetectSpeakingToPlayer(talker, listener)
                    if (IsCheating) then
                        ent:EmitSound(SCP_263_CONFIG.SoundBoo, 75, math.random( 100, 110 ))
                        SCP_263.EndGame(ent, 16, 4, "cheating", false)
                    end
                end
            end
        end
    end )
    -- TODO : Détecter si un joueur ouvre l'addon de l'ordinateur ??
end