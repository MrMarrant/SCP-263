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

SCP_263_CONFIG.ScrW = ScrW()
SCP_263_CONFIG.ScrH = ScrH()

--? Default Value Convar
SCP_263_CONFIG.ClientTimeToBurn = 42
SCP_263_CONFIG.ClientTimeToAnswer = 45
SCP_263_CONFIG.ClientMaximumDelimitationGame = 500

surface.CreateFont( "SCP263_TitleQuestion", {
    font = "Arial",
    size = 70,
} )

surface.CreateFont( "SCP263_TitleQuestionThin", {
    font = "Arial",
    size = 50,
} )

surface.CreateFont( "SCP263_Answers", {
    font = "Roboto Mono",
    size = 25,
} )

hook.Add( "OnScreenSizeChanged", "OnScreenSizeChanged.SCP263_ScreenSize", function( oldWidth, oldHeight )
    SCP_263_CONFIG.ScrW = ScrW()
    SCP_263_CONFIG.ScrH = ScrH()
end )