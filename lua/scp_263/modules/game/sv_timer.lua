--[[
*   End the current game and manage every var for reset like intial.
*   @Entity ent SCP-263
*   @Player ply The player to hugabanga if timer hit 0.
--]]
function SCP_263.InitTimer(ent, ply)
    net.Start(SCP_263_CONFIG.StartTimer)
        net.WriteEntity(ent)
    net.Broadcast()

    timer.Create("SCP263_InitTimer_".. ent:EntIndex(), SCP_263_CONFIG.ClientTimeToAnswer, 1, function()
        if not IsValid(ent) or not IsValid(ply) then return end

        ent:EmitSound(SCP_263_CONFIG.SoundWrongAnswer)
        SCP_263.BurnPlayer(ply)
        SCP_263.EndGame(ent)
    end)
end