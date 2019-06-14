local composer = require( "composer" )
 
local mainmenu = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function mainmenu:create( event )
 
    local scene2Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function mainmenu:show( event )
 
    local scene2Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --hides the status bar
        display.setStatusBar(display.HiddenStatusBar)
        --background
        local background = display.newRect(0, 0, 1080, 1080)
        background:setFillColor( 40/255, 0/255, 0/255)
        scene2Group:insert(background)
        --image
        --text
        local text = display.newText( "QUIZMASTER" , 160, 70, "Impact", 35 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text)
        --enterbutton
        local enterButton = display.newImageRect( "Enter.png", 200, 120 )
        enterButton.x = 160
        enterButton.y = 420
        scene2Group:insert(enterButton)

        --go to scene function
        function GoToGame (event)
            composer.gotoScene( "gamescene" )
            enterButton:removeSelf()
     enterButton = nil
        end

        enterButton:addEventListener( "touch", GoToGame )


    elseif ( phase == "did" ) then


    end
end

 
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
mainmenu:addEventListener( "create", mainmenu )
mainmenu:addEventListener( "show", mainmenu )
-- -----------------------------------------------------------------------------------
 
return mainmenu