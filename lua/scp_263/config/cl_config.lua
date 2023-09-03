SCP_263_CONFIG.ScrW = ScrW()
SCP_263_CONFIG.ScrH = ScrH()

--? Default Value Convar
SCP_263_CONFIG.ClientTimeToBurn = 42
SCP_263_CONFIG.ClientTimeToAnswer = 45
SCP_263_CONFIG.ClientMaximumDelimitationGame = 200

surface.CreateFont( "SCP263_TitleQuestion", {
    font = "Arial",
    size = 70,
} )

surface.CreateFont( "SCP263_TitleQuestionThin", {
    font = "Arial",
    size = 50,
} )

surface.CreateFont( "SCP263_Answers", {
    font = "Roboto Mono",
    size = 25,
} )

hook.Add( "OnScreenSizeChanged", "OnScreenSizeChanged.SCP263_ScreenSize", function( oldWidth, oldHeight )
    SCP_263_CONFIG.ScrW = ScrW()
    SCP_263_CONFIG.ScrH = ScrH()
end )