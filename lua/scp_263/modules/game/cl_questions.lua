local ActualQuestion = ""
local Answer_A = ""
local Answer_B = ""
local Answer_C = ""
local Answer_D = ""

-- TODO : affiche les questions au joueurs
function SCP_263.DisplayQuestions(ent)
    if (ActualQuestion == "" or not ActualQuestion) then return end
    if (not ent:GetIsOn() or (not ent:GetIsWaitingAnswer() and not ent:GetIsIntroducingQuestion())) then return end

    local ply = LocalPlayer()
    if (ply:GetPos():Distance(ent:GetPos()) > SCP_263_CONFIG.MaximumDelimitationGame) then return end

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
			y = y + 30
		end
    end
    --? On affiche la question et les réponses possible.
    if (ent:GetIsWaitingAnswer()) then
        
    end
end

net.Receive(SCP_263_CONFIG.SetQuestions, function()
    local Question = net.ReadString()
    local A = net.ReadString()
    local B = net.ReadString()
    local C = net.ReadString()
    local D = net.ReadString()

    ActualQuestion = Question
    Answer_A = A
    Answer_B = B
    Answer_C = C
    Answer_D = D
end)

