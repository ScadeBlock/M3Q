local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("M3Q 1.0.2 - BETA [DATCANFLY]", "Ocean")
local MAXFPS = 30 
local FREEZEFPS = 1 
setfpscap(MAXFPS)
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")
MainSection:NewToggle("Dynamic Memory", "Reduce fps when the mainscreen is unactive", function(state)
    if state then
        local uis = game:GetService("UserInputService")
        setfpscap(MAXFPS)
        connectru = uis.WindowFocused:Connect(function() 
            setfpscap(MAXFPS)
        end)
        conntecturnu = uis.WindowFocusReleased:Connect(function() 
            setfpscap(FREEZEFPS)
        end)
    else
        setfpscap(MAXFPS)
        connectru:Disconnect()
        connectru= nil
        conntecturnu:Disconnect()
        conntecturnu = nil
    end
end)
local Player = Window:NewTab("Config")
local PlayerSection = Player:NewSection("Config")
PlayerSection:NewSlider("Max FPS", "ANY", 600, 15, function(s)
    MAXFPS = s
    setfpscap(MAXFPS)
end)
PlayerSection:NewSlider("FREEZE FPS", "FPS when your screen is freezing", 50, 1, function(s)
    FREEZEFPS = s
end)
local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")
OtherSection:NewToggle("Super-Human", "go fast and jump high", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)
OtherSection:NewSlider("Walkspeed", "SPEED!!", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
OtherSection:NewSlider("Jumppower", "JUMP HIGH!!", 350, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
OtherSection:NewButton("Reset WS/JP", "Resets to all defaults", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
