SCP_263_CONFIG.ScrW = ScrW()
SCP_263_CONFIG.ScrH = ScrH()

surface.CreateFont( "SCP263_TitleQuestion", {
    font = "Arial",
    size = 70,
} )

surface.CreateFont( "SCP263_Answers", {
    font = "Arial",
    size = 20,
} )

hook.Add( "OnScreenSizeChanged", "OnScreenSizeChanged.SCP263_ScreenSize", function( oldWidth, oldHeight )
    SCP_263_CONFIG.ScrW = ScrW()
    SCP_263_CONFIG.ScrH = ScrH()
end )