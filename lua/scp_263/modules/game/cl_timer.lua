local TimerLeft = 0
local font = "DermaLarge"
local textColor = Color(255, 255, 255)
local xPosition = SCP_263_CONFIG.ScrW * 0.5
local yPosition = SCP_263_CONFIG.ScrH * 0.05

function SCP_263.StartTimer(ent)
    TimerLeft = SCP_263_CONFIG.ClientTimeToAnswer
    timer.Create("SCP263_StartTimer_".. ent:EntIndex(), 1, TimerLeft, function()
        TimerLeft = TimerLeft - 1
    end)
end

function SCP_263.StopTimer(ent)
    TimerLeft = 0
    timer.Remove("SCP263_StartTimer_".. ent:EntIndex())
end

function SCP_263.DisplayTimer(ent)
    if (ent:GetIsWaitingAnswer()) then
        draw.SimpleText(tostring(TimerLeft), font, xPosition, yPosition, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    end
end