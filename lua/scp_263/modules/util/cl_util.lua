-- Fonction pour sauter une ligne dans un texte en fonction de la taille maximum renseigné
-- Elle renvoie le texte sous la forme d'un string avec \n, ou sous la forme d'un tableau avec explode à true.
function SCP_263.WrapText(text, maxWidth, explode)
    local words = string.Explode(" ", text)
    local lines = {""}
    local currentLine = 1
    local currentWidth = 0

    for _, word in ipairs(words) do
        local wordWidth = surface.GetTextSize(word .. " ")

        if currentWidth + wordWidth > maxWidth or wordWidth > SCP_263_CONFIG.ScrW then
            currentLine = currentLine + 1
            currentWidth = wordWidth
            lines[currentLine] = word .. " "
        else
            currentWidth = currentWidth + wordWidth
            lines[currentLine] = lines[currentLine] .. word .. " "
        end
    end

    local finalText = ""

    for i, line in ipairs(lines) do
        finalText = finalText .. line

        if i < #lines then
            finalText = finalText .. "\n"
        end
    end

    if (explode) then
        finalText = string.Explode("\n", finalText)
    end

    return finalText
end

net.Receive(SCP_263_CONFIG.SetConvarClientSide, function ()
    local name = net.ReadString()
    local value = net.ReadUInt(14)
    SCP_263_CONFIG[name] = value
end)