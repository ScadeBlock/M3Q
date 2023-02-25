print("M3Q Version 1.0.0 (Release Date: 02.25.23) by DatCanFly")
local uis = game:GetService("UserInputService")
local MAXFPS = 30 -- MAX FPS WHEN SCREEN IS ACTIVE (30 IS DEFAULT)
local FREEZEFPS = 1 -- FPS WHEN SCREEN IS UNACTIVE - MINIMIZE (UNDER 10 FPS IS HIGHLY RECOMMEND)
-- NOTE : 1 IS THE BEST BUT I WILL TAKE 1 - 3 SECONDS TO REACTIVE
setfpscap(MAXFPS)
uis.WindowFocused:Connect(function() 
    setfpscap(MAXFPS)
end)

uis.WindowFocusReleased:Connect(function() 
    setfpscap(FREEZEFPS)
end)

-- Add new code HERE
