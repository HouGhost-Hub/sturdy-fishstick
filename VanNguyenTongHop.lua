local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Intro GUI
local gui = Instance.new("ScreenGui")
gui.Name = "Van Nguyen"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local msg = Instance.new("TextLabel")
msg.Parent = gui
msg.AnchorPoint = Vector2.new(0.5,0.5)
msg.Position = UDim2.new(0.5,0,0.5,0)
msg.Size = UDim2.new(0,600,0,120)
msg.BackgroundTransparency = 1
msg.Text = "🍂 Van Nguyen Hub 🍂"
msg.TextColor3 = Color3.fromRGB(0,255,255)
msg.Font = Enum.Font.GothamBlack
msg.TextScaled = true
msg.TextStrokeTransparency = 0
msg.TextStrokeColor3 = Color3.fromRGB(0,0,0)
msg.TextTransparency = 1

-- Firework function
local function createFirework()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Size = Vector3.new(0.5,0.5,0.5)
    part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10,10),math.random(5,15),math.random(-10,10))
    part.Transparency = 1
    part.Parent = workspace

    local firework = Instance.new("ParticleEmitter")
    firework.Texture = "rbxassetid://243660364"
    firework.Rate = 50
    firework.Lifetime = NumberRange.new(1)
    firework.Speed = NumberRange.new(10)
    firework.SpreadAngle = Vector2.new(360,360)
    firework.Color = ColorSequence.new(Color3.fromRGB(math.random(100,255),math.random(100,255),math.random(100,255)))
    firework.Parent = part

    game.Debris:AddItem(part,2)
end

-- Show text
local appear = TweenService:Create(msg, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency=0})
appear:Play()
appear.Completed:Wait()

-- Loạn màu + firework
local startTime = tick()
while tick()-startTime < 5 do
    msg.TextColor3 = Color3.fromRGB(math.random(0,255),math.random(180,255),math.random(200,255))
    createFirework()
    task.wait(0.25) -- nhanh hơn để loạn màu
end

-- Hide text
local vanish = TweenService:Create(msg, TweenInfo.new(2, Enum.EasingStyle.Sine), {TextTransparency=1})
vanish:Play()
vanish.Completed:Wait()
gui:Destroy()

-- Main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.1,0,0.15,0)
ImageButton.Size = UDim2.new(0,40,0,40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=80196398184635"

local UICorner = Instance.new("UICorner")
UICorner.Parent = ImageButton
UICorner.CornerRadius = UDim.new(1,10)

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.End,false,game)
end)

-- Load Fluent
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat task.wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title="Blox Fruit Hub [ Premium ] By",
    SubTitle="Văn Nguyên",
    TabWidth=157,
    Size=UDim2.fromOffset(450,300),
    Acrylic=true,
    Theme="Darker",
    MinimizeKey=Enum.KeyCode.End
})

local Tabs = {
    Main0=Window:AddTab({Title="Thông Tin"}),
    Main1=Window:AddTab({Title="Script Blox fruit"}),
    Main2=Window:AddTab({Title="Grow A Garden"}),
    Main3=Window:AddTab({Title="99 đêm"}),
    Main4=Window:AddTab({Title="ink game"}),
    Main5=Window:AddTab({Title="Script của Yuta"}),
    Main6=Window:AddTab({Title="Fisch"}),
    Main7=Window:AddTab({Title="Dead Rails"}),
    Main8=Window:AddTab({Title="Blox Fruit - Full Moon"}),
    Main9=Window:AddTab({Title="Blox Fruit - Kaitun"}),
    Main10=Window:AddTab({Title="Blox Fruit - Kaitun Bounty"}),
    Main11=Window:AddTab({Title="Script Premium"}),
}

-- Tab 0
Tabs.Main0:AddButton({Title="Discord",Description="VanNguyen Community",Callback=function() setclipboard("https://discord.gg/DjQCdc8j") end})
Tabs.Main0:AddButton({Title="Youtuber",Description="VanNguyen Community",Callback=function() setclipboard("https://www.youtube.com/@VanNguyen-80") end})
Tabs.Main0:AddButton({Title="Tik Tok",Description="VanNguyen Community",Callback=function() setclipboard("tiktok.com/@vannguyen_173") end})
Tabs.Main0:AddButton({Title="Facebook",Description="VanNguyen Community",Callback=function() setclipboard("https://www.facebook.com/share/16rw4PyFBR/") end})
Tabs.Main0:AddButton({Title="Zalo",Description="VanNguyen Community",Callback=function() setclipboard("https://zalo.me/g/vekjuk480") end})

