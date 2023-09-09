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
		correct_answer = "d",
		response_a = "Site 12",
		response_b = "Site 20",
		response_c = "Site 32",
		response_d = "Aucun de ceux évoqué",
	},
	{
		question = "Que signifie un Scénario de Classe XK ?",
		correct_answer = "a",
		response_a = "Fin du monde",
		response_b = "Destruction de la réalité",
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
		correct_answer = "d",
		response_a = "Ils n'ont pas d'utilité, ils sont inutile",
		response_b = "Pour protéger les membres de la fondation",
		response_c = "Pour sauver le personnel de Classe-D",
		response_d = "Pour poser les limites à la fondation",
	},
    {
		question = "Si une révolte du personnel éclate quel Fim doit intervenir ?",
		correct_answer = "c",
		response_a = "La Alpha-1",
		response_b = "La Omega-1",
		response_c = "La Thau-5",
		response_d = "La Omicron Rhô",
	},
    {
		question = "Qui est Bobble/Pompon le Clown ?",
		correct_answer = "a",
		response_a = "Un clown visible uniquement par les enfants",
		response_b = "SCP-2094",
		response_c = "Un clown de cirque d'élevage",
		response_d = "SCP-2912-3",
	},
    {
		question = "Quelle est la procédure standard selon la Fondation pour contenir les SCP ?",
		correct_answer = "a",
		response_a = "Les confiner dans une cellule de confinement conforme à leur dangerosité et à leurs besoins spécifiques.",
		response_b = "Les confiner et tenter de les détruires",
		response_c = "Les étudier et les comprendre avant de les confiner",
		response_d = "Les faire apparaître dans la lumière",
	},
    {
		question = "Quel est la figure la plus importante du groupe d'intérêt 'L'Église du Dieu Brisé' ?",
		correct_answer = "b",
		response_a = "SCP-914",
		response_b = "Robert Bumaro",
		response_c = "Un épouventail mécanique vivant",
		response_d = "SCP-2217",
	},
    {
		question = "Quel est la procédure 110-Montauk ?",
		correct_answer = "d",
		response_a = "Une procédure extrêmement violente qui consiste à ████████ SCP-231-7",
		response_b = "Raconter une histoire à SCP-231-7",
		response_c = "Réaliser un sacrifice au nom du Roi écarlate",
		response_d = "Personne ne sais",
	},
	{
		question = "Et maintenant, on est ... ?",
		correct_answer = "c",
		response_a = "Pas Cool",
		response_b = "Bien",
		response_c = "Cool",
		response_d = "Thaumiel",
	},
	{
		question = "Cinq ans, dix mois, vingt-huit jours",
		correct_answer = "a",
		response_a = "Rouge",
		response_b = "Vert",
		response_c = "Jaune",
		response_d = "Violet",
	},
	{
		question = "Celui dont on ne dois pas prononcer le nom",
		correct_answer = "c",
		response_a = "SCP-2521",
		response_b = "Lui",
		response_c = "●●|●●●●●|●●|●",
		response_d = "●●|●|●●●|●●",
	},
	{
		question = "La Procédure 220-Calabasas ...",
		correct_answer = "d",
		response_a = "Empeche le déconfinement de SCP-106",
		response_b = "Est un protocole d'urgence lors d'un scénario de classe PK",
		response_c = "Un mélange de pratique ésotérique des principals religions monothéiste",
		response_d = "Est inutile",
	},
	{
		question = "Le magasin est désormais fermé, veuillez quitter le bâtiment",
		correct_answer = "b",
		response_a = "SCP-2030",
		response_b = "SCP-3008-2",
		response_c = "KLEPPSTAD",
		response_d = "SKUBB",
	},
	{
		question = "Je produit de charmant meuble très causy d'origine entièrement naturel, je suis ?",
		correct_answer = "c",
		response_a = "Un magasin de meuble",
		response_b = "SCP-3008",
		response_c = "SCP-002",
		response_d = "SCP-1025",
	},
	{
		question = "Ce n'est pas rond",
		correct_answer = "b",
		response_a = "SCP-5000",
		response_b = "SCP-055",
		response_c = "C'est carré",
		response_d = "SCP-002",
	},
	{ -- 20
		question = "Que fais ████████ ?",
		correct_answer = "d",
		response_a = "●●|●●●●●|●●|●",
		response_b = "Il est vivant",
		response_c = "Il est mort",
		response_d = "████████",
	},
	{
		question = "Quel est la seul classe d'agents permettant de se souvenir de choses ?",
		correct_answer = "b",
		response_a = "Classe A",
		response_b = "Classe W",
		response_c = "Classe D",
		response_d = "Classe G",
	},
	{
		question = "Et voilà. Une Hawaïenne, une Extra-Viande, c'est bien ça, messieurs ?",
		correct_answer = "a",
		response_a = "Ruiz Duchamp",
		response_b = "Le Sculpteur",
		response_c = "L'Agrafeur",
		response_d = "L’Homme",
	},
	{
		question = "Il a le plus grand cirque anormale du monde, il est ... ?",
		correct_answer = "c",
		response_a = "Dr Bright",
		response_b = "Dr. Clef",
		response_c = "Herman Fuller ",
		response_d = "Le Découpeur",
	},
	{
		question = "Quel est la classe d'agents permettant de faire entrer dans un état d'amnésie temporaire ?",
		correct_answer = "d",
		response_a = "Classe C",
		response_b = "Classe D",
		response_c = "Classe G",
		response_d = "Classe I",
	},
	{
		question = "SUICIDE TOI ! WOWWII ! SUICID TWA ! WOWWII ! Wowwii ...",
		correct_answer = "a",
		response_a = "Personne meurt",
		response_b = "Est-ce ainsi que la rationalité cherche à exister, peux être devrions nous plus mûrement y réfléchir dans un cadre plus serein, non ?",
		response_c = "wowwii tu té suicider",
		response_d = "15:18:20",
	},
}

