loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

       local HttpService = game:GetService("HttpService")

local VALID_KEYS = {"Premium-Van-Nguyen-J64-K97"}
local KEY_VALIDITY_DAYS = 5
local DATA_FILE = "key_data.json"

local function LoadKeyData()
    if isfile and isfile(DATA_FILE) then
        local data = readfile(DATA_FILE)
        return HttpService:JSONDecode(data)
    end
    return nil
end

local function SaveKeyData(key)
    local data = {
        Key = key,
        Time = os.time()
    }
    if writefile then
        writefile(DATA_FILE, HttpService:JSONEncode(data))
    end
end

local function IsKeyStillValid(savedData)
    if not savedData or not savedData.Time then
        return false
    end
    local diff = os.difftime(os.time(), savedData.Time)
    return diff <= (KEY_VALIDITY_DAYS * 24 * 60 * 60)
end

local keyData = LoadKeyData()
local hasValidKey = false

if keyData and IsKeyStillValid(keyData) then
    for _, validKey in pairs(VALID_KEYS) do
        if keyData.Key == validKey then
            hasValidKey = true
            break
        end
    end
end

if not hasValidKey then
    print("Nhập key của bạn:")
    local userInput = io.read()
    local isCorrect = false
    for _, validKey in pairs(VALID_KEYS) do
        if userInput == validKey then
            isCorrect = true
            break
        end
    end
    if isCorrect then
        print("Key hợp lệ ✅")
        SaveKeyData(userInput)
    else
        print("Key không đúng ❌")
    end
else
    print("Key vẫn còn hạn ✅")
end

       local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AvatarUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

local avatarFrame = Instance.new("Frame")
avatarFrame.Size = UDim2.new(0, 300, 0, 350)
avatarFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
avatarFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
avatarFrame.BorderSizePixel = 0
avatarFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = avatarFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 1.2
stroke.Parent = avatarFrame

local viewport = Instance.new("ViewportFrame")
viewport.Size = UDim2.new(1, 0, 1, -60)
viewport.Position = UDim2.new(0, 0, 0, 0)
viewport.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
viewport.BorderSizePixel = 0
viewport.Parent = avatarFrame

local clonedChar = character:Clone()
for _, part in ipairs(clonedChar:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Anchored = true
	end
end
clonedChar.Parent = viewport

local camera = Instance.new("Camera")
camera.CFrame = CFrame.new(Vector3.new(0, 3, 8), Vector3.new(0, 3, 0))
viewport.CurrentCamera = camera

local minimizeBtn = Instance.new("ImageButton")
minimizeBtn.Image = "rbxassetid://91347148253026"
minimizeBtn.Size = UDim2.new(0, 50, 0, 50)
minimizeBtn.Position = UDim2.new(0.5, -25, 1, -55)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Parent = avatarFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(1, 0)
btnCorner.Parent = minimizeBtn

local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	if isMinimized then
		TweenService:Create(avatarFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
			Size = UDim2.new(0, 300, 0, 350),
			BackgroundTransparency = 0
		}):Play()
	else
		TweenService:Create(avatarFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
			Size = UDim2.new(0, 80, 0, 80),
			BackgroundTransparency = 0.7
		}):Play()
	end
	isMinimized = not isMinimized
end)
      
------ Tab
     local Tab1o = MakeTab({Name = "Script Farm"})
     local Tab2o = MakeTab({Name = "Server Hop"})
     local Tab3o = MakeTab({Name = "Hop Server Blox Fruit""})
     local Tab4o = MakeTab({Name = "Kill Aura"})
     local Tab5o = MakeTab({Name = "Script Blox Fruit"})
     local Tab6o = MakeTab({Name = "Script Dead Rails"})
     local Tab7o = MakeTab({Name = "Script 99 Night In The Forest"})
     local Tab8o = MakeTab({Name = "Script Blade Ball"})
     local Tab9o = MakeTab({Name = "Script Steal A Brainrot"})
     local Tab10o = MakeTab({Name = "Script Grow A Garden"})
     
------- BUTTON
    
    AddButton(Tab1o, {
     Name = "Redz Hub",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))(Settings)
  end
  })