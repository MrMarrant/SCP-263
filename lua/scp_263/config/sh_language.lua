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
* Returns the element to be translated according to the server language.
* @string langName Language name (ex : en, fr)
* @table data The table contain the translations
--]]
function SCP_263.AddLanguage(langName, data)
    if (type(langName) == "string" and type(data) == "table") then
        SCP_263_LANG[langName] = data
    end
end

--[[
* Returns the element to be translated according to the server language.
* @string name Element to translate.
--]]
function SCP_263.GetTranslation(name)
    local langUsed = SCP_263_CONFIG.LangServer
    if not SCP_263_LANG[langUsed] then
        langUsed = "en" -- Default lang is EN.
    end
    return string.format( SCP_263_LANG[langUsed][ name ] or "Not Found" )
end

-----------GENERATE JSON FILE QUESTION-------------------

--? Default Questions, Edit the JSON file created instead of here.
SCP_263_CONFIG.QuestionList = {}
local QuestionList = {}

QuestionList["fr"] = {
	{
		question = "Dans quel Site est contenu SCP-682 ?",
		correct_answer = "a",
		response_a = "Site 12",
		response_b = "Site 20",
		response_c = "Site 32",
		response_d = "Aucun",
	},
	{
		question = "Que signifie le protocle XZ ?",
		correct_answer = "b",
		response_a = "Une fin du monde",
		response_b = "Plus de café",
		response_c = "Fin de l'Humanité",
		response_d = "Fin de la Civilisation",
	},
	{
		question = "Qu'est donc SCP 420-J",
		correct_answer = "d",
		response_a = "Un poisson alien",
		response_b = "Une statue avec un chapeau mexicain",
		response_c = "Un ancien président français anormal",
		response_d = "Un énorme pétard",
	},
    {
		question = "À qui obéit le comité d'éthique ?",
		correct_answer = "a",
		response_a = "Le conseil O5",
		response_b = "Les représentants du conseil 05",
		response_c = "L'administrateur du site dans lequel ils opèrent",
		response_d = "Le Superviseur",
	},
    {
		question = "Quel est la mission principale de la FIM Lambda-5",
		correct_answer = "c",
		response_a = "L'exploration de zone anormal",
		response_b = "La gestion des attaques terroristes anormal",
		response_c = "Le confinement d'anomalies",
		response_d = "L'entrainement des agents de terrain",
	},
    {
		question = "Dans quelle circonstance doit être appelé la FIM Lambda-5 ?",
		correct_answer = "a",
		response_a = "Lors d'un code MAGENTA",
		response_b = "Lors d'un code NOIR",
		response_c = "Lors d'une Initiatives de Réponse Automatisée de type RA-1",
		response_d = "Lors d'une rébellion des membres de Classe-D",
	},
    {
		question = "Pourquoi le comité d'éthique existe-t-il ?",
		correct_answer = "",
		response_a = "Ils n'ont pas d'utilité, ils sont inutile",
		response_b = "Pour protéger les membres de la fondation",
		response_c = "Pour sauver le personnel de Classe-D",
		response_d = "Pour poser les limites à la fondation",
	},
    {
		question = "Si une révolte du personnel éclate quel Fim doit intervenir ?",
		correct_answer = "",
		response_a = "",
		response_b = "",
		response_c = "",
		response_d = "",
	},
    {
		question = "",
		correct_answer = "",
		response_a = "",
		response_b = "",
		response_c = "",
		response_d = "",
	},
    {
		question = "",
		correct_answer = "",
		response_a = "",
		response_b = "",
		response_c = "",
		response_d = "",
	},
    {
		question = "",
		correct_answer = "",
		response_a = "",
		response_b = "",
		response_c = "",
		response_d = "",
	},


}

QuestionList["en"] = {
    {
		question = "In which Site is SCP-682 contained?",
		correct_answer = "a",
		response_a = "Site 12",
		response_b = "Site 20",
		response_c = "Site 32",
		response_d = "None",
	},
	{
		question = "What does the XZ protocol mean?",
		correct_answer = "b",
		response_a = "An end of the world",
		response_b = "No more coffee",
		response_c = "End of Humanity",
		response_d = "End of Civilization",
	},
	{
		question = "Who smoked a huge banger?",
		correct_answer = "d",
		response_a = "Dr Bright",
		response_b = "John Atand",
		response_c = "Chirac",
		response_d = "You",
	},
}

/*
* Allows to return the data of a file.
* @string path File path.
*/
local function GetDataFromFile(path)
    local fileFind = file.Read(path) or ""
    local dataFind = util.JSONToTable(fileFind) or {}
    return dataFind
end

-- DIRECTORY DATA FOLDER
if not file.Exists("data_scp263", "DATA") then
    file.CreateDir("data_scp263")
end

--? We create the file if it don't exist with the default params, and we load the file when everythig is set up.
for key, value in pairs(QuestionList) do
    local FilePath= "data_scp263/" .. key .. SCP_263_CONFIG.NameFileQuestion
    if not file.Exists(FilePath, "DATA") then
        file.Write(FilePath, util.TableToJSON( value, true ))
    end
end

--? We find every file store in data folder, and load every file
local DataSCP263 = file.Find( "data_scp263/*.json" .. "*", "DATA" ) --? Get every json files
for key, File in pairs(DataSCP263) do
	local prefix = string.lower( string.Left( File, 2 ) ) --? Lang Prefix
	SCP_263_CONFIG.QuestionList[prefix] = GetDataFromFile("data_scp263/" .. File)
end