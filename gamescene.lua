local composer = require( "composer" )
 
local gamescene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function gamescene:create( event )
 
    local scene3Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
-- show()
function gamescene:show( event )
 
    local scene3Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        --hides the status bar
        display.setStatusBar(display.HiddenStatusBar)

local background = display.newRect(0, 0, 1080, 1080)
background:setFillColor( 0/255, 100/255, 255/255)
 scene3Group:insert(background)

local AskTextField = display.newText( "Type The Answer In The Text Box Below.", display.contentCenterX + 1 , display.contentCenterY - 200, "Impact", 15)
AskTextField.id = "AskTextField"
AskTextField:setFillColor( 255, 255, 255 )
 scene3Group:insert(AskTextField)


local EntryTextField = native.newTextField( display.contentCenterX + 1, display.contentCenterY - 150, 300, 75 )
EntryTextField.id = "EntryTextField"
 scene3Group:insert(EntryTextField)

     GenerateButton = display.newImageRect( "e1.png", 200, 100 )
        GenerateButton.x = 160
        GenerateButton.y = 200
        scene3Group:insert(GenerateButton)

 
        local SubmitButton = display.newImageRect( "e3.png", 200, 100 )
        SubmitButton.x = 160
        SubmitButton.y = 350
        scene3Group:insert(SubmitButton)


local letterText = display.newText( "Tap Generate", display.contentCenterX + 1 , display.contentCenterY +200, "Impact", 17 )
letterText.id = "letterText"
 scene3Group:insert(letterText)


local AnswerText = display.newText( "", display.contentCenterX + 1 , display.contentCenterY +100, native.systemFont, 12 )
AnswerText.id = "AnswerText"
 scene3Group:insert(AnswerText)

Score = 0
q1 = false
q2 = false
q3 = false
q4 = false
q5 = false
q6 = false
q7 = false 
q8 = false
q9 = false 
q10 = false

local ScoreText = display.newText( "Your Score Is 0", display.contentCenterX + 1 , display.contentCenterY + 40, "Impact", 35 )
ScoreText.id = "ScoreText"

local function GenerateButtonTouch( event )

    if event.phase == "began" then

    x = true

        while x==true do

        letter = math.random(1,10)
      

            if letter == 1 and q1 == true then
                x = true

            elseif letter == 1 and q1 == false then
                letterText.text = "What Year is It"
                x = false

            elseif letter == 2 and q2 == true then
                x = true

            elseif letter == 2  and q2 == false then
                letterText.text = "What Year Did WW2 Start"
                x = false
            
            elseif letter == 3 and q3 == true then
                x = true
                
            elseif letter == 3  and q3 == false then
                letterText.text = "What Year Did WW2 End"
                x = false
            
            elseif letter == 4 and q4 == true then
                x = true
             
            elseif letter == 4  and q4 == false then
                letterText.text = "What Year Did WW1 Start"
                x = false
            
            elseif letter == 5 and q5 == true then
                x = true
                
            elseif letter == 5  and q5 == false then
                letterText.text = "What Year Did WW1 End"
                x = false
            elseif letter == 6 and q6 == true then
                x = true
                
            elseif letter == 6  and q6 == false then
                letterText.text = "What Year Did Canada Become A Country"
                x = false
            elseif letter == 7 and q7 == true then
                x = true
                
            elseif letter == 7  and q7 == false then
                letterText.text = "What Year Did The Russian Civil War Start"
                x = false
            elseif letter == 8 and q8 == true then
                x = true
               
            elseif letter == 8  and q8 == false then
                letterText.text = "What Year Was France Invaded In WW2"
                x = false
            elseif letter == 9 and q9 == true then
                x = true
                
            elseif letter == 9  and q9 == false then
                letterText.text = "What Year Was D-Day"
                x = false
            
            elseif letter == 10 and q10 == true then
                x = true
                
            elseif letter == 10  and q10 == false then
                letterText.text = "What Year Was Russia Invaded In WW2"
                x = false

            else x = false
                
            end
     
        end
    
    end
end

GenerateButton:addEventListener( "touch", GenerateButtonTouch )
end


end


local function GameOver()

    GenerateButton:removeSelf()
    GenerateButton = nil
    SubmitButton:removeSelf()
    SubmitButton = nil
     AgeTextField:removeSelf()
    AgeTextField = nil
     AskTextField:removeSelf()
     AskTextField = nil
    letterText.text = "You Got All The Questions Right!"

  
end



local function updateScoreText( )

    if Test == 1 or Test == 2 or Test == 3 or Test == 4 or Test == 5 or Test == 6 or Test == 7 or Test == 8 or Test == 9 or Test == 10 then
        Score = Score + 1
        if Score == 10 then 
            GameOver()
        end
        ScoreText.text = "Your Score Is "..Score

    end
end

local function SubmitButtonTouch( event )

if event.phase == "began" then

Entry = tonumber(EntryTextField.text)

     Test = 0


    
    if letter == 1 and Entry == 2019 then
        letterText.text = "Correct"
        letter = nil
        Test = 1
        q1 = true

    

        elseif letter == 2 and Entry == 1939 then
            letterText.text = "Correct"
            letter = nil
            Test = 2
            q2 = true
            
        

            elseif letter == 3 and Entry == 1945 then
                letterText.text = "Correct"
                letter = nil
                Test = 3
                q3 = true
                
            

                elseif letter == 4 and Entry == 1914 then
                        letterText.text = "Correct"
                        letter = nil
                        Test = 4
                    q4 = true
                     
                
                    elseif letter == 5 and Entry == 1918 then
                        letterText.text = "Correct"
                        letter = nil
                        Test = 5
                        q5 = true
                    

                        elseif letter == 6 and Entry == 1867 then
                            letterText.text = "Correct"
                            letter = nil
                            Test = 6
                            q6 = true
                        

                            elseif letter == 7 and Entry == 1917 then
                                letterText.text = "Correct"
                                letter = nil
                                Test = 7
                                q7 = true
                            

                                elseif letter == 8 and Entry == 1940 then
                                    letterText.text = "Correct"
                                    letter = nil
                                    Test = 8
                                    q8 = true
                                

                                    elseif letter == 9 and Entry == 1944 then
                                        letterText.text = "Correct"
                                        letter = nil
                                        Test = 9
                                        q9 = true
                                    

                                        elseif letter == 10 and Entry  == 1941 then
                                            letterText.text = "Correct"
                                            letter = nil
                                            Test = 10
                                            q10 = true

                                             elseif letter ~= Entry then
                                                letterText.text = "You Got The Answer Wrong, GAME OVER"
                                                ScoreText.text = "You Got A Score Of " .. Score
                                                GenerateButton:removeSelf()
                                                    GenerateButton = nil
                                                    SubmitButton:removeSelf()
                                                    SubmitButton = nil
                                                     AgeTextField:removeSelf()
                                                 AgeTextField = nil
                                                 AskTextField:removeSelf()
                                                 AskTextField = nil
                                        
        end
        updateScoreText()
       SubmitButton:addEventListener( "touch", SubmitButtonTouch )
        
    end
    end



-----------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
gamescene:addEventListener( "create", gamescene )
gamescene:addEventListener( "show", gamescene )
-- -----------------------------------------------------------------------------------
 
return gamescene