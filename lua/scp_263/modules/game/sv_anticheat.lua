-- Detect if a player is speaking to the current player who is playing a game
local function DetectSpeakingToPlayer(plyTalker, plyListener)
    if not IsValid(plyTalker) or not IsValid(plyListener) then
        return false
    end

    local directionParleVersCible = (plyListener:GetPos() - plyTalker:GetPos()):GetNormalized()
    local directionRegardParle = plyTalker:EyeAngles():Forward()

    local dotProduct = directionRegardParle:Dot(directionParleVersCible)

    -- Un produit scalaire proche de 1 indique que le joueur qui parle, regarde dans la direction de l'autre joueur
    local tolerance = 0.95

    return dotProduct >= tolerance
end

function SCP_263.InitAntiCheat(ply, ent)
    hook.Add( "PlayerCanHearPlayersVoice", "PlayerCanHearPlayersVoice.SCP263_AntiCheat_".. ent:EntIndex(), function( listener, talker )
        if (IsValid(ent) and IsValid(ply)) then
            if (listener == ply and ent:GetIsOn() and ent:GetIsWaitingAnswer()) then
                local IsCheating = DetectSpeakingToPlayer(talker, listener)
                if (IsCheating) then
                    ent:EmitSound(SCP_263_CONFIG.SoundWrongAnswer)
                    SCP_263.BurnPlayer(ply)
                    SCP_263.EndGame(ent)
                end
            end
        end
    end )
    -- TODO : Détecter si un joueur ouvre le menu Steam ??
end