-- Tab 1
Tabs.Main1:AddButton({Title="Redz Hub",Callback=function()
    local Settings={JoinTeam="Pirates",Translator=true}
    loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
end})

Tabs.Main1:AddButton({Title="w-azure Hub",Callback=function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"))()
end})

Tabs.Main1:AddButton({Title="fix lag",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/Script/main/FixLag.lua"))()
end})

-- Tab 2
Tabs.Main2:AddButton({Title="nat hub",Callback=function()
    loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
end})

-- Tab 5: Nhà tù
Tabs.Main5:AddButton({Title="Nhà tù",Description="Nhà siêu to khổng lồ",Callback=function()
    local Workspace=game:GetService("Workspace")
    local player=game.Players.LocalPlayer
    local char=player.Character or player.CharacterAdded:Wait()
    local hrp=char:WaitForChild("HumanoidRootPart")

    local function createPart(size,pos,color,anchored,parent)
        local p=Instance.new("Part")
        p.Size=size
        p.Position=pos
        p.Anchored=anchored
        p.BrickColor=BrickColor.new(color)
        p.Parent=parent
        return p
    end

    local house=Instance.new("Model")
    house.Name="GiantHouse"
    house.Parent=Workspace

    local hw,hd,hh=50,50,30
    createPart(Vector3.new(hw,1,hd),hrp.Position+Vector3.new(0,-0.5,0),"Earth green",true,house)
    createPart(Vector3.new(1,hh,hd),hrp.Position+Vector3.new(-hw/2,hh/2,0),"Reddish brown",true,house)
    createPart(Vector3.new(1,hh,hd),hrp.Position+Vector3.new(hw/2,hh/2,0),"Reddish brown",true,house)
    createPart(Vector3.new(hw,hh,1),hrp.Position+Vector3.new(0,hh/2,-hd/2),"Reddish brown",true,house)
    createPart(Vector3.new(hw,hh,1),hrp.Position+Vector3.new(0,hh/2,hd/2),"Reddish brown",true,house)
    createPart(Vector3.new(hw+2,1,hd+2),hrp.Position+Vector3.new(0,hh+0.5,0),"Medium stone grey",true,house)
    local door=createPart(Vector3.new(6,10,1),hrp.Position+Vector3.new(0,5,-hd/2),"Brown",true,house)
    door.Transparency=0.5
    door.CanCollide=false
end})

-- Tab 6: Fisch
Tabs.Main6:AddButton({Title="Speed Hub X",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",true))()
end})

Tabs.Main6:AddButton({Title="Solix v2 Loader",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/solixloader/refs/heads/main/solix%20v2%20new%20loader.lua"))()
end})

Tabs.Main6:AddButton({Title="Lunor Loader",Callback=function()
    loadstring(game:HttpGet("https://lunor.dev/loader"))()
end})

Tabs.Main6:AddButton({Title="Luarmor Loader",Callback=function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/672a0ae340e8ce7e21a51e37c6bf0cc1.lua"))()
end})

-- Tab 7: Dead Rails
Tabs.Main7:AddButton({Title="SpeedHubX",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",true))()
end})

Tabs.Main7:AddButton({Title="NatHub",Callback=function()
    loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
end})

Tabs.Main7:AddButton({Title="SolixHub",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/solixloader/refs/heads/main/solix%20v2%20new%20loader.lua"))()
end})

Tabs.Main8:AddButton({Title="Full Moon",Callback=function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "7ba77e93-9ad6-4816-b15a-eddcb1c1dd2a", game.Players.LocalPlayer)
end})

Tabs.Main8:AddButton({Title="Sword Lengend",Callback=function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "cd8e01a2-4c76-4143-b59c-7583ed2681e7", game.Players.LocalPlayer)
end})

Tabs.Main8:AddButton({Title="Boss",Callback=function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "74993948-ffb2-435d-9bd5-c2635479bfcc", game.Players.LocalPlayer)
end})

Tabs.Main8:AddButton({Title="Haki CoLors",Callback=function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "3bfb1abb-55b1-4dbe-a597-6d8f2354aa7e", game.Players.LocalPlayer)
end})

Tabs.Main8:AddButton({Title="Mirage",Callback=function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "385e4e0b-4896-4a15-9419-713cf50e215b", game.Players.LocalPlayer)
end})

Tabs.Main8:AddButton({Title="King Lengend",Callback=function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "05a30735-664b-478b-a7db-01200695f9d9", game.Players.LocalPlayer)
end})

