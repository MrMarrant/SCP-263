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

SCP_263_CONFIG.NameFileQuestion = "_questions.json"

-- Every langs handled by the mod
SCP_263_CONFIG.HandledLanguage = {
    "fr",
    "en",
}

-- The total time the player is burned
SCP_263_CONFIG.TimeToBurn = 42

-- The time the player has for answer the questions
SCP_263_CONFIG.TimetoAnswer = 45

-- The maximum distance delimitation of the game
SCP_263_CONFIG.MaximumDelimitationGame = 200

-- Every models that can be rewarded
SCP_263_CONFIG.ModelsReward = {
    "models/food/burger.mdl",
    "models/food/hotdog.mdl",
    "models/player/items/humans/top_hat.mdl",
}

SCP_263_CONFIG.NumberOfQuestion = 1

SCP_263_CONFIG.SoundWrongAnswer = Sound( "" )

SCP_263_CONFIG.SoundRightAnswer = Sound( "" )

SCP_263_CONFIG.SoundGenericIntro = Sound( "scp_263/generic.mp3" )

SCP_263_CONFIG.SetQuestions = "SCP_263_CONFIG.SetQuestions"

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
for key, value in pairs(SCP_263_CONFIG.HandledLanguage) do
    local FilePath= "data_scp263/" .. value .. SCP_263_CONFIG.NameFileQuestion
    if not file.Exists(FilePath, "DATA") then
        file.Write(FilePath, util.TableToJSON( QuestionList[value], true ))
    end
    SCP_263_CONFIG.QuestionList[value] = GetDataFromFile("data_scp263/" .. value .. SCP_263_CONFIG.NameFileQuestion)
end