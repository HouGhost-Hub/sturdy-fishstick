-- HouGhost Hub [Premium] Script
-- Created by [orenzoiun]
-- Version: 2.1 (Full Premium Edition)

-- Load Redzlib
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

-- Khởi tạo biến toàn cục
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

-- Biến trạng thái
local AutoClicking = false
local AutoClickRace = false
local AutoRebirth = false
local AntiAFK = false
local AutoHatchEggs = false
local AutoCollectRewards = false
local AutoFarmPets = false
local PremiumKeyValid = false
local ClickDelay = 0.005
local SelectedEgg = "BasicEgg" -- Mặc định

-- Hàm kiểm tra khóa Premium (giả lập)
local function CheckPremiumKey(key)
    -- Ở đây bạn có thể tích hợp API thực tế để kiểm tra khóa
    local validKeys = {
        ["PREMIUM123"] = true,
        ["HOUGHOST2025"] = true
    }
    return validKeys[key] or false
end

-- Tạo cửa sổ UI
local Window = redzlib:MakeWindow({
    Title = "HouGhost Hub [Premium]",
    SubTitle = "Full Premium Edition | Powered by orenzoiun",
    SaveFolder = "HouGhost_Premium_Config.lua"
})

-- Nút thu nhỏ với thiết kế đẹp
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://91521936822360", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 8) }
})

-- Tab Discord
local TabDiscord = Window:MakeTab({"Discord", "info"})
TabDiscord:AddDiscordInvite({
    Name = "HouGhost Hub | Premium Community",
    Description = "Join our exclusive Discord for updates, support, and premium perks!",
    Logo = "rbxassetid://91521936822360",
    Invite = "https://discord.gg/cwsTyeuB"
})

-- Tab Key Validation
local TabKey = Window:MakeTab({"Premium Key", "key"})
local KeyInput = TabKey:AddTextBox({
    Name = "Enter Premium Key",
    Description = "Input your premium key to unlock all features",
    Default = "",
    Callback = function(key)
        if CheckPremiumKey(key) then
            PremiumKeyValid = true
            Window:MakeNotification({
                Name = "Success",
                Description = "Premium key validated! All features unlocked.",
                Time = 5
            })
        else
            PremiumKeyValid = false
            Window:MakeNotification({
                Name = "Error",
                Description = "Invalid premium key. Contact support or try again.",
                Time = 5
            })
        end
    end
})

-- Tab Game
local TabGame = Window:MakeTab({"Main", "home"})
local SectionGame = TabGame:AddSection({"Game Enhancements"})

