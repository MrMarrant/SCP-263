SCP_263_CONFIG.ScrW = ScrW()
SCP_263_CONFIG.ScrH = ScrH()

hook.Add( "OnScreenSizeChanged", "OnScreenSizeChanged.SCP263_ScreenSize", function( oldWidth, oldHeight )
    SCP_263_CONFIG.ScrW = ScrW()
    SCP_263_CONFIG.ScrH = ScrH()
end )