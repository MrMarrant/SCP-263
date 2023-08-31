function SCP_263.BurnPlayer(ply)
    if (not IsValid(ply)) then return end

    ply:Ignite( SCP_263_CONFIG.TimeToBurn, 0 )
end

function SCP_263.EndGame(ent)
    ent:SetIsOn(false)
    ent:SetCurrentPlayer(nil)
    ent:SetIsWaitingAnswer(false)
	ent:SetIsEndingGame(false)
    ent:SetActualAnswer("")
    ent:SetCountCorrectAnswer(0)
    self.QuestionsList = SCP_263_CONFIG.QuestionList[SCP_263_CONFIG.LangServer] or SCP_263_CONFIG.QuestionList["en"] -- Reset questions list
    ent:StopEverySounds()
end

function SCP_263.RewardPlayer(ent)
    if (not IsValid(ent)) then return end

    local Reward = ents.Create( "reward_scp263" )
    Reward:SetPos(ent:GetPos() + ent:GetForward() * 20)
    Reward:Spawn()
    Reward:Activate()
end