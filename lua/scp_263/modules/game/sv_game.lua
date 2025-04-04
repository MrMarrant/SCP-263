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

local AnswersLetter = {
    a = true,
    b = true,
    c = true,
    d = true
}

--[[
* Start a new game.
* @Player ply The play who has send the text
* @Entity ent SCP-263
--]]
function SCP_263.StartGame(ply, ent)
    ent:SetIsOn(true)
    ent:SetCurrentPlayer(ply)
    ply:ChatPrint( SCP_263.GetTranslation("tuto_answer") )
    if (SCP_263_CONFIG.EnableAntiCheat:GetBool()) then
        SCP_263.InitAntiCheat(ply, ent)
    end
    ent:EmitSound(SCP_263_CONFIG.SoundGenericIntro, 75, math.random( 100, 110 ))
    ent:EmitSound(SCP_263_CONFIG.SoundApplauseGeneric, 75, math.random( 100, 110 ))
    SCP_263.GetAnnouncer(ent, "generic")

    timer.Create("SCP263_StartGame_".. ent:EntIndex(), 20, 1, function()
        if not IsValid(ent) or not IsValid(ply) then return end
        if (not ent:GetIsOn() or ent:GetIsEndingGame()) then return end

        ent:SetSkin(6)
        SCP_263.NewQuestion(ply, ent)
    end)
end