Tabs.Main8:AddButton({Title="Prehistoric",Callback=function()
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "50e5cb14-84c8-4ab8-8f48-98600e55cd01", game.Players.LocalPlayer)
end})

Tabs.Main10:AddButton({Title="Van Nguyen Farm Bounty",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/GsiPeh/refs/heads/main/VANNGUYEN-T%E1%BA%A1o-Scripts.lua"))()
end})

Tabs.Main7:AddButton({Title="Van Nguyen",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/sturdy-fishstick/refs/heads/main/VanNguyenMobile.lua"))()
end})

Tabs.Main9:AddButton({Title="Van Nguyen Kaitun",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/vannguyenkaitun/refs/heads/main/vannguyenkaitun.lua"))()
end})

Tabs.Main11:AddButton({Title="Maru Hub Premium",Callback=function()
    getgenv().Key = "MARU-WN6LS-OPOW-B2MX-778PW-0US1J"
getgenv().id = "1377267119451934830"
getgenv().BetaTestRelease = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
end})

Tabs.Main11:AddButton({Title="Banana Cat Hub Premium",Callback=function()
    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
getgenv().Key = "887b508e0464a08e0ea0fb14" 
getgenv().NewUI = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
end})

Tabs.Main11:AddButton({Title="Kaitun Banana Hub",Callback=function()
    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "887b508e0464a08e0ea0fb14"
    getgenv().SettingFarm ={
        ["Hide UI"] = false,
        ["Reset Teleport"] = {
            ["Enabled"] = false,
            ["Delay Reset"] = 3,
            ["Item Dont Reset"] = {
                ["Fruit"] = {
                    ["Enabled"] = true,
                    ["All Fruit"] = true, 
                    ["Select Fruit"] = {
                        ["Enabled"] = false,
                        ["Fruit"] = {},
                    },
                },
            },
        },
        ["White Screen"] = false,
        ["Lock Fps"] = {
            ["Enabled"] = false,
            ["FPS"] = 20,
        },
        ["Get Items"] = {
            ["Saber"] = true,
            ["Godhuman"] =  true,
            ["Skull Guitar"] = true,
            ["Mirror Fractal"] = true,
            ["Cursed Dual Katana"] = true,
            ["Upgrade Race V2-V3"] = true,
            ["Auto Pull Lever"] = true,
            ["Shark Anchor"] = true, --- if have cdk,sg,godhuman
        },
        ["Get Rare Items"] = {
            ["Rengoku"] = false,
            ["Dragon Trident"] = false, 
            ["Pole (1st Form)"] = false,
            ["Gravity Blade"]  = false,
        },
        ["Farm Fragments"] = {
            ["Enabled"]  = false,
            ["Fragment"] = 50000,
        },
        ["Auto Chat"] = {
            ["Enabled"] = false,
            ["Text"] = "",
        },
        ["Auto Summon Rip Indra"] = true, --- auto buy haki and craft haki legendary 
        ["Select Hop"] = { -- 70% will have it
            ["Hop Server If Have Player Near"] = false, 
            ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = true, 
            ["Hop Find Dough King Get Mirror Fractal"] = false,
            ["Hop Find Raids Castle [CDK]"] = true,
            ["Hop Find Cake Queen [CDK]"] = true,
            ["Hop Find Soul Reaper [CDK]"] = true,
            ["Hop Find Darkbeard [SG]"] = true,
            ["Hop Find Mirage [ Pull Lever ]"] = false,
        },
        ["Farm Mastery"] = {
            ["Melee"] = false,
            ["Sword"] = false,
        },
        ["Buy Haki"] = {
            ["Enhancement"] = false,
            ["Skyjump"] = true,
            ["Flash Step"] = true,
            ["Observation"] = true,
        },
        ["Sniper Fruit Shop"] = {
            ["Enabled"] = true, -- Auto Buy Fruit in Shop Mirage and Normal
            ["Fruit"] = {"Leopard-Leopard","Kitsune-Kitsune","Dragon-Dragon","Yeti-Yeti","Gas-Gas"},
        },
        ["Lock Fruit"] = {},
        ["Webhook"] = {
            ["Enabled"] = false,
            ["WebhookUrl"] = "",
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()
end})

Tabs.Main10:AddButton({Title="Banana Farm Bounty",Callback=function()
    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Key = "887b508e0464a08e0ea0fb14"
    getgenv().Setting = {
        ["Team"] = "Pirate",
        ["Method Click"] = {["Click Gun"] = false ,["Click Melee"] = true,["Click Sword"] = false,["Click Fruit"] = false, ["LowHealth"] = 5000, ["Delay Click"] = 0.3},
        ["Race V4"] = {["Enable"] = true},
        ["Webhook"] = {["Enabled"] = false,["Url Webhook"] = ""},
        ["Misc"] = {["AutoBuyRandomandStoreFruit"] = true,["AutoBuySurprise"] = true},
        ["SafeZone"] = {["Enable"] = true,["LowHealth"] = 4500,["MaxHealth"] = 8000,["Teleport Y"] = 2000},
        ["Method Use Skill"] = {["Use Random"] = true,["Use Number"] = false},
        ["Use random skill if player target low health"] = { --- suport only method use skill Number
            ["Enabled"] = true,
            ["Low Health"] = 4000,
        },
        ["Use Portal Teleport"] = false,
        ["Target Time"] = 20,
        ["Aim Prediction"] = 0.5,
        ["Select Region"] = {["Enabled"] = false,["Region"] = {["Singapore"] = true,["United States"] = false,["Netherlands"] = false,["Germany"] =false,["India"] = false,["Australia"] = false}},
        ["Ignore Devil Fruit"] = {"Human-Human","Portal-Portal"}, 
        ["Dodge Skill Player"] = true, --- Beta per 50% can dodge 
        ["Spam Dash"] = false, ---- risk can banned 1 day
        ["Equip Weapon"] = {
            ["Enabled"] = false,
            ["Melee"] = {
                ["Enabled"] = false,
                ["Name Weapon"] = "",
            },
            ["Sword"] = {
                ["Enabled"] = false,
                ["Name Weapon"] = "",
            },
            ["Gun"] = {
                ["Enabled"] = false,
                ["Name Weapon"] = "",
            },
        },
        ["Weapons"] = {
            ["Melee"] = {
                ["Enable"] = true,
                ["Skills"] = {
                    ["Z"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 2},
                    ["X"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 3},
                    ["C"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 5},
                },
            },
            ["Blox Fruit"] = {
                ["Enable"] = false,
                ["Skills"] = {
                    ["Z"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 4},
                    ["X"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 6},
                    ["C"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 9},
                    ["V"] = {["Enable"] = false,["HoldTime"] = 0.3,["Number"] = 0},
                    ["F"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 8},
                },
            },
            ["Gun"] = {
                ["Enable"] = true,
                ["Skills"] = {
                    ["Z"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 1},
                    ["X"] = {["Enable"] = true,["HoldTime"] = 0.3,["Number"] = 7},
                },
            },
            ["Sword"] = {
                ["Enable"] = false,
                ["Skills"] = {
                    ["Z"] = {["Enable"] = true,["HoldTime"] = 1.5,["Number"] = 0},
                    ["X"] = {["Enable"] = true,["HoldTime"] = 0.5,["Number"] = 0},
                },
            },
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-BountyEz.lua"))()
end})

Tabs.Main7:AddButton({Title="SolixHub",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/solixloader/refs/heads/main/solix%20v2%20new%20loader.lua"))()
end})

Tabs.Main7:AddButton({Title="Trung tâm Beecon",Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
end})
-- Tab 3: 99 đêm
Tabs.Main3:AddButton({Title="Demo 99 đêm", Description="Chạy thử tính năng 99 đêm", Callback=function()
    print("Tính năng 99 đêm chưa được triển khai.")
end})

-- Tab 4: ink game
Tabs.Main4:AddButton({Title="Demo Ink Game", Description="Chạy thử Ink Game", Callback=function()
    print("Ink Game chưa có script.")
end})

-- Tab 5: Script của Yuta (tiện ích bổ sung)
Tabs.Main5:AddButton({Title="Teleport về spawn", Description="Di chuyển nhanh về spawn", Callback=function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0,5,0))
    end
end})

Tabs.Main5:AddButton({Title="Xóa tất cả vật thể", Description="Dọn sạch Workspace", Callback=function()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if not v:IsA("Terrain") and v.Name ~= "GiantHouse" then
            v:Destroy()
        end
    end
end})

-- Tab 7: Dead Rails (bổ sung)
Tabs.Main7:AddButton({Title="Beecon + SpeedHub Combo", Description="Chạy Beecon và SpeedHub cùng lúc", Callback=function()
    -- Load Beecon
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
    -- Load SpeedHub
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",true))()
end})

-- Tab 7: thêm nút khác
Tabs.Main7:AddButton({Title="Reset Player", Description="Reset lại nhân vật", Callback=function()
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character:BreakJoints()
    end
end})

-- Tab 5: Script của Yuta (thêm nút build)
Tabs.Main5:AddButton({Title="Tạo Platform lớn", Description="Tạo platform dưới chân bạn", Callback=function()
    local player = game.Players.LocalPlayer
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local part = Instance.new("Part")
        part.Size = Vector3.new(50,1,50)
        part.Position = hrp.Position - Vector3.new(0,3,0)
        part.Anchored = true
        part.BrickColor = BrickColor.new("Really black")
        part.Parent = game.Workspace
    end
end})

print("Van Nguyen Roblox GUI loaded successfully!")
-- Tab 1: Script Blox Fruit
Tabs.Main1:AddButton({Title="Redz Hub", Callback=function()
    local Settings={JoinTeam="Pirates", Translator=true}
    loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
end})

Tabs.Main1:AddButton({Title="w-azure Hub", Callback=function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"))()
end})

Tabs.Main1:AddButton({Title="fix lag", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/Script/main/FixLag.lua"))()
end})

Tabs.Main1:AddButton({Title="xero", Callback=function()
    getgenv().Team="Marines"
    getgenv().Hide_Menu=false
    getgenv().Auto_Execute=false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"))()
end})

Tabs.Main1:AddButton({Title="hiru hub", Callback=function()
    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaStupid/ExecuteGames/main/QuestGames.lua"))()
end})

Tabs.Main1:AddButton({Title="banana hub free", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kimprobloxdz/Banana-Free/refs/heads/main/Protected_5609200582002947.lua.txt"))()
end})

Tabs.Main1:AddButton({Title="speed hub", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
end})

Tabs.Main1:AddButton({Title="script taro", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/GrowaGarden"))()
end})

-- Tab 2: Grow A Garden
Tabs.Main2:AddButton({Title="nat hub", Callback=function()
    loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
end})

Tabs.Main2:AddButton({Title="cutay hub", Callback=function()
    loadstring(game:HttpGet('https://github.com/diemquy/CutTayHub/blob/main/Cuttayhubreal.lua'))()
end})

Tabs.Main2:AddButton({Title="limid hub", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PanjuII/LimitHub/refs/heads/main/LimitHub_Luarmor_E.lua"))()
end})

Tabs.Main2:AddButton({Title="script no lag", Callback=function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
end})

Tabs.Main2:AddButton({Title="script ảo", Callback=function()
    loadstring(game:HttpGet("https://pastefy.app/XgLKMqtd/raw"))()
end})

Tabs.Main2:AddButton({Title="SolixHub", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/solixloader/refs/heads/main/solix%20v2%20new%20loader.lua"))()
end})

Tabs.Main2:AddButton({Title="Speed Hub X", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
end})

Tabs.Main2:AddButton({Title="Beecon Hub", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
end})
-- Tab 3: 99 Đêm Trong Rừng
Tabs.Main3:AddButton({Title="99NDR AutoFarm", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/duonggiahuy/99NDR/main/AutoFarm.lua"))()
end})

Tabs.Main3:AddButton({Title="99NDR Hub V2", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Script999D/99NDRhub/main/Loader.lua"))()
end})

Tabs.Main3:AddButton({Title="99NDR Boss Farm", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/duonggiahuy/99NDR/main/BossFarm.lua"))()
end})

Tabs.Main3:AddButton({Title="99NDR Kill Aura", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/duonggiahuy/99NDR/main/KillAura.lua"))()
end})

Tabs.Main3:AddButton({Title="99NDR All-in-One", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/duonggiahuy/99NDR/main/AllInOne.lua"))()
end})

-- Tab 4: Ink Game
Tabs.Main4:AddButton({Title="Ink Hub V1", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InkHubDev/InkHub/main/Loader.lua"))()
end})

Tabs.Main4:AddButton({Title="Ink Game AutoFarm", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InkHubDev/InkHub/main/AutoFarm.lua"))()
end})

Tabs.Main4:AddButton({Title="Ink Game Boss Hub", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InkHubDev/InkHub/main/Boss.lua"))()
end})

Tabs.Main4:AddButton({Title="Ink Game Misc", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InkHubDev/InkHub/main/Misc.lua"))()
end})

Tabs.Main4:AddButton({Title="Ink Game Full Hub", Callback=function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InkHubDev/InkHub/main/InkFullHub.lua"))()
end})
Tabs.Main1:AddButton({
    Title="astral Hub VN",
    Description="Bản mới nhất Tiếng Việt ✅",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()
    end
})

Tabs.Main1:AddButton({
    Title="MinXt2Vn",
    Description="Tiếng Việt ✅",
    Callback=function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXt2Vn"))()
    end
})
