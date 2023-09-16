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
* Burn the player x seconds depend on the value set.
* @Player ply The player to punish
--]]
function SCP_263.BurnPlayer(ply)
    if (not IsValid(ply)) then return end

    ply:Ignite( SCP_263_CONFIG.TimeToBurn:GetInt(), 0 )
    ply.SCP263_IsBurned = true
end

--[[
* Spawn one of the reward available.
* @Entity SCP-263
--]]
function SCP_263.RewardPlayer(ent)
    if (not IsValid(ent)) then return end

    local Reward = ents.Create( "reward_scp263" )
    Reward:SetPos(ent:GetPos() + ent:GetForward() * 20)
    Reward:Spawn()
    Reward:Activate()
end

--[[
* Set a Server Convar to ClientSide (if that sound stupid, it's because it is)
* @string name
* @number value
* @Player ply
--]]
function SCP_263.SetConvarClientSide(name, value, ply)
    if (type( value ) == "boolean") then value = value and 1 or 0 end
    net.Start(SCP_263_CONFIG.SetConvarClientSide)
        net.WriteString(name)
        net.WriteUInt(value, 14)
    if (ply) then
        net.Send(ply)
    else
        net.Broadcast()
    end
end


hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn.SCP263_ClientConVar", function(ply)
    SCP_263.SetConvarClientSide("ClientTimeToBurn", SCP_263_CONFIG.TimeToBurn:GetInt(), ply)
    SCP_263.SetConvarClientSide("ClientTimeToAnswer", SCP_263_CONFIG.TimeToAnswer:GetInt(), ply)
    SCP_263.SetConvarClientSide("ClientMaximumDelimitationGame", SCP_263_CONFIG.MaximumDelimitationGame:GetInt(), ply)
end)

hook.Add( "PlayerDeath", "PlayerDeath.SCP263_WasBurned", function( victim, inflictor, attacker )
    if (victim.SCP263_IsBurned) then victim.SCP263_IsBurned = nil end
end)

-- Set Convar Int for the client side
net.Receive(SCP_263_CONFIG.SetConvarInt, function ( len, ply )
    if (ply:IsSuperAdmin() or game.SinglePlayer()) then
        local name = net.ReadString()
        local value = net.ReadUInt(14)
        SCP_263_CONFIG[name]:SetInt(value)

        SCP_263.SetConvarClientSide('Client'..name, value) --? The value clientside start with Client
    end
end)

-- Set Convar Bool for the client side
net.Receive(SCP_263_CONFIG.SetConvarBool, function ( len, ply )
    if (ply:IsSuperAdmin() or game.SinglePlayer()) then
        local name = net.ReadString()
        local value = net.ReadBool()
        SCP_263_CONFIG[name]:SetBool(value)

        SCP_263.SetConvarClientSide('Client'..name, value) --? The value clientside start with Client
    end
end)