--[[
* Start a new question ask to the player.
* @Player ply The play who has send the text
* @Entity ent SCP-263
--]]
function SCP_263.NewQuestion(ply, ent)
    ent:SetSkin(6)
    local KeySelected = math.random(1, #ent.QuestionsList)
    local SelectedQuestion = ent.QuestionsList[KeySelected]
    table.remove(ent.QuestionsList, KeySelected) --? We don't want the question to be ask twice or more.

    net.Start(SCP_263_CONFIG.SetQuestions)
        net.WriteString(SelectedQuestion.question)
        net.WriteString(SCP_263.GetTranslation("Answer_a") .. " : " .. SelectedQuestion.response_a)
        net.WriteString(SCP_263.GetTranslation("Answer_b") .. " : "  .. SelectedQuestion.response_b)
        net.WriteString(SCP_263.GetTranslation("Answer_c") .. " : "  .. SelectedQuestion.response_c)
        net.WriteString(SCP_263.GetTranslation("Answer_d") .. " : "  .. SelectedQuestion.response_d)
    net.Broadcast()

    ent:SetActualAnswer(SelectedQuestion.correct_answer)
    ent:SetIsIntroducingQuestion(true)

    timer.Create("SCP263_NewQuestion_".. ent:EntIndex(), 5, 1, function()
        if not IsValid(ent) or not IsValid(ply) then return end
        if (not ent:GetIsOn() or ent:GetIsEndingGame()) then return end

        ent:StartLoopingSound(SCP_263_CONFIG.SoundTimerDecay)
        ent:SetSkin(5)
        ent:SetIsIntroducingQuestion(false)
        ent:SetIsWaitingAnswer(true)
        SCP_263.InitTimer(ent, ply)
    end)
end

--[[
* Returns if the text send, is one of the possible answers expected.
* @string text The text answer
--]]
local function IsAnswerValid(text)
    local ParseText = string.lower(text)
    local Check = false
    for key, value in pairs(AnswersLetter) do
        local AnswerCheck = string.lower(SCP_263.GetTranslation("Answer_" .. key))
        if (AnswerCheck == ParseText) then
            Check = true
        end
    end
    return Check
end

--[[
* Manage what to do depend on the answer send by the player.
* @Entity ent SCP-263
* @Player ply The play who has send the text
* @string text The text answer
--]]
function SCP_263.CheckAnswer(ent, ply, text)
    if (not IsValid(ent)) then return end
    if (ent:GetActualAnswer() == "") then return end
    if (not ent:GetIsOn() or not ent:GetIsWaitingAnswer()) then return end
    if (not IsAnswerValid(text)) then return end

    ent:StopSound(SCP_263_CONFIG.SoundTimerDecay)
    ent:SetIsWaitingAnswer(false)
    net.Start(SCP_263_CONFIG.StopTimer)
        net.WriteEntity(ent)
    net.Broadcast()

    local AnswerParse = string.lower(text)

    if (AnswerParse == string.lower(ent:GetActualAnswer())) then
        ent:EmitSound(SCP_263_CONFIG.SoundRightAnswer)
        local CountCorrectAnswer = ent:GetCountCorrectAnswer() + 1
        ent:SetCountCorrectAnswer(CountCorrectAnswer)
        timer.Remove("SCP263_InitTimer_".. ent:EntIndex()) --? On arrête le timer crée
        if (CountCorrectAnswer == 3) then --? On donne la récompense et on termine la partie.
            ent:EmitSound(SCP_263_CONFIG.SoundApplauseWin, 75, math.random( 100, 110 ))
            SCP_263.EndGame(ent, 20, 7, "winner", true)
        else --? On repose une nouvelle question
            ent:EmitSound(SCP_263_CONFIG.SoundApplause, 75, math.random( 100, 110 ))
            ent:SetSkin(2)
            SCP_263.GetAnnouncer(ent, "good_answer")
            timer.Simple(5, function()
                if not IsValid(ent) or not IsValid(ply) then return end
                if (not ent:GetIsOn() or ent:GetIsEndingGame()) then return end
        
                SCP_263.NewQuestion(ply, ent)
            end)
        end
    else --? On brule le joueur et on termine la partie.
        ent:EmitSound(SCP_263_CONFIG.SoundWrongAnswer)
        SCP_263.EndGame(ent, 13, 3, "wrong_answer", false)
    end
end

--[[
* Manage every var for reset like intial.
* @Entity ent SCP-263
--]]
local function ResetEnt(ent)
    ent:SetSkin(0)
    ent:SetIsOn(false)
    ent:SetCurrentPlayer(nil)
    ent:SetIsWaitingAnswer(false)
    ent:SetIsIntroducingQuestion(false)
	ent:SetIsEndingGame(false)
    ent:SetActualAnswer("")
    ent:SetCountCorrectAnswer(0)
    local QuestionListCopy = SCP_263_CONFIG.QuestionList[SCP_263_CONFIG.LangServer] or SCP_263_CONFIG.QuestionList["en"] or SCP_263_CONFIG.DefaultQuestionList["en"]
	ent.QuestionsList = table.Copy( QuestionListCopy) -- Reset questions list
    ent:StopEverySounds()
    hook.Remove( "PlayerCanHearPlayersVoice", "PlayerCanHearPlayersVoice.SCP263_AntiCheat_".. ent:EntIndex())
    timer.Remove("SCP263_InitTimer_".. ent:EntIndex()) --? On arrête le timer crée
    timer.Remove("SCP263_StartGame_".. ent:EntIndex())
    timer.Remove("SCP263_NewQuestion_".. ent:EntIndex())
    ent:SetIsPostEndGame(true)

    timer.Simple(5, function()
        if not IsValid(ent) then return end

        ent:SetIsPostEndGame(false)
    end)
end

--[[
* End the current game and init event depend on value set.
* @Entity ent SCP-263
* @number delay The delay before the end of the game
* @number idSkin The skin to set to the entity
* @string idAnouncer The id of the announcer to play
* @boolean isReward If the player has win the game or not
--]]
function SCP_263.EndGame(ent, delay, idSkin, idAnouncer, isReward)
    ent:StopSound(SCP_263_CONFIG.SoundTimerDecay)
    ent:SetIsWaitingAnswer(false)
    ent:SetIsEndingGame(true)
    ent:SetSkin(idSkin)
    SCP_263.GetAnnouncer(ent, idAnouncer)
    timer.Simple(delay, function()
        if (not IsValid(ent)) then return end

        local ply = ent:GetCurrentPlayer()

        if (isReward) then
            SCP_263.RewardPlayer(ent)
        elseif (IsValid(ply)) then
            SCP_263.BurnPlayer(ply)
        end
        ResetEnt(ent)
    end)
end