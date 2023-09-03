local ActualQuestion = ""
local Answers = {
    Answer_1 = "",
    Answer_2 = "",
    Answer_3 = "",
    Answer_4 = "",
}

-- TODO : affiche les questions au joueurs
function SCP_263.DisplayQuestions(ent)
    if (ActualQuestion == "" or not ActualQuestion) then return end
    if (not ent:GetIsOn() or (not ent:GetIsWaitingAnswer() and not ent:GetIsIntroducingQuestion())) then return end

    local ply = LocalPlayer()
    if (ply:GetPos():Distance(ent:GetPos()) > SCP_263_CONFIG.ClientMaximumDelimitationGame) then return end

    --? On affiche la question en grand au milieu de l'écran du joueur.
    if (ent:GetIsIntroducingQuestion()) then
        surface.SetFont("SCP263_TitleQuestion")
        local WrapQuestion = SCP_263.WrapText(ActualQuestion, SCP_263_CONFIG.ScrW * 0.5, true)
		local y = 0

		for key, value in pairs(WrapQuestion) do
			local textWidth, textHeight = surface.GetTextSize(value)
			surface.SetTextColor(Color(255, 255, 255))
			surface.SetTextPos(SCP_263_CONFIG.ScrW * 0.5 - textWidth * 0.5, SCP_263_CONFIG.ScrH * 0.3 + y)
			surface.DrawText(value)
			y = y + 50
		end
    end
    --? On affiche la question et les réponses possible.
    if (ent:GetIsWaitingAnswer()) then
        local titleWidth, titleHeight = surface.GetTextSize(ActualQuestion)
        local titleX = SCP_263_CONFIG.ScrW * 0.5 - titleWidth * 0.5
        local titleY = SCP_263_CONFIG.ScrH * 0.2
        draw.SimpleText(ActualQuestion, "DermaLarge", titleX, titleY, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

        -- Rectangles Dimensions
        local rectWidth = SCP_263_CONFIG.ScrW * 0.4
        local rectHeight = SCP_263_CONFIG.ScrH * 0.1
        local rectMargin = SCP_263_CONFIG.ScrW * 0.05
        local rectStartY = SCP_263_CONFIG.ScrH * 0.3

        for i = 1, 4 do
            local rectX = (i % 2 == 1) and rectMargin or (SCP_263_CONFIG.ScrW * 0.5 + rectMargin)
            local rectY = rectStartY + (math.floor((i - 1) / 2) * (rectHeight + rectMargin))

            draw.RoundedBox(8, rectX, rectY, rectWidth, rectHeight, Color(255, 255, 255, 95))

            local text = Answers["Answer_"..i]
            local textWidth, textHeight = surface.GetTextSize(text)
            local textX = rectX + rectWidth * 0.5 - textWidth * 0.5
            local textY = rectY + rectHeight * 0.5 - textHeight * 0.5

            draw.SimpleText(text, "SCP263_Answers", textX, textY, Color(0, 0, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        end
    end
end

net.Receive(SCP_263_CONFIG.SetQuestions, function()
    ActualQuestion = net.ReadString()
    Answer_1 = net.ReadString()
    Answer_2 = net.ReadString()
    Answer_3 = net.ReadString()
    Answer_4 = net.ReadString()
end)

