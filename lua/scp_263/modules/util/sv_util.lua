function SCP_263.BurnPlayer(ply)
    if (not IsValid(ply)) then return end

    ply:Ignite( SCP_263_CONFIG.TimeToBurn:GetInt(), 0 )
end

function SCP_263.RewardPlayer(ent)
    if (not IsValid(ent)) then return end

    local Reward = ents.Create( "reward_scp263" )
    Reward:SetPos(ent:GetPos() + ent:GetForward() * 20)
    Reward:Spawn()
    Reward:Activate()
end