QuestionList["en"] = {
	{
		question = "In which Site is SCP-682 contained?",
		correct_answer = "d",
		response_a = "Site 12",
		response_b = "Site 20",
		response_c = "Site 32",
		response_d = "None of them",
	},
	{
		question = "What does an XK Class Scenario mean?",
		correct_answer = "a",
		response_a = "End of the world",
		response_b = "Destruction of reality",
		response_c = "End of Humanity",
		response_d = "End of Civilization",
	},
	{
		question = "What is SCP 420-J",
		correct_answer = "d",
		response_a = "An alien fish",
		response_b = "A statue with a Mexican hat",
		response_c = "An abnormal former French president",
		response_d = "A huge weed",
	},
    {
		question = "Who does the ethics committee obey ?",
		correct_answer = "a",
		response_a = "To the Council O5",
		response_b = "The representatives of council 05",
		response_c = "The administrator of the site where they operate",
		response_d = "The Supervisor",
	},
    {
		question = "What is the main mission of FIM Lambda-5",
		correct_answer = "c",
		response_a = "Abnormal zone exploration",
		response_b = "Management of abnormal terrorist attacks",
		response_c = "Containment of anomalies",
		response_d = "Field agent training",
	},
	{
		question = "Under what circumstances should the FIM Lambda-5 be called ?",
		correct_answer = "a",
		response_a = "During a MAGENTA code",
		response_b = "During a BLACK code",
		response_c = "During an Automated Response Initiative type RA-1",
		response_d = "When Class-D members rebel",
	},
    {
		question = "Why does the ethics committee exist?",
		correct_answer = "d",
		response_a = "They have no use, they're useless",
		response_b = "To protect foundation members",
		response_c = "To save the Class-D staff",
		response_d = "To set limits for the foundation",
	},
    {
		question = "If a staff revolt breaks out, which Fim should intervene ?",
		correct_answer = "c",
		response_a = "The Alpha-1",
		response_b = "The Omega-1",
		response_c = "The Thau-5",
		response_d = "The Omicron Rhô",
	},
	{
		question = "Who is Bobble the Clown?",
		correct_answer = "a",
		response_a = "A clown visible only to children",
		response_b = "SCP-2094",
		response_c = "A breeding circus clown",
		response_d = "SCP-2912-3",
	},
	{
		question = "What is the Foundation's standard procedure for containing SCP ?",
		correct_answer = "a",
		response_a = "Contain them in a containment cell in accordance with their dangerousness and specific needs",
		response_b = "Contain them and attempt to destroy them",
		response_c = "Study and understand them before confining them",
		response_d = "Make them appear in the light",
	},
	{
		question = "Who is the most important figure in the 'Church of the Broken God' interest group?",
		correct_answer = "b",
		response_a = "SCP-914",
		response_b = "Robert Bumaro",
		response_c = "A living mechanical scarecrow",
		response_d = "SCP-2217",
	},
	{
		question = "What is the 110-Montauk procedure?",
		correct_answer = "d",
		response_a = "An extremely violent procedure that consists of ████████ SCP-231-7",
		response_b = "Telling SCP-231-7 a story",
		response_c = "Performing a sacrifice in the name of the Scarlet King",
		response_d = "Nobody knows",
	},
	{
		question = "Are we ... yet ?",
		correct_answer = "c",
		response_a = "Not Cool",
		response_b = "Good",
		response_c = "Cool",
		response_d = "Thaumiel",
	},
	{
		question = "Five years, ten months, twenty-eight days",
		correct_answer = "a",
		response_a = "Red",
		response_b = "Green",
		response_c = "Yellow",
		response_d = "Violet",
	},
	{
		question = "The one whose name must not be spoken",
		correct_answer = "c",
		response_a = "SCP-2521",
		response_b = "Him",
		response_c = "●●|●●●●●|●●|●",
		response_d = "●●|●●●●●●●",
	},
	{
		question = "Procedure 220-Calabasas ...",
		correct_answer = "d",
		response_a = "Prevents the deconfinement of SCP-106",
		response_b = "Is an emergency protocol in a class PK scenario",
		response_c = "A mixture of esoteric practices of the main monotheistic religions",
		response_d = "Is useless",
	},
	{
		question = "The store is now closed, please exit the building",
		correct_answer = "b",
		response_a = "SCP-2030",
		response_b = "SCP-3008-2",
		response_c = "KLEPPSTAD",
		response_d = "SKUBB",
	},
	{
		question = "I produce charming, all-natural causy furniture, Who am i ?",
		correct_answer = "c",
		response_a = "A furniture store",
		response_b = "SCP-3008",
		response_c = "SCP-002",
		response_d = "SCP-1025",
	},
	{
		question = "This is not round",
		correct_answer = "b",
		response_a = "SCP-5000",
		response_b = "SCP-055",
		response_c = "It's square",
		response_d = "SCP-002",
	},
	{
		question = "What is ████████ ?",
		correct_answer = "d",
		response_a = "●●|●●●●●|●●|●",
		response_b = "He's alive",
		response_c = "He's dead",
		response_d = "████████",
	},
	{
		question = "What's the only class of agent that can remind you of something ?",
		correct_answer = "b",
		response_a = "Class A",
		response_b = "Class W",
		response_c = "Class D",
		response_d = "Class G",
	},
	{
		question = "That you are. One Hawaiian, one meat lovers, is that right, gentlemen ?",
		correct_answer = "a",
		response_a = "Ruiz Duchamp",
		response_b = "The Sculptor",
		response_c = "The Clipper",
		response_d = "The Man",
	},
	{
		question = "He has the biggest abnormal circus in the world, it is ... ?",
		correct_answer = "c",
		response_a = "Dr Bright",
		response_b = "Dr. Clef",
		response_c = "Herman Fuller",
		response_d = "The Snipper",
	},
	{
		question = "Which agent class can be used to enter a state of temporary amnesia ?",
		correct_answer = "d",
		response_a = "Class C",
		response_b = "Class D",
		response_c = "Class G",
		response_d = "Class I",
	},
	{
		question = "KILL YOURSELF! WOWWEE! GO KILL YOURSELF! WOWWEE! Wowwee…",
		correct_answer = "a",
		response_a = "Nobody dies",
		response_b = "Is this how rationality tries to exist? Perhaps we should think more carefully about this in a more serene environment, don't you think ?",
		response_c = "wowwee u kild ursefl",
		response_d = "15:18:20",
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