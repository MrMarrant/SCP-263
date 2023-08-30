local ActualQuestion = ""
local Answer_A = ""
local Answer_B = ""
local Answer_C = ""
local Answer_D = ""

local displayStartTime = 0
local displayDuration = 5

-- TODO : affiche les questions au joueurs
function SCP_263.DisplayQuestions(ply)
    if (ActualQuestion == "" or not ActualQuestion) then return end

    cam.Start2D()
    --? On affiche la question en grand au milieu de l'écran du joueur.
    if (self:GetIsIntroducingQuestion()) then
        local elapsedTime = CurTime() - displayStartTime
        local alpha = 255 - math.Clamp(elapsedTime / displayDuration * 255, 0, 255)
        
        surface.SetFont("DermaLarge")
        local WrapQuestion = SCP_263.WrapText(ActualQuestion, SCPArena_CONFIG.ScrW * 0.5, true)
		local y = 0

		for key, value in pairs(WrapQuestion) do
			local textWidth, textHeight = surface.GetTextSize(value)

			surface.SetTextColor(Color(255, 255, 255, alpha))
			surface.SetTextPos(SCPArena_CONFIG.ScrW * 0.5 - textWidth, SCPArena_CONFIG.ScrH * 0.3 + y)
			surface.DrawText(value)
			y = y + 30
		end
    end
    --? On affiche la question et les réponses possible.
    if (self:GetIsWaitingAnswer()) then
        
    end
    cam.End2D()
end

net.Receive(SCP_263_CONFIG.SetQuestions, function()
    local Question = net.ReadString()
    local A = net.ReadString()
    local B = net.ReadString()
    local C = net.ReadString()
    local D = net.ReadString()

    local duration = net.ReadUInt(5)

    displayStartTime = CurTime()
    displayDuration = duration

    ActualQuestion = Question
    Answer_A = A
    Answer_B = B
    Answer_C = C
    Answer_D = D
end)

