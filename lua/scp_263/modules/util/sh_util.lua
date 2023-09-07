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
* Function used for get every players in sphere and filter.
* @Entity ent The entity center of the sphere.
--]]

local AnnouncerBase = "scp_263/announcer/"

function SCP_263.GetInSpherePlayers(ent, radius)
    local tableFilter = {}
    local entsFound = ents.FindInSphere( ent:GetPos(), radius )
    for key, value in ipairs(entsFound) do
        if (value:IsPlayer() and value:Alive()) then
            table.insert(tableFilter, value)
        end
    end
    return tableFilter, entsFound
end

function SCP_263.GetAnnouncer(ent, id)
    local Prefix = SCP_263_CONFIG.SoundLangHandled[SCP_263_CONFIG.LangServer] and SCP_263_CONFIG.LangServer or "en"
    local SoundToPlay = AnnouncerBase..Prefix.."/"..id.."_"..math.random(1, 2)..".mp3"

    ent:EmitSound(SoundToPlay)
end