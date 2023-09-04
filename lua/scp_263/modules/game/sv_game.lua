function SCP_263.StartGame(ply, ent)
    ent:SetIsOn(true)
    ent:SetCurrentPlayer(ply)
    SCP_263.InitAntiCheat(ply, ent)
    ent:EmitSound(SCP_263_CONFIG.SoundGenericIntro, 75, math.random( 100, 110 ))
    -- TODO : Lancer le générique

    timer.Simple(3, function()
        if not IsValid(ent) or not IsValid(ply) then return end

        SCP_263.NewQuestion(ply, ent)
    end)
end

function SCP_263.NewQuestion(ply, ent)
    ent:SetIsWaitingAnswer(false)
    local KeySelected = math.random(1, #ent.QuestionsList)
    local SelectedQuestion = ent.QuestionsList[KeySelected]
    table.remove(ent.QuestionsList, KeySelected) --? We don't want the question to be ask twice or more.

    net.Start(SCP_263_CONFIG.SetQuestions)
        net.WriteString(SelectedQuestion.question)
        net.WriteString(SCP_263.GetTranslation("scp_263.questions.answers.a") .. SelectedQuestion.response_a)
        net.WriteString(SCP_263.GetTranslation("scp_263.questions.answers.b") .. SelectedQuestion.response_b)
        net.WriteString(SCP_263.GetTranslation("scp_263.questions.answers.c") .. SelectedQuestion.response_c)
        net.WriteString(SCP_263.GetTranslation("scp_263.questions.answers.d") .. SelectedQuestion.response_d)
    net.Broadcast()

    ent:SetActualAnswer(SelectedQuestion.correct_answer)
    ent:SetIsIntroducingQuestion(true)

    timer.Simple(5, function()
        if not IsValid(ent) or not IsValid(ply) then return end

        ent:SetIsIntroducingQuestion(false)
        ent:SetIsWaitingAnswer(true)
        net.Start(SCP_263_CONFIG.StartTimer)
            net.WriteEntity(ent)
        net.Broadcast()
    end)
end

local function IsAnswerValid(text)
    local ParseText = string.lower(text)
    local Check = false
    for i = 1, 4 do
        local AnswerCheck = string.lower(SCP_263.GetTranslation("Answer_" .. i))
        if (AnswerCheck == ParseText) then
            Check = true
        end
    end
    return Check
end

function SCP_263.CheckAnswer(ent, ply, text)
    if (not IsValid(ent)) then return end
    if (ent:GetActualAnswer() == "") then return end
    if (not ent:GetIsOn() or not ent:GetIsWaitingAnswer()) then return end
    if (not IsAnswerValid(text)) then return end

    net.Start(SCP_263_CONFIG.StopTimer)
        net.WriteEntity(ent)
    net.Broadcast()

    local AnswerParse = string.lower(text)

    if (AnswerParse == string.lower(ent:GetActualAnswer())) then
        ent:EmitSound(SCP_263_CONFIG.SoundRightAnswer)
        local CountCorrectAnswer = ent:GetCountCorrectAnswer() + 1
        ent:SetCountCorrectAnswer(CountCorrectAnswer)
        if (CountCorrectAnswer == 3) then --? On donne la récompense et on termine la partie.
            SCP_263.RewardPlayer(ent)
            SCP_263.EndGame(ent)
        else --? On repose une nouvelle question
            SCP_263.NewQuestion(ply, ent)
        end
    else --? On brule le joueur et on termine la partie.
        ent:EmitSound(SCP_263_CONFIG.SoundWrongAnswer)
        SCP_263.BurnPlayer(ply)
        SCP_263.EndGame(ent)
    end
end

function SCP_263.EndGame(ent)
    ent:SetIsOn(false)
    ent:SetCurrentPlayer(nil)
    ent:SetIsWaitingAnswer(false)
	ent:SetIsEndingGame(false)
    ent:SetActualAnswer("")
    ent:SetCountCorrectAnswer(0)
    local QuestionListCopy = SCP_263_CONFIG.QuestionList[SCP_263_CONFIG.LangServer] or SCP_263_CONFIG.QuestionList["en"]
	ent.QuestionsList = table.Copy( QuestionListCopy) -- Reset questions list
    ent:StopEverySounds()
    hook.Remove( "PlayerCanHearPlayersVoice", "PlayerCanHearPlayersVoice.SCP263_AntiCheat_".. ent:EntIndex())
end