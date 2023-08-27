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

/*
* Returns the element to be translated according to the server language.
* @string langName Language name (ex : en, fr)
* @table data The table contain the translations
*/
function SCP_263.AddLanguage(langName, data)
    if (type(langName) == "string" and type(data) == "table") then
        SCP_263_LANG[langName] = data
    end
end

/*
* Returns the element to be translated according to the server language.
* @string name Element to translate.
*/
function SCP_263.GetTranslation(name)
    local langUsed = SCP_263_CONFIG.LangServer
    if not SCP_263_LANG[langUsed] then
        langUsed = "en" -- Default lang is EN.
    end
    return string.format( SCP_263_LANG[langUsed][ name ] or "Not Found" )
end