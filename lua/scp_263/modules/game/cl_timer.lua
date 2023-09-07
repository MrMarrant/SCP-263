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

local TimerLeft = 0
local font = "DermaLarge"
local textColor = Color(255, 255, 255)

--[[
* Start the timer client side
* @Entity ent SCP-263
--]]
function SCP_263.StartTimer(ent)
    TimerLeft = SCP_263_CONFIG.ClientTimeToAnswer
    timer.Create("SCP263_StartTimer_".. ent:EntIndex(), 1, TimerLeft, function()
        TimerLeft = TimerLeft - 1
    end)
end

--[[
* Stop the timer client side
* @Entity ent SCP-263
--]]
function SCP_263.StopTimer(ent)
    TimerLeft = 0
    timer.Remove("SCP263_StartTimer_".. ent:EntIndex())
end

--[[
* Display the timer client on nearby players
* @Entity ent SCP-263
--]]
function SCP_263.DisplayTimer(ent)
    if (ent:GetIsWaitingAnswer() and ent:GetIsOn()) then
        draw.SimpleText(tostring(TimerLeft), font, SCP_263_CONFIG.ScrW * 0.5, SCP_263_CONFIG.ScrH * 0.1, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    end
end

net.Receive(SCP_263_CONFIG.StartTimer, function()
    ent = net.ReadEntity()
    if (not IsValid(ent)) then return end

    SCP_263.StartTimer(ent)
end)

net.Receive(SCP_263_CONFIG.StopTimer, function()
    ent = net.ReadEntity()
    if (not IsValid(ent)) then return end
    
    SCP_263.StopTimer(ent)
end)