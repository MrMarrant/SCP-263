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

/* 
* Set a Server Convar to ClientSide (if that sound stupid, it's because it is)
* @string name
* @number value
* @Player ply
*/
function SCP_263.SetConvarClientSide(name, value, ply)
    if (type( value ) == "boolean") then value = value and 1 or 0 end
    net.Start(SCP_263_CONFIG.SetConvarClientSide)
        net.WriteString(name)
        net.WriteUInt(value, 14)
    if (ply) then
        net.Send(ply)
    else
        net.Broadcast()
    end
end


hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn.SCP263_ClientConVar", function(ply)
    SCP_263.SetConvarClientSide("ClientTimeToBurn", SCP_263_CONFIG.TimeToBurn:GetInt(), ply)
    SCP_263.SetConvarClientSide("ClientTimeToAnswer", SCP_263_CONFIG.TimeToAnswer:GetInt(), ply)
    SCP_263.SetConvarClientSide("ClientMaximumDelimitationGame", SCP_263_CONFIG.MaximumDelimitationGame:GetInt(), ply)
end)