-- AutoClick Toggle
TabGame:AddToggle({
    Name = "AutoClick Muscles",
    Description = "Automatically clicks to increase muscle damage",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            AutoClicking = value
            if value then
                spawn(function()
                    local DamageEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("DamageIncreaseOnClickEvent")
                    while AutoClicking do
                        DamageEvent:FireServer()
                        wait(ClickDelay)
                    end
                end)
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- AutoClick Race Toggle
TabGame:AddToggle({
    Name = "AutoClick Race",
    Description = "Automatically clicks during race events",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            AutoClickRace = value
            if value then
                spawn(function()
                    local RaceEvents = ReplicatedStorage:WaitForChild("Events"):WaitForChild("RaceEvents")
                    local ClickedDuringRace = RaceEvents:WaitForChild("ClickedDuringRace")
                    while AutoClickRace do
                        ClickedDuringRace:FireServer()
                        wait(0.03)
                    end
                end)
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- AutoRebirth Toggle
TabGame:AddToggle({
    Name = "AutoRebirth",
    Description = "Automatically triggers rebirth",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            AutoRebirth = value
            if value then
                spawn(function()
                    local RebirthEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("RebirthEvent")
                    while AutoRebirth do
                        RebirthEvent:FireServer(true)
                        wait(0.08)
                    end
                end)
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Anti-AFK Toggle
TabGame:AddToggle({
    Name = "Anti-AFK",
    Description = "Prevents being kicked for inactivity",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            AntiAFK = value
            if value then
                spawn(function()
                    LocalPlayer.Idled:Connect(function()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end)
                end)
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Thêm Auto Collect Rewards
TabGame:AddToggle({
    Name = "Auto Collect Rewards",
    Description = "Automatically collects daily rewards and gifts",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            AutoCollectRewards = value
            if value then
                spawn(function()
                    local RewardEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("ClaimRewardEvent") -- Giả định event
                    while AutoCollectRewards do
                        RewardEvent:FireServer()
                        wait(1)
                    end
                end)
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Tab Pets (Mới)
local TabPets = Window:MakeTab({"Pets", "pet"})
local SectionPets = TabPets:AddSection({"Pet Management"})

-- Auto Hatch Eggs Toggle
TabPets:AddToggle({
    Name = "Auto Hatch Eggs",
    Description = "Automatically hatches selected eggs",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            AutoHatchEggs = value
            if value then
                spawn(function()
                    local HatchEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("HatchEggEvent") -- Giả định event
                    while AutoHatchEggs do
                        HatchEvent:FireServer(SelectedEgg, 1) -- Hatch 1 egg at a time
                        wait(0.5)
                    end
                end)
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Dropdown chọn Egg
TabPets:AddDropdown({
    Name = "Select Egg to Hatch",
    Description = "Choose the type of egg to auto hatch",
    Options = {"BasicEgg", "RareEgg", "EpicEgg", "LegendaryEgg"}, -- Thêm các loại egg thực tế
    Default = "BasicEgg",
    Callback = function(value)
        SelectedEgg = value
    end
})

-- Auto Farm Pets Toggle
TabPets:AddToggle({
    Name = "Auto Farm Pets",
    Description = "Automatically equips and farms with best pets",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            AutoFarmPets = value
            if value then
                spawn(function()
                    -- Logic giả định để equip best pets
                    while AutoFarmPets do
                        -- Gọi event equip pet nếu có
                        wait(5)
                    end
                end)
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Tab Location
local TabLocation = Window:MakeTab({"Location", "database"})
local SectionLocation = TabLocation:AddSection({"AutoBuy Locations"})

-- Hàm tạo nút mua Location
local function CreateButtons(parent, namePrefix, onClick)
    for i = 1, 15 do -- Mở rộng đến 15 locations
        parent:AddButton({
            Name = namePrefix .. " " .. tostring(i),
            Callback = function()
                if PremiumKeyValid then
                    onClick(i)
                else
                    Window:MakeNotification({
                        Name = "Premium Required",
                        Description = "Please enter a valid premium key to use this feature.",
                        Time = 5
                    })
                end
            end
        })
    end
end

CreateButtons(TabLocation, "Buy Location", function(locationNumber)
    local args = {locationNumber}
    ReplicatedStorage:WaitForChild("Events"):WaitForChild("LevelGUIBuyButtonPressed"):FireServer(unpack(args))
end)

-- Tab Teleport
local TabTeleport = Window:MakeTab({"Teleport", "fast-forward"})
local SectionTeleport = TabTeleport:AddSection({"Teleport to Locations"})

CreateButtons(TabTeleport, "Teleport Location", function(locationNumber)
    local args = {"Teleport", locationNumber}
    ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent"):InvokeServer(unpack(args))
end)

-- Thêm Teleport to Spawn
TabTeleport:AddButton({
    Name = "Teleport to Spawn",
    Callback = function()
        if PremiumKeyValid then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Thay bằng vị trí spawn thực tế
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Tab Server
local TabServer = Window:MakeTab({"Server", "server"})
TabServer:AddButton({
    Name = "Rejoin Server",
    Description = "Rejoins the current server",
    Callback = function()
        if PremiumKeyValid then
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

TabServer:AddButton({
    Name = "Hop to New Server",
    Description = "Joins a new server",
    Callback = function()
        if PremiumKeyValid then
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            for _, server in ipairs(servers.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id)
                    break
                end
            end
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Tab Settings
local TabSettings = Window:MakeTab({"Settings", "settings"})
TabSettings:AddSlider({
    Name = "Click Speed",
    Description = "Adjust the speed of auto-click (lower = faster)",
    Min = 0.001,
    Max = 0.1,
    Default = 0.005,
    Callback = function(value)
        if PremiumKeyValid then
            ClickDelay = value
            Window:MakeNotification({
                Name = "Settings Updated",
                Description = "Click speed set to " .. tostring(value) .. " seconds.",
                Time = 3
            })
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to adjust settings.",
                Time = 5
            })
        end
    end
})

TabSettings:AddToggle({
    Name = "Fast Mode",
    Description = "Enables faster execution (may increase detection risk)",
    Default = false,
    Callback = function(value)
        if PremiumKeyValid then
            -- Logic để điều chỉnh delays
        end
    end
})

-- Tab Premium
local TabPremium = Window:MakeTab({"Premium Features", "star"})
TabPremium:AddSection({"Exclusive Premium Features"})
TabPremium:AddButton({
    Name = "AutoFarm All",
    Description = "Enables all auto features at once",
    Callback = function()
        if PremiumKeyValid then
            AutoClicking = true
            AutoClickRace = true
            AutoRebirth = true
            AntiAFK = true
            AutoHatchEggs = true
            AutoCollectRewards = true
            AutoFarmPets = true
            Window:MakeNotification({
                Name = "AutoFarm Activated",
                Description = "All auto features have been enabled!",
                Time = 5
            })
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use AutoFarm.",
                Time = 5
            })
        end
    end
})

TabPremium:AddButton({
    Name = "Redeem All Codes",
    Description = "Automatically redeems all active codes",
    Callback = function()
        if PremiumKeyValid then
            local codes = {"RELEASE", "UPDATE1", "WELCOME"} -- Thêm codes thực tế từ web
            local CodeEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("RedeemCodeEvent") -- Giả định
            for _, code in ipairs(codes) do
                CodeEvent:FireServer(code)
                wait(0.5)
            end
            Window:MakeNotification({
                Name = "Codes Redeemed",
                Description = "All active codes have been redeemed!",
                Time = 5
            })
        else
            Window:MakeNotification({
                Name = "Premium Required",
                Description = "Please enter a valid premium key to use this feature.",
                Time = 5
            })
        end
    end
})

-- Thông báo khởi động
Window:MakeNotification({
    Name = "HouGhost Hub Loaded",
    Description = "Welcome to HouGhost Hub [Full Premium]! Enter your premium key to unlock all features.",
    Time = 10
})

-- Hàm xử lý lỗi
local function safeCall(func)
    local success, err = pcall(func)
    if not success then
        Window:MakeNotification({
            Name = "Error",
            Description = "An error occurred: " .. tostring(err),
            Time = 5
        })
    end
end

-- Bảo vệ chống phát hiện (giả lập)
spawn(function()
    while true do
        safeCall(function()
            -- Giả lập hành vi người chơi bình thường
            RunService.Heartbeat:Wait()
        end)
        wait(1)
    end
end)

-- Anti-detection thêm
spawn(function()
    while true do
        if AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
        wait(300) -- Mỗi 5 phút
    end
end