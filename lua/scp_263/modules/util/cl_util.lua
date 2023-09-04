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
*   Wrap a text to include line break into text, depend on maxWidth
*   @string text The text to wrap
*   @number maxWidth Max width 
*   @boolean explode if rue, we return the result into an array
--]]
function SCP_263.WrapText(text, maxWidth, explode)
    local words = string.Explode(" ", text)
    local lines = {""}
    local currentLine = 1
    local currentWidth = 0

    for _, word in ipairs(words) do
        local wordWidth = surface.GetTextSize(word .. " ")

        if currentWidth + wordWidth > maxWidth or wordWidth > SCP_263_CONFIG.ScrW then
            currentLine = currentLine + 1
            currentWidth = wordWidth
            lines[currentLine] = word .. " "
        else
            currentWidth = currentWidth + wordWidth
            lines[currentLine] = lines[currentLine] .. word .. " "
        end
    end

    local finalText = ""

    for i, line in ipairs(lines) do
        finalText = finalText .. line

        if i < #lines then
            finalText = finalText .. "\n"
        end
    end

    if (explode) then
        finalText = string.Explode("\n", finalText)
    end

    return finalText
end

net.Receive(SCP_263_CONFIG.SetConvarClientSide, function ()
    local name = net.ReadString()
    local value = net.ReadUInt(14)
    SCP_263_CONFIG[name] = value
end)