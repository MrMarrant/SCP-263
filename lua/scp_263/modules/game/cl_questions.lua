-- SCP-263, A representation of a paranormal object on a fictional series on the game Garry's Mod.
-- Copyright (C) 2023  MrMarrant aka BIBI.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

local ActualQuestion = ""
local Answers = {
    Answer_1 = "",
    Answer_2 = "",
    Answer_3 = "",
    Answer_4 = "",
}
local borderColor = Color(255, 0, 0)
local borderThickness = 2

function SCP_263.DisplayQuestions(ent)
    local ply = LocalPlayer()

    if (not ent:GetIsOn() or ply:GetPos():Distance(ent:GetPos()) > SCP_263_CONFIG.ClientMaximumDelimitationGame) then return end

    --? On affiche une bordure rouge autour de l'écran du joueur candidat du jeu.
    if (ply == ent:GetCurrentPlayer()) then
        -- Dessiner le contour supérieur
        surface.SetDrawColor(borderColor)
        surface.DrawRect(0, 0, SCP_263_CONFIG.ScrW, borderThickness)

        -- Dessiner le contour inférieur
        surface.DrawRect(0, SCP_263_CONFIG.ScrH - borderThickness, SCP_263_CONFIG.ScrW, borderThickness)

        -- Dessiner le contour gauche
        surface.DrawRect(0, 0, borderThickness, SCP_263_CONFIG.ScrH)

        -- Dessiner le contour droit
        surface.DrawRect(SCP_263_CONFIG.ScrW - borderThickness, 0, borderThickness, SCP_263_CONFIG.ScrH)
    end

    if ((not ent:GetIsWaitingAnswer() and not ent:GetIsIntroducingQuestion()) or ActualQuestion == "" or not ActualQuestion  or ent:GetIsEndingGame()) then return end

    --? On affiche la question en grand au milieu de l'écran du joueur.
    if (ent:GetIsIntroducingQuestion()) then
        local WrapQuestion = SCP_263.WrapText(ActualQuestion, SCP_263_CONFIG.ScrW * 0.5, true)
		local y = 0

		for key, value in pairs(WrapQuestion) do
            draw.SimpleText(value, "SCP263_TitleQuestion", SCP_263_CONFIG.ScrW * 0.5, SCP_263_CONFIG.ScrH * 0.4 + y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			y = y + 80
		end
    end
    --? On affiche la question et les réponses possible.
    if (ent:GetIsWaitingAnswer()) then
        local titleWidth, titleHeight = surface.GetTextSize(ActualQuestion)
        local titleX = SCP_263_CONFIG.ScrW * 0.5
        local titleY = SCP_263_CONFIG.ScrH * 0.3
        draw.SimpleText(ActualQuestion, "SCP263_TitleQuestionThin", titleX, titleY, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        -- Rectangles Dimensions
        local rectWidth = SCP_263_CONFIG.ScrW * 0.4
        local rectHeight = SCP_263_CONFIG.ScrH * 0.1
        local rectMargin = SCP_263_CONFIG.ScrW * 0.05
        local rectStartY = SCP_263_CONFIG.ScrH * 0.5

        for i = 1, 4 do
            local rectX = (i % 2 == 1) and rectMargin or (SCP_263_CONFIG.ScrW * 0.5 + rectMargin)
            local rectY = rectStartY + (math.floor((i - 1) / 2) * (rectHeight + rectMargin))

            draw.RoundedBox(8, rectX, rectY, rectWidth, rectHeight, Color(255, 255, 255, 95))

            local text = Answers["Answer_"..i]
            local textWidth, textHeight = surface.GetTextSize(text)
            local textX = rectX + rectWidth * 0.5
            local textY = rectY + rectHeight * 0.5
            local WrapAnswer = SCP_263.WrapText(text, SCP_263_CONFIG.ScrW * 0.3, true)
            if(#WrapAnswer > 3) then textY = textY - 35 end --? Not the best solution for handle this, but , huh, lazy

            for key, value in pairs(WrapAnswer) do
                draw.SimpleText(value, "SCP263_Answers", textX, textY, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                textY = textY + 20
            end
        end
    end
end

net.Receive(SCP_263_CONFIG.SetQuestions, function()
    ActualQuestion = net.ReadString()
    Answers.Answer_1 = net.ReadString()
    Answers.Answer_2 = net.ReadString()
    Answers.Answer_3 = net.ReadString()
    Answers.Answer_4 = net.ReadString()
end)

