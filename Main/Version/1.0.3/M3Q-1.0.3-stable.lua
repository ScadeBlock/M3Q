local Namecall
Namecall = hookmetamethod(game, '__namecall', function(self, ...)
   local Caller = tostring(getcallingscript())
   local Method = getnamecallmethod()
   
   if Caller == 'ClientMover' and Method == 'GetService' then
       return
   end
   
   return Namecall(self, ...)
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("M3Q 1.0.3 - STABLE [DATCANFLY]", "Ocean")
local MAXFPS = 30 
local FREEZEFPS = 1
setfpscap(MAXFPS)
_G.Stop = false
-- Freeze2 Function
local function FOV()
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("CameraPositioner") then 
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("CameraPositioner"):Destroy()
    end
    local part = Instance.new("Part")
    part.Name = "CameraPositioner"
    part.Anchored = true 
    part.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    part.CanCollide = false
    game:GetService("RunService").RenderStepped:Connect(function()
        part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(1,-100000000,-100)
    end)

    local camera = workspace.CurrentCamera
    camera.CameraSubject = part
    for _,v in pairs(workspace:GetDescendants()) do 
    if v:IsA("ParticleEmitter") then 
        v:Destroy()
    end 
    if v:IsA("Decal") then v:Destroy() end 
    if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end  
    end 
    if _G.Stop then 
        camera.CameraSubject=game.Players.LocalPlayer.Character.Humanoid
    end 
end 
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")
MainSection:NewToggle("Fps Reducer", "Reduce fps when the mainscreen is unactive", function(state)
    if state then
        local uis = game:GetService("UserInputService")
        setfpscap(MAXFPS)
        -- FREEZE FUNC
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
MainSection:NewToggle("Lazy Render [BETA]", "Remove Render of screen when it's unactive (Can caused some grapic problems)", function(state)
    if state then
        local uis = game:GetService("UserInputService")
        setfpscap(MAXFPS)
        -- FREEZE FUNC
        screenru = uis.WindowFocused:Connect(function() 
            _G.Stop = true
            FOV()
        end)
        screenurnu = uis.WindowFocusReleased:Connect(function() 
            _G.Stop = false
            FOV()
        end)
    else
        screenru:Disconnect()
        screenru= nil
        screenurnu:Disconnect()
        screenurnu = nil
    end
end)
-- MainSection:NewButton("Anti Exploit Bypass[BETA]", "Remove Local Anti Exploit", function()
--     AntiExploitModule = game.Players.LocalPlayer.Character.AntiExploit
--     for i,v in pairs(getconnections(AntiExploit.Changed)) do
--         v:Disable()
--     end
--     AntiExploit:Remove()
-- end)
-- MainSection:NewButton("Anti Exploit Bypass[BETA]", "Remove Local Anti Exploit", function()
--     for i,v in pairs(getconnections(AntiExploit.Changed)) do
--         v:Disable()
--     end
--     AntiExploit:Remove()
-- end)
local Player = Window:NewTab("Config")
local PlayerSection = Player:NewSection("Config")
PlayerSection:NewTextBox("Max FPS", "Use it as a FPS Unlocker", function(txt)
    MAXFPS = tonumber(txt)
    setfpscap(MAXFPS)
end)
PlayerSection:NewTextBox("FREEZE FPS", "FPS when your screen is freezing", function(txt)
    FREEZEFPS = tonumber(txt)
end)

local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")
local UIS = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()


function GetCharacter()
   return game.Players.LocalPlayer.Character
end

function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end

OtherSection:NewToggle("Click-TP", "TP on click", function(state)
    if state then
        renpas = UIS.InputBegan:Connect(function(input)
           if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
               Teleport(Mouse.Hit.p)
           end
        end)
    else
        renpas:Disconnect()
        renpas= nil
    end
end)
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
local Build= Window:NewTab("Version")
local BuildSection = Build:NewSection("Version")
BuildSection:NewLabel("Version 1.0.3 [stable]")
BuildSection:NewLabel("Release Date : March 5 2023 - 03.05.2023")
BuildSection:NewLabel("Owner : ScadeBlock[DATCANFLY]")