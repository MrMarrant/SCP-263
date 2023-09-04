local shiftPressed = false
local tabPressed = false

-- TODO : Pas sure que ça soit une bonne idée, des joueurs peuvent avoir set différement leurs touche, ou appuyer dessus par erreur.
--[[
* Check if a player tried to do Shif + TAB
* @Player ply The player to inspect.
* @Entity ent SCP-263
--]]
function SCP_263.IsSteamMenuOpen(ply, ent)
    shiftPressed = (input.IsKeyDown(KEY_LSHIFT) or input.IsKeyDown(KEY_RSHIFT))
    tabPressed = input.IsKeyDown(KEY_TAB)

    if shiftPressed and tabPressed then
        net.Start(SCP_263_CONFIG.HasCheated)
            net.WriteEntity(ent)
        net.SendToServer()
    end
end