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


ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Author = "MrMarrant"
ENT.PrintName = "SCP-263"
ENT.Spawnable = true
ENT.Category = "SCP"

-- Set up every var related to the entity we will use
function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "IsOn")
    self:NetworkVar("Bool", 1, "IsWaitingAnswer")
    self:NetworkVar("Bool", 2, "IsEndingGame")
    self:NetworkVar("Entity", 0, "CurrentPlayer")
end