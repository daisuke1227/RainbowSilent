getgenv().Silent = {
    Settings = {
        Enabled = true,
        AimPart = "UpperTorso",
        Prediction = 0.152848,
        WallCheck = true,
        Visualize = true,
        AutoPrediction = true,
        Type = "Math", -- Normal, Custom, Math
        ping20_30 = 0.12588,
        ping30_40 = 0.11911,
        ping40_50 = 0.12471,
        ping50_60 = 0.13766,
        ping60_70 = 0.13731,
        ping70_80 = 0.13951,
        ping80_90 = 0.14181,
        ping90_100 = 0.148,
        ping100_110 = 0.156,
        ping110_120 = 0.1567,
        ping120_130 = 0.1601,
        ping130_140 = 0.1637,
        ping140_150 = 0.173,
        ping150_160 = 0.1714,
        ping160_170 = 0.1863,
        ping170_180 = 0.1872,
        ping180_190 = 0.1848,
        ping190_200 = 0.1865,
    },
    FOV = {
        Enabled = true,
        Size = 27,
        Filled = false,
        Thickness = 0.66,
        Transparency = 0.9,
        Color = Color3.fromRGB(255, 0, 0), -- Red color
    },
}

local rainbow = {
    Color3.fromRGB(255, 0, 0), -- Red
    Color3.fromRGB(255, 165, 0), -- Orange
    Color3.fromRGB(255, 255, 0), -- Yellow
    Color3.fromRGB(0, 255, 0), -- Green
    Color3.fromRGB(0, 127, 255), -- Blue
    Color3.fromRGB(75, 0, 130), -- Indigo
    Color3.fromRGB(148, 0, 211) -- Violet
}

local currentIndex = 1
local nextIndex = 2
local transitionDuration = 2 -- Duration for color transition in seconds
local transitionStartTime = tick()

game:GetService("RunService").RenderStepped:Connect(function()
    local elapsedTime = tick() - transitionStartTime
    local progress = math.min(1, elapsedTime / transitionDuration)
    local lerpedColor = rainbow[currentIndex]:Lerp(rainbow[nextIndex], progress)
    
    getgenv().Silent.FOV.Color = lerpedColor
    
    if elapsedTime >= transitionDuration then
        currentIndex = nextIndex
        nextIndex = (nextIndex % #rainbow) + 1
        transitionStartTime = tick()
    end
end)

loadstring(game:HttpGet("https://rentry.co/vsbyon63/raw", true))()
