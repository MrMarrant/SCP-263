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
* End the current game and manage every var for reset like intial.
* @Entity ent SCP-263
* @Player ply The player to hugabanga if timer hit 0.
--]]
function SCP_263.InitTimer(ent, ply)
    net.Start(SCP_263_CONFIG.StartTimer)
        net.WriteEntity(ent)
    net.Broadcast()

    timer.Create("SCP263_InitTimer_".. ent:EntIndex(), SCP_263_CONFIG.TimeToAnswer:GetInt(), 1, function()
        if not IsValid(ent) or not IsValid(ply) then return end

        ent:SetSkin(3)
        ent:EmitSound(SCP_263_CONFIG.SoundWrongAnswer)
        timer.Simple(3, function()
            if (IsValid(ent)) then
                SCP_263.BurnPlayer(ply)
                SCP_263.EndGame(ent)
            end
        end)
    end)
end