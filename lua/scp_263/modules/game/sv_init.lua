function SCP_263.StartGame(ply, ent)
    ent:SetIsOn(true)
    ent:SetCurrentPlayer(ply)
    ent:EmitSound(SCP_263_CONFIG.SoundGenericIntro, 75, math.random( 100, 110 ))
    -- TODO : Lancer le générique

    timer.Simple(3, function()
        if not IsValid(ent) or not IsValid(ply) then return end

        net.Start(SCP_263_CONFIG.SetQuestions)
            net.WriteString("Quel est le site dans lequel SCP-682 est confiné ?")
            net.WriteString("A : Site-19")
            net.WriteString("B : Site-17")
            net.WriteString("C : Site-13")
            net.WriteString("D : Aucun")
        net.Broadcast()

        ent:SetIsIntroducingQuestion(true)

        timer.Simple(5, function()
            if not IsValid(ent) or not IsValid(ply) then return end

            ent:SetIsIntroducingQuestion(false)
            ent:SetIsWaitingAnswer(true)
        end)
    end)
end