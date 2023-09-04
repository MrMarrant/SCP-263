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

hook.Add("PopulateToolMenu", "PopulateToolMenu.SCP263_MenuConfig", function()
    spawnmenu.AddToolMenuOption("Utilities", "SCP-263", "SCP263_MenuConfig", "Settings", "", "", function(panel)
        local ply = LocalPlayer()

        local SCP263_TimeToBurn = vgui.Create("DNumSlider")
        SCP263_TimeToBurn:SetPos( 5, 5 )
        SCP263_TimeToBurn:SetSize( 100, 20 )
        SCP263_TimeToBurn:SetMinMax( 1, 999 )
        SCP263_TimeToBurn:SetDecimals( 0 )
        SCP263_TimeToBurn:SetValue( SCP_263_CONFIG.ClientTimeToBurn )
        SCP263_TimeToBurn.OnValueChanged = function(NumSlider, val)
            SCP_263.SetConvarInt("TimeToBurn", val, ply)
        end

        local SCP263_TimeToAnswer = vgui.Create("DNumSlider")
        SCP263_TimeToAnswer:SetPos( 5, 5 )
        SCP263_TimeToAnswer:SetSize( 100, 20 )
        SCP263_TimeToAnswer:SetMinMax( 1, 600 )
        SCP263_TimeToAnswer:SetDecimals( 0 )
        SCP263_TimeToAnswer:SetValue( SCP_263_CONFIG.ClientTimeToAnswer )
        SCP263_TimeToAnswer.OnValueChanged = function(NumSlider, val)
            SCP_263.SetConvarInt("TimeToAnswer", val, ply)
        end

        local SCP263_MaximumDelimitationGame = vgui.Create("DNumSlider")
        SCP263_MaximumDelimitationGame:SetPos( 5, 5 )
        SCP263_MaximumDelimitationGame:SetSize( 100, 20 )
        SCP263_MaximumDelimitationGame:SetMinMax( 10, 9999 )
        SCP263_MaximumDelimitationGame:SetDecimals( 0 )
        SCP263_MaximumDelimitationGame:SetValue( SCP_263_CONFIG.ClientMaximumDelimitationGame )
        SCP263_MaximumDelimitationGame.OnValueChanged = function(NumSlider, val)
            SCP_263.SetConvarInt("MaximumDelimitationGame", val, ply)
        end

        panel:Clear()
        panel:ControlHelp("#scp_263.config.menu.warning_setting")
        panel:Help( "#scp_263.config.menu.time_to_burn" )
        panel:AddItem(SCP263_TimeToBurn)
        panel:Help( "#scp_263.config.menu.time_to_answer" )
        panel:AddItem(SCP263_TimeToAnswer)
        panel:Help( "#scp_263.config.menu.maximum_delimitation_game" )
        panel:AddItem(SCP263_MaximumDelimitationGame)
    end)
end)