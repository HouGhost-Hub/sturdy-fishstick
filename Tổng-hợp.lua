
------------------------------------------------------------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=91347148253026"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)
------------------------------------------------------------------------------------------------------------------------------------
function topos(Pos) -- Tween
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/350, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 350 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end

PosY = 25

Type = 1
spawn(function()
    while wait() do
		if Type == 1 then
			Pos = CFrame.new(0,PosY,-19)
		elseif Type == 2 then
			Pos = CFrame.new(19,PosY,0)
		elseif Type == 3 then
			Pos = CFrame.new(0,PosY,19)	
		elseif Type == 4 then
			Pos = CFrame.new(-19,PosY,0)
        end
    end
end)

spawn(function()
    while wait(.1) do
        Type = 1
        wait(0.2)
        Type = 2
        wait(0.2)
        Type = 3
        wait(0.2)
        Type = 4
        wait(0.2)
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.MysticIsland or _G.SelectBoss or _G.QuestRace or _G.TweenMGear then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)
    
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.MysticIsland or _G.SelectBoss or _G.QuestRace or _G.TweenMGear then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
    if game.Players.LocalPlayer.Character:FindFirstChild('Highlight') then
        game.Players.LocalPlayer.Character:FindFirstChild('Highlight'):Destroy()
    end
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function EquipWeapon(ToolSe)
    if not Nill then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end

_G.SelectWeapon = "Melee"

task.spawn(function()
	while wait() do
		pcall(function()
			if _G.SelectWeapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Gun" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			end
		end)
	end
end)

local player = game.Players.LocalPlayer
function AttackNoCoolDown()
    local character = player.Character
    if not character then return end
    local equippedWeapon = nil
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") then
            equippedWeapon = item
            break
        end
    end
    if not equippedWeapon then return end
    local function IsEntityAlive(entity)
        return entity and entity:FindFirstChild("Humanoid") and entity.Humanoid.Health > 0
    end
    local function GetEnemiesInRange(range)
        local enemies = game:GetService("Workspace").Enemies:GetChildren()
        local targets = {}
        local playerPos = character:GetPivot().Position
        for _, enemy in ipairs(enemies) do
            local primaryPart = enemy:FindFirstChild("HumanoidRootPart")
            if primaryPart and IsEntityAlive(enemy) and (primaryPart.Position - playerPos).Magnitude <= range then
                table.insert(targets, enemy)
            end
        end
        return targets
    end
    if equippedWeapon:FindFirstChild("LeftClickRemote") then
        local attackCount = 1  
        local enemiesInRange = GetEnemiesInRange(60)
        for _, enemy in ipairs(enemiesInRange) do
            local direction = (enemy.HumanoidRootPart.Position - character:GetPivot().Position).Unit
            pcall(function()
                equippedWeapon.LeftClickRemote:FireServer(direction, attackCount)
            end)
            attackCount = attackCount + 1
            if attackCount > 1000000000 then attackCount = 1 end
        end
    else
        local targets = {}
        local enemies = game:GetService("Workspace").Enemies:GetChildren()
        local playerPos = character:GetPivot().Position
        local mainTarget = nil
        for _, enemy in ipairs(enemies) do
            if not enemy:GetAttribute("IsBoat") and IsEntityAlive(enemy) then
                local head = enemy:FindFirstChild("Head")
                if head and (playerPos - head.Position).Magnitude <= 60 then
                    table.insert(targets, { enemy, head })
                    mainTarget = head
                end
            end
        end
        if not mainTarget then return end
        pcall(function()
            local storage = game:GetService("ReplicatedStorage")
            local attackEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
            local hitEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
            if #targets > 0 then
                attackEvent:FireServer(0.000000001)
                hitEvent:FireServer(mainTarget, targets)
            else
                task.wait(0.000000001)
            end
        end)
    end
end

_G.FastAttack = true

spawn(function()
    while wait(.1) do
        if _G.FastAttack then
            pcall(function()
                repeat task.wait(000.1)
                    AttackNoCoolDown()
                until not _G.FastAttack
            end)
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()

local Window = Fluent:CreateWindow({
    Title = "Van-Nguyen Hub [Beta] ",
    SubTitle = "| by xibasexh6 [Freemium]",
    TabWidth = 180,
    Size = UDim2.fromOffset(450, 420),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Servers = Window:AddTab({ Title = "Discord" }),
    Info = Window:AddTab({ Title = "Thông Tin" }),
    Status = Window:AddTab({ Title = "Chạy Id Game" }),
    Main = Window:AddTab({ Title = "Tự Động Hop" }),
    Auto = Window:AddTab({ Title = "Tự Động Đánh" }),
    Pull = Window:AddTab({ Title = "Tự Động Gạt Cần" }),
    Server = Window:AddTab({ Title = "Check Sever", Icon = "" }),
    Settings = Window:AddTab({ Title = "Setting Player", Icon = "" }),
    Shop = Window:AddTab({ Title = " Shop", Icon = "" }),
    Race=Window:AddTab({ Title="Updated V4" }),
    Main1=Window:AddTab({ Title="Dragon Dojo" }),
    Sea=Window:AddTab({ Title=" Sea Event" })
}

local Discord = Tabs.Servers:AddSection("Discord")
Tabs.Servers:AddButton({
        Title="Van Nguyen Hub Cominity",
        Description="Discord",
        Callback=function()
            setclipboard(tostring("https://discord.gg/nX3dEDXQ")) 
        end
})
local Credits = Tabs.Servers:AddSection("Credits")
Tabs.Servers:AddParagraph({
    Title="Van-Nguyen On Top",
    Description="",
    Callback=function()
    end
})
Tabs.Info:AddParagraph({
    Title="Phát Triển Van-Nguyen",
    Content="On Top"
})
local executorName
if identifyexecutor then
    executorName=identifyexecutor()
elseif getexecutorname then
    executorName=getexecutorname()
end
if executorName then
    Tabs.Info:AddParagraph({
        Title="Client Đang Dùng",
        Content=executorName
    })
end
Tabs.Info:AddParagraph({
    Title="Cập Nhật",
    Content="Script Tổng Hợp Giữa Pe Và Pc nên Sẽ Có 1 Số Script Không Chạy Được"
})
Tabs.Info:AddParagraph({
    Title="Các Client Android Hỗ Trợ",
    Content="Tất Cả Client Android"
})
Tabs.Info:AddParagraph({
    Title="Các Client Pc Hỗ Trợ",
    Content="Tất Cả Client Pc"
})
local Time = Tabs.Status:AddParagraph({
    Title="Thời Gian",
    Content=""
})
local function UpdateLocalTime()
    local date = os.date("*t")
    local hour = date.hour % 24
    local ampm = hour<12 and "AM" or "PM"
    local formattedTime = string.format("%02i:%02i:%02i %s", ((hour-1) % 12)+1, date.min, date.sec, ampm)
    local formattedDate = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
    local LocalizationService = game:GetService("LocalizationService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local name = player.Name
    local regionCode = "Unknown"
    local success, code=pcall(function()
        return LocalizationService:GetCountryRegionForPlayerAsync(player)
    end)
    if success then
        regionCode=code
    end
    Time:SetDesc(formattedDate .. "-" .. formattedTime .. " [ " .. regionCode .. " ]")
end
spawn(function()
    while true do
        UpdateLocalTime()
        game:GetService("RunService").RenderStepped:Wait()
    end
end)
local ServerTime = Tabs.Status:AddParagraph({
    Title="Thời Gian Máy Chủ",
    Content=""
})
local function UpdateServerTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2)) % 24
    local Minute = math.floor(GameTime/60) % 60
    local Second = GameTime % 60
    ServerTime:SetDesc(string.format("%02d Tiếng-%02d Phút-%02d Giây", Hour, Minute, Second))
end
spawn(function()
    while task.wait() do
        pcall(UpdateServerTime)
    end
end)
local Input = Tabs.Status:AddInput("Input", {
        Title="Job ID",
        Default="",
        Placeholder="Dán Job ID Vào Đây",
        Numeric=false, 
        Finished=false, 
        Callback=function(Value)
            _G.Job=Value
        end
    })
    Tabs.Status:AddButton({
        Title="Bắt Đầu Tham Gia Job ID",
        Description="Chỉ Support Cho Game Có ID Server Game",
        Callback=function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
        end
    })
    Tabs.Status:AddButton({
        Title="Sao Chép Job ID",
        Description="Lấy ID Server Game",
        Callback=function()
            setclipboard(tostring(game.JobId))
        end
    })
    local Toggle = Tabs.Status:AddToggle("MyToggle", {Title="Spam Tham Gia Job ID", Default=false })
    Toggle:OnChanged(function(Value)
  _G.Join=Value
        end)
        spawn(function()
while wait() do
if _G.Join then
game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
end
end
end)
Tabs.Status:AddButton({
    Title="Tham Gia Máy Chủ Lại",
    Description="",
    Callback=function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
Tabs.Status:AddButton({
    Title="Server Vip Free",
    Description="",
    Callback=function()
        local Players = game:GetService("Players")
local ownerUserId = 12345678
local whitelist = {
    [11111111] = true,
    [22222222] = true,
}

local function allowPlayer(player)
    if player.UserId == ownerUserId then
        return true
    end
    if whitelist[player.UserId] then
        return true
    end
    local ok, isFriend = pcall(function()
        return player:IsFriendsWith(ownerUserId)
    end)
    if ok and isFriend then
        return true
    end
    return false
end

Players.PlayerAdded:Connect(function(player)
    wait(1)
    if not allowPlayer(player) then
        player:Kick("Máy chủ VIP chỉ cho bạn bè của chủ server hoặc người trong whitelist vào.")
    end
end)
    end
})
Tabs.Status:AddButton({
    Title="Đổi Máy Chủ",
    Description="",
    Callback=function()
        Hop()
    end
})
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything=="" then
            Site=game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site=game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~="null" and Site.nextPageCursor ~=nil then
            foundAnything=Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID=tostring(v.id)
            if tonumber(v.maxPlayers)>tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~=0 then
                        if ID==tostring(Existing) then
                            Possible=false
                        end
                    else
                        if tonumber(actualHour) ~=tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs={}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num=num+1
                end
                if Possible==true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait()
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~="" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

sex = {
    "WildDares",
    "BossBuild",
    "GetPranked",
    "Sub2OfficialNoobie",
    "Sub2Daigrock",
    "Sub2NoobMaster123",
    "Bluxxy",
    "JCWK",
    "Enyu_is_Pro",
    "Sub2Fer999",
    "kittgaming",
    "TheGreatAce",
    "StrawHatMaine",
    "TantaiGaming",
    "Axiore",
    "SUB2GAMERROBOT_EXP1",
    "MagicBus",
    "StarcodeHEO",
    "Sub2CaptainMaui",
    "FIGHT4FRUIT",
    "EARN_FRUITS",
}

Tabs.Shop:AddButton({
    Title = "Redeem Code",
    Callback = function()
        function RedeemCode(Value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Value)
        end
        local delayBetweenRequests = 0.5
        for i, v in pairs(sex) do
            spawn(function()
                RedeemCode(v)
                wait(delayBetweenRequests)
            end)
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommF_Remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
Tabs.Shop:AddButton({
    Title = "Teleport Old World",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("TravelMain")
        end)
        if not success then
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Tabs.Shop:AddButton({
    Title = "Teleport New World",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("TravelDressrosa")
        end)
        if not success then            
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Tabs.Shop:AddButton({
    Title = "Teleport Third Sea",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("TravelZou")
        end)
        if not success then
        end
    end
})
Tabs.Shop:AddParagraph({
    Title = "Fighting Shop",
    Content = string.rep("-", 21)
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Tabs.Shop:AddButton({
    Title = "Black Leg",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("BuyBlackLeg")
        end)
        if not success then            
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Tabs.Shop:AddButton({
    Title = "Fishman Karate",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("BuyFishmanKarate")
        end)
        if not success then            
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Tabs.Shop:AddButton({
    Title = "Electro",
    Callback = function()
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("BuyElectro")
        end)
        if not success then            
        end
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_Remote = Remotes:WaitForChild("CommF_")
Tabs.Shop:AddButton({
    Title = "Dragon Breath",
    Callback = function()
        local success1, result1 = pcall(function()
            return CommF_Remote:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        end)
        if not success1 then
            return
        end
        local success2, result2 = pcall(function()
            return CommF_Remote:InvokeServer("BlackbeardReward", "DragonClaw", "2")
        end)
        if not success2 then
            return
        end
    end
})
Tabs.Shop:AddButton({
    Title = "SuperHuman",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CommF_ = ReplicatedStorage.Remotes.CommF_
        CommF_:InvokeServer("BuySuperhuman")
    end
})
Tabs.Shop:AddButton({
    Title = "Death Step",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CommF_ = ReplicatedStorage.Remotes.CommF_
        CommF_:InvokeServer("BuyDeathStep")
    end
})
Tabs.Shop:AddButton({
    Title = "Sharkman Karate",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CommF_ = ReplicatedStorage.Remotes.CommF_
        CommF_:InvokeServer("BuySharkmanKarate", true)
        wait(0.2)
        CommF_:InvokeServer("BuySharkmanKarate")
    end
})
Tabs.Shop:AddButton({
    Title = "Electric Claw",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CommF_ = ReplicatedStorage.Remotes.CommF_
        CommF_:InvokeServer("BuyElectricClaw")
    end
})
Tabs.Shop:AddButton({
    Title = "Dragon Talon",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CommF_ = ReplicatedStorage.Remotes.CommF_
        CommF_:InvokeServer("BuyDragonTalon")
    end
})
Tabs.Shop:AddButton({
    Title = "God Human",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CommF_ = ReplicatedStorage.Remotes.CommF_
        CommF_:InvokeServer("BuyGodhuman")
    end
})
Tabs.Shop:AddButton({
    Title = "Sanguine Art",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CommF_ = ReplicatedStorage.Remotes.CommF_
        CommF_:InvokeServer("BuySanguineArt", true)
        wait(0.2)
        CommF_:InvokeServer("BuySanguineArt")
    end
})
Tabs.Shop:AddParagraph({
    Title = "Abilities Shop",
    Content = string.rep("-", 21)
})
Tabs.Shop:AddButton({
	Title = "Skyjump [ $10,000 Beli ]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
	end
})
Tabs.Shop:AddButton({
	Title = "Buso Haki [ $25,000 Beli ]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
	end
})
Tabs.Shop:AddButton({
	Title = "Observation haki [ $750,000 Beli ]",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
	end
})
Tabs.Shop:AddButton({
	Title = "Soru [ $100,000 Beli ]",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
	end
})
Tabs.Shop:AddParagraph({
    Title = "Misc Shop",
    Content = string.rep("-", 21)
})
Tabs.Shop:AddButton({
     Title = "Buy Refund Stat (2500F)",
     Callback = function()            
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
     end
})
Tabs.Shop:AddButton({
     Title = "Buy Reroll Race (3000F)",
     Callback = function()            
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
     end
})
Tabs.Shop:AddButton({
    Title = "Buy Ghoul Race",
    Callback = function()
        local args1 = {[1] = "Ectoplasm", [2] = "BuyCheck", [3] = 4}
        local args2 = {[1] = "Ectoplasm", [2] = "Change", [3] = 4}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1))        
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args2))
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Cyborg Race (2500F)",
    Callback = function()
        if not isBuying then
            isBuying = true
            local args = {[1] = "CyborgTrainer", [2] = "Buy"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))                        
            wait(0.5)
            isBuying = false
        end
    end
})

Miragecheck = Tabs.Server:AddParagraph({
    Title = "Mirage Island",
    Content = "Status: "

})
local previousStatus = ""
spawn(function()
    pcall(function()
        while true do
            wait(1)            
            local mirageIslandExists = game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') ~= nil
            local currentStatus = mirageIslandExists and '✅️' or '❌️'
            if currentStatus ~= previousStatus then
                Miragecheck:SetDesc('Status: ' .. currentStatus)
                previousStatus = currentStatus
            end
        end
    end)
end)
Kitsunecheck = Tabs.Server:AddParagraph({
    Title = "Kitsune Island",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while task.wait(1) do
        local currentStatus = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and '✅️' or '❌️'
        if currentStatus ~= previousStatus then
            Kitsunecheck:SetDesc('Status: ' .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
CPrehistoriccheck = Tabs.Server:AddParagraph({
    Title = "Prehistoric Island",
    Desc = "Status: "
})
task.spawn(function()
    local previousStatus = ""
    while task.wait(1) do
        local currentStatus = game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and '✅️' or '❌️'
        if currentStatus ~= previousStatus then
            CPrehistoriccheck:SetDesc("Status: " .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
FrozenIsland = Tabs.Server:AddParagraph({
    Title = "Frozen Dimension",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') and '✅️' or '❌️'
        if currentStatus ~= previousStatus then
            FrozenIsland:SetDesc('Status: ' .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
MobCakePrince = Tabs.Server:AddParagraph({
    Title = "Dimension Killed",
    Content = ""
})
spawn(function()
    while wait(1) do
        local cakePrince = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
        local killStatus = "Cake Prince: ✅️"
        if string.len(cakePrince) >= 86 then
            local killCount = string.sub(cakePrince, 39, 41)
            killStatus = "Kill: " .. killCount
        end
        MobCakePrince:SetDesc(killStatus)
    end
end)
CheckRip = Tabs.Server:AddParagraph({
    Title = "Rip_Indra",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and '✅️' or '❌️'
        if currentStatus ~= previousStatus then
            CheckRip:SetDesc("Status: " .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
CheckDoughKing = Tabs.Server:AddParagraph({
    Title = "Dough King",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") and '✅️' or '❌️'
        if currentStatus ~= previousStatus then
            CheckDoughKing:SetDesc("Status: " .. currentStatus)
            previousStatus = currentStatus
        end
    end
end)
EliteHunter = Tabs.Server:AddParagraph({
    Title = "Elite Hunter",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local currentStatus = (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) and '✅️' or '❌️'
        local progress = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")
        if currentStatus ~= previousStatus then
            EliteHunter:SetDesc("Status: " .. currentStatus .. " | Killed: " .. progress)
            previousStatus = currentStatus
        end
    end
end)
FM = Tabs.Server:AddParagraph({
    Title = "Full Moon",
    Content = ""
})
task.spawn(function()
    while task.wait(1) do
        local moonTextureId = game:GetService("Lighting").Sky.MoonTextureId
        local moonStatus = "Moon: 0/5"
        if moonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
            moonStatus = "Moon: 5/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
            moonStatus = "Moon: 4/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
            moonStatus = "Moon: 3/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
            moonStatus = "Moon: 2/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
            moonStatus = "Moon: 1/5"
        end
        FM:SetDesc(moonStatus)
    end
end)
LegendarySword = Tabs.Server:AddParagraph({
    Title = "Legendary Sword",
    Content = "Status: "
})
spawn(function()
    local previousStatus = ""
    while wait(1) do
        local swordStatus = "Not Found Legend Swords"
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
            swordStatus = "Shisui"
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2") then
            swordStatus = "Wando"
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3") then
            swordStatus = "Saddi"
        end
        LegendarySword:SetDesc(swordStatus)
    end
end)
StatusBone = Tabs.Server:AddParagraph({
    Title = "Bone",
    Content = ""
})
spawn(function()
    while wait(1) do
        StatusBone:SetDesc("You Have: " .. tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")) .. " Bones")
    end
end)

Toggle = Tabs.Settings:AddToggle("Toggle", {Title = "Auto Turn On Buso", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AUTOHAKI = Value
end)
spawn(function()
    local canUseHaki = true
    local debounceTime = 2
    while task.wait(0.1) do
        if getgenv().AUTOHAKI then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") and canUseHaki then
                canUseHaki = false
                local args = {
                    [1] = "Buso"
                }
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end)
                wait(debounceTime)
                canUseHaki = true
            end
        end
    end
end)
Toggle = Tabs.Settings:AddToggle("Toggle", { Title = "Auto Turn On Race V4", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AutoTurnOnV4 = Value
end)
task.spawn(function()
    local lastCheckTime = 0
    while true do
        task.wait(0.1)
        if getgenv().AutoTurnOnV4 then
            local currentTime = tick()
            if currentTime - lastCheckTime >= 0.5 then
                lastCheckTime = currentTime
                local character = game.Players.LocalPlayer.Character
                if character and character:FindFirstChild("RaceEnergy") and
                   character.RaceEnergy.Value >= 1 and
                   not character.RaceTransformed.Value then
                    local be = game:GetService("VirtualInputManager")
                    be:SendKeyEvent(true, "Y", false, game)
                    task.wait(0.1)
                    be:SendKeyEvent(false, "Y", false, game)
                end
            end
        end
    end
end)
Toggle = Tabs.Settings:AddToggle("Toggle", {Title = "Auto Turn On Race V3", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AutoTurnOnV3 = Value
end)
task.spawn(function()
    local prevState = false    
    while true do
        task.wait(0.1)        
        pcall(function()
            if getgenv().AutoTurnOnV3 ~= prevState then
                if getgenv().AutoTurnOnV3 then
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
                prevState = getgenv().AutoTurnOnV3
            end
        end)
    end
end)
local Toggle = Tabs.Settings:AddToggle("Toggle", {Title = "Auto Set Spawn Point", Default = false })
local lastSetState = false
Toggle:OnChanged(function(Value)
    getgenv().Set = Value
    if Value ~= lastSetState then
        lastSetState = Value
        if Value then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end)
        end
    end
end)
Toggle = Tabs.Settings:AddToggle("Toggle", {Title = "Anti AFK", Default = true })
Toggle:OnChanged(function(Value)
    getgenv().AntiAFK = Value 
end)
task.spawn(function()
    while true do
        if getgenv().AntiAFK then
            local vu = game:GetService("VirtualUser")
            local player = game:GetService("Players").LocalPlayer
            player.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
        game:GetService("RunService").Heartbeat:wait()
    end
end)
------------------------------------------------------------------------------------------------------------------------------------
Tabs.Main:AddButton({
    Title = "Hop Dough King V2",
    Description = "Đợi 5s bấm 1 lần",
    Callback = function()
       wait(5)
        loadstring(game:HttpGet("https://pastefy.app/a0f1qNqp/raw"))()
    end
})

Tabs.Main:AddButton({
    Title = "Hop Rip Indra",
    Description = "Đợi 5s bấm 1 lần",
    Callback = function()
        wait(5)
        loadstring(game:HttpGet("https://pastefy.app/TfLVb9tP/raw"))()
    end
})

Tabs.Main:AddButton({
    Title = "Hop Dark beard",
    Description = "Đợi 5s bấm 1 lần",
    Callback = function()
        wait(5)
        loadstring(game:HttpGet("https://pastefy.app/YBG7TYZG/raw"))()
    end
})

Tabs.Main:AddButton({
    Title = "Hop Mirage Island",
    Description = "Đợi 5s bấm 1 lần",
    Callback = function()
        wait(5)
        loadstring(game:HttpGet("https://pastefy.app/JPMkBSOT/raw"))()
    end
})

Tabs.Main:AddButton({
    Title = "Hop Full Moon",
    Description = "Đợi 5s bấm 1 lần",
    Callback = function()
        wait(5)
         loadstring(game:HttpGet("https://pastefy.app/mDHIxKid/raw"))()
    end
})

Tabs.Main:AddButton({
    Title = "Hop Haki Legendery",
    Description = "Đang cập nhật thêm",
    Callback = function()
    end
})

Tabs.Main:AddButton({
    Title = "Hop Sword Legendery",
    Description = "Đang cập nhật thêm",
    Callback = function()
    end
})

------------------------------------------------------------------------------------------------------------------------------------
Dropdown = Tabs.Auto:AddDropdown("Dropdown", {
    Title = "Select Boss",
    Values = {
        "rip_indra True Form",
        "Dough King",
        "Darkbeard"
    },
    Multi = false,
})
Dropdown:SetValue(false)
Dropdown:OnChanged(function(V)
    _G.SelectBoss = V
end)

Toggle = Tabs.Auto:AddToggle("Toggle", { Title = "Auto Farm Boss", Default = false })
Toggle:OnChanged(function(V)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    _G.FarmBoss = V
    StopTween(_G.FarmBoss)
end)

spawn(function()
    while wait() do
        if _G.FarmBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectBoss then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until not _G.FarmBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                    end
                end
            end)
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------
local Mastery = Tabs.Race:AddSection("Race v4")
Tabs.Race:AddButton({
    Title="Temple of Time",
    Description="",
    Callback=function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    end
})
Tabs.Race:AddButton({
    Title="Pull Lever",
    Description="",
    Callback=function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})
Tabs.Race:AddButton({
    Title="Buy Gear",
    Description="",
    Callback=function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        topos(CFrame.new(28981.552734375, 14888.4267578125,-120.245849609375))
    end
})
local Mastery = Tabs.Race:AddSection("Race")
Tabs.Race:AddButton({
    Title="Teleport Door Race",
    Description="",
    Callback=function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
                    if game:GetService("Players").LocalPlayer.Data.Race.Value=="Human" then
                    topos(CFrame.new(29221.822265625, 14890.9755859375,-205.99114990234375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Skypiea" then
                    topos(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Fishman" then
                    topos(CFrame.new(28231.17578125, 14890.9755859375,-211.64173889160156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Cyborg" then
                    topos(CFrame.new(28502.681640625, 14895.9755859375,-423.7279357910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Ghoul" then
                    topos(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Mink" then
                    topos(CFrame.new(29012.341796875, 14890.9755859375,-380.1492614746094))
                    end
    end
})
local ToggleHumanandghoul = Tabs.Race:AddToggle("ToggleHumanandghoul", {Title="Auto Trial Human/Ghoul",Description="", Default=false })
ToggleHumanandghoul:OnChanged(function(Value)
    KillAura=Value
end)
Options.ToggleHumanandghoul:SetValue(false)
local ToggleAutotrial = Tabs.Race:AddToggle("ToggleAutotrial", {Title="Auto Trial",Description="", Default=false })
ToggleAutotrial:OnChanged(function(Value)
    _G.AutoQuestRace=Value
end)
Options.ToggleAutotrial:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
                if game:GetService("Players").LocalPlayer.Data.Race.Value=="Human" then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            pcall(function()
                                repeat wait()
                                    v.Humanoid.Health=0
                                    v.HumanoidRootPart.CanCollide=false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health<=0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Skypiea" then
                    for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        if v.Name=="snowisland_Cylinder.081" then
                            BKP(v.CFrame*CFrame.new(0,0,0))
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Fishman" then
                    for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                        if v.Name=="HumanoidRootPart" then
                            Tween(v.CFrame*Pos)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip=="Melee" then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip=="Blox Fruit" then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait()
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip=="Sword" then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait()
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip=="Gun" then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Cyborg" then
                    Tween(CFrame.new(28654, 14898.7832,-30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Ghoul" then
                    for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            pcall(function()
                                repeat wait()
                                    v.Humanoid.Health=0
                                    v.HumanoidRootPart.CanCollide=false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health<=0
                            end)
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Race.Value=="Mink" then
                    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v.Name=="StartPoint" then
                            Tween(v.CFrame*CFrame.new(0,10,0))
                          end
                       end
                end
            end
        end
    end)
end)
local ToggleKillTrial = Tabs.Race:AddToggle("ToggleKillTrial", {Title="Kill Player Trial", Description="", Default=false})
ToggleKillTrial:OnChanged(function(Value)
    _G.AutoKillTrial=Value
end)
Options.ToggleKillTrial:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKillTrial then
                for _, v in pairs(game:GetService("Players"):GetChildren()) do
                    if v.Name and v.Name ~=game.Players.LocalPlayer.Name and 
                       (v.Character.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=100 then
                        if v.Character.Humanoid.Health>0 then
                            repeat
                                wait(_G.Fast_Delay)
                                EquipTool(SelectWeapon)
                                AutoHaki()
                                Tween(v.Character.HumanoidRootPart.CFrame*CFrame.new(0, 0, 5))
                                v.Character.HumanoidRootPart.CanCollide=false
                                v.Character.HumanoidRootPart.Size=Vector3.new(60, 60, 60)
                                AttackNoCoolDown()
                            until not _G.AutoKillTrial or not v.Parent or v.Character.Humanoid.Health<=0
                        end
                    end
                end
            end
        end)
    end
end)
local Mastery = Tabs.Race:AddSection("Train Race")
local ToggleFarmRace = Tabs.Race:AddToggle("ToggleFarmRace", {Title="Auto Train", Description="", Default=false})
local AutoFarmRace = false 
ToggleFarmRace:OnChanged(function(Value)
    AutoFarmRace=Value
end)
Options.ToggleFarmRace:SetValue(false)
spawn(function()
    while wait() do
        if AutoFarmRace then 
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                    if game.Players.LocalPlayer.Character.RaceTransformed.Value==true then
                        _G.AutoBoneNoQuest=false
                        Tween(CFrame.new(-9698.4736328125, 445.09442138671875, 6545.8525390625))
                    elseif game.Players.LocalPlayer.Character.RaceTransformed.Value==false then
                        _G.AutoBoneNoQuest=true
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                        wait()
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                    end
                end
            end)
        else
            _G.AutoBoneNoQuest=false 
        end
    end
end)
local ToggleUpgrade = Tabs.Race:AddToggle("ToggleUpgrade", {Title="Upgrade Gear", Description="", Default=false })
ToggleUpgrade:OnChanged(function(Value)
    _G.AutoUpgrade=Value
    if _G.AutoUpgrade then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('UpgradeRace', 'Buy')
    end
end)
Options.ToggleUpgrade:SetValue(false)
------------------------------------------------------------------------------------------------------------------------------------
local Blaze = Tabs.Main1:AddSection("Dojo")
local ToggleBlazeEmber = Tabs.Sea:AddToggle("ToggleBlazeEmber", {
    Title="Collect Blaze Ember", 
    Description="", 
    Default=false
})
ToggleBlazeEmber:OnChanged(function(Value)
    _G.AutoBlazeEmber=Value
end)
spawn(function()
    while wait() do
        if _G.AutoBlazeEmber then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer()
            end)
        end
    end
end)
local ToggleBlazeEmberFarm = Tabs.Main1:AddToggle("ToggleBlazeEmberFarm", {
    Title = "Auto Blaze Ember", 
    Description = "", 
    Default = false
})
ToggleBlazeEmberFarm:OnChanged(function(Value)
    _G.AutoBlazeEmberFarm = Value
end)
spawn(function()
    while task.wait() do
        if _G.AutoBlazeEmberFarm then  
            pcall(function()
                local enemies = game:GetService('Workspace').Enemies
                if enemies:FindFirstChild('Hydra Enforcer') or enemies:FindFirstChild('Venomous Assailant') then
                    for _, v in pairs(enemies:GetChildren()) do
                        if v.Name == 'Hydra Enforcer' or v.Name == 'Venomous Assailant' then
                            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    FarmPos = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                until not _G.AutoBlazeEmberFarm or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(CFrame.new(4612.078125, 1002.283447265625, 498.2188720703125))
                end
            end)
        end
    end
end)
local ToggleReceiveQuest = Tabs.Main1:AddToggle("ToggleReceiveQuest", {
    Title="Receive Quest", 
    Description="On/Off To 1-2", 
    Default=false
})
ToggleReceiveQuest:OnChanged(function(Value)
    _G.AutoReceiveQuest=Value
    if _G.AutoReceiveQuest then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438,-334.9649963378906))
        topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        spawn(function()
            pcall(function()
                while wait() do
                    local args = {
                        [1]={
                            ["Context"]="RequestQuest"
                        }
                    }
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(args))
                    local checkArgs = {
                        [1]={
                            ["Context"]="Check"
                        }
                    }
                    local response = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(checkArgs))
                end
            end)
        end)
    end
end)
local BlazeEmberQuestStatus = Tabs.Main1:AddParagraph({
    Title="Status Blaze Ember",
    Content=""
})
spawn(function()
    pcall(function()
        while wait() do
            local args = {
                [1]={
                    ["Context"]="Check"
                }
            }
            local response = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(args))
            if typeof(response)=="table" then
                for key, value in pairs(response) do
                    if value=="Defeat 3 Venomous Assailants on Hydra Island." then
                        BlazeEmberQuestStatus:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.")
                    elseif value=="Defeat 3 Hydra Enforcers on Hydra Island." then
                        BlazeEmberQuestStatus:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.")
                    elseif value=="Destroy 10 trees on Hydra Island." then
                        BlazeEmberQuestStatus:SetDesc("Destroy 10 trees on Hydra Island.")
                    end
                end
            end
        end
    end)
end)
local ToggleHydraTree = Tabs.Main1:AddToggle("ToggleHydraTree", { 
    Title = "Auto Hydra Tree", 
    Description = "", 
    Default = false 
})
ToggleHydraTree:OnChanged(function(Value)
    _G.AutoHydraTree = Value
end)
local function sendSkillKey(skillKey)
    local virtualInputManager = game:GetService("VirtualInputManager")
    virtualInputManager:SendKeyEvent(true, skillKey, false, game)
    virtualInputManager:SendKeyEvent(false, skillKey, false, game)
end
local function equipAndUseSkill(toolType)
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.ToolTip == toolType then
            item.Parent = player.Character  
            for _, skill in ipairs({"Z", "X", "C", "V", "F"}) do
                wait() 
                pcall(function() sendSkillKey(skill) end) 
            end
            item.Parent = backpack
            break
        end
    end
end
local targets = {
    CFrame.new(5288.61962890625, 1005.4000244140625, 392.43011474609375),
    CFrame.new(5343.39453125, 1004.1998901367188, 361.0687561035156),
    CFrame.new(5235.78564453125, 1004.1998901367188, 431.4530944824219),
    CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625),
    CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375),
}
spawn(function()
    while wait() do
        if _G.AutoHydraTree then
            AutoHaki()  
            for _, target in ipairs(targets) do
                if not _G.AutoHydraTree then break end 
                topos(target) 
                wait()
                local character = game.Players.LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local distance = (character.HumanoidRootPart.Position - target.Position).Magnitude
                    if distance <= 1 then
                        equipAndUseSkill("Melee")
                        equipAndUseSkill("Sword")
                        equipAndUseSkill("Gun")
                    end
                end
            end
        end
    end
end)
Tabs.Main1:AddButton({
    Title="Telepor Dragon Dojo",
    Description="",
    Callback=function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438,-334.9649963378906))
        topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    end
})
Tabs.Main1:AddButton({
    Title="Craft Volcanic Magnet",
    Description="Need 15 Blaze Ember + 10 Iron",
    Callback=function()
        local args = {
            [1]="CraftItem",
            [2]="Craft",
            [3]="Volcanic Magnet"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
local ToggleCollectFireFlowers = Tabs.Main1:AddToggle("ToggleCollectFireFlowers", {
    Title="Collect Blaze Ember", 
    Description="", 
    Default=false
})
ToggleCollectFireFlowers:OnChanged(function(Value)
    _G.AutoCollectFireFlowers = Value
end)
spawn(function()
    while wait() do
        if _G.AutoCollectFireFlowers then
            local fireFlowersFolder = workspace:FindFirstChild("FireFlowers")
            if fireFlowersFolder then
                for _, obj in pairs(fireFlowersFolder:GetChildren()) do
                    if obj:IsA("Model") and obj.PrimaryPart then
                        local flowerPos = obj.PrimaryPart.Position
                        local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local distance = (flowerPos - playerPos).Magnitude
                        if distance <= 1 then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                            wait(1.5)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                        else
                            topos(CFrame.new(flowerPos))
                        end
                    end
                end
            end
        end
    end
end)
local ToggleWhiteBelt = Tabs.Main1:AddToggle("ToggleWhiteBelt", {
    Title="Auto White Belt",
    Description="",
    Default=false
})
ToggleWhiteBelt:OnChanged(function(Value)
    _G.AutoLevel=Value
    if Value then
        local args = {
            [1]={
                ["NPC"]="Dojo Trainer",
                ["Command"]="RequestQuest"
            }
        }
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
        spawn(function()
            while _G.AutoLevel do
                local claimArgs = {
                    [1]={
                        ["NPC"]="Dojo Trainer",
                        ["Command"]="ClaimQuest"
                    }
                }
                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(claimArgs))
                wait()  
            end
        end)
    end
end)
local DracoV4 = Tabs.Sea:AddParagraph({
    Title="Auto Trial Draco",
    Content="Comning Soon"
})
local ToggleTrialTeleport = Tabs.Sea:AddToggle("ToggleTrialTeleport", {
    Title="Teleport Trial Race Draco", 
    Description="", 
    Default=false
})
ToggleTrialTeleport:OnChanged(function(Value)
    _G.AutoTrialTeleport = Value
end)
spawn(function()
    while wait() do
        if _G.AutoTrialTeleport then
            local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
            if trialTeleport and trialTeleport:IsA("Part") then
                topos(CFrame.new(trialTeleport.Position))
                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - trialTeleport.Position).Magnitude
                if distance <= 1 then
                    _G.AutoTrialTeleport = false
                end
            end
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------
local ToggleTPVolcano = Tabs.Sea:AddToggle("ToggleTPVolcano", { 
    Title="Teleport Volcano Island", 
    Description="", 
    Default=false 
})
ToggleTPVolcano:OnChanged(function(Value)
    _G.TweenToPrehistoric=Value
end)
Options.ToggleTPVolcano:SetValue(false)
spawn(function()
    local island
    while not island do
        island=game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        if _G.TweenToPrehistoric then
            local prehistoricIslandCore = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIslandCore then
                local relic = prehistoricIslandCore:FindFirstChild("Core") and prehistoricIslandCore.Core:FindFirstChild("PrehistoricRelic")
                local skull = relic and relic:FindFirstChild("Skull")
                if skull then
                    topos(CFrame.new(skull.Position))
                    _G.TweenToPrehistoric=false
                end
            end
        end
    end
end)
local ToggleDefendVolcano = Tabs.Sea:AddToggle("ToggleDefendVolcano", {
    Title = "Auto Event", 
    Description = "", 
    Default = false
})
ToggleDefendVolcano:OnChanged(function(Value)
    _G.AutoDefendVolcano = Value
end)
local ToggleMelee = Tabs.Sea:AddToggle("ToggleMelee", {
    Title = "Use Melee", 
    Description = "", 
    Default = false
})
ToggleMelee:OnChanged(function(Value)
    _G.UseMelee = Value
end)
local ToggleSword = Tabs.Sea:AddToggle("ToggleSword", {
    Title = "Use Sword", 
    Description = "", 
    Default = false
})
ToggleSword:OnChanged(function(Value)
    _G.UseSword = Value
end)
local ToggleGun = Tabs.Sea:AddToggle("ToggleGun", {
    Title = "Use Gun", 
    Description = "", 
    Default = false
})
ToggleGun:OnChanged(function(Value)
    _G.UseGun = Value
end)
local function useSkill(skillKey)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, skillKey, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, skillKey, false, game)
end
local function removeLava()
    local interiorLavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
    if interiorLavaModel and interiorLavaModel:IsA("Model") then
        interiorLavaModel:Destroy()
    end
    local prehistoricIsland1 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if prehistoricIsland1 then
        for _, descendant in pairs(prehistoricIsland1:GetDescendants()) do
            if descendant:IsA("Part") and descendant.Name:lower():find("lava") then
                descendant:Destroy()
            end
        end
    end
    local prehistoricIsland2 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if prehistoricIsland2 then
        for _, model in pairs(prehistoricIsland2:GetDescendants()) do
            if model:IsA("Model") then
                for _, child in pairs(model:GetDescendants()) do
                    if child:IsA("MeshPart") and child.Name:lower():find("lava") then
                        child:Destroy()
                    end
                end
            end
        end
    end
end
local function findValidRock()
    local volcanoRocksFolder = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
    for _, Rock in pairs(volcanoRocksFolder:GetChildren()) do
        if Rock:IsA("Model") then
            local volcanorock = Rock:FindFirstChild("volcanorock")
            if volcanorock and volcanorock:IsA("MeshPart") then
                local color = volcanorock.Color
                if color == Color3.fromRGB(185, 53, 56) or color == Color3.fromRGB(185, 53, 57) then
                    return volcanorock
                end
            end
        end
    end
    return nil 
end
local function equipAndUseSkill(toolType)
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.ToolTip == toolType then
            item.Parent = player.Character 
            for _, skill in ipairs({"Z", "X", "C", "V", "F"}) do
                wait() 
                pcall(function() useSkill(skill) end) 
            end
            item.Parent = backpack
            break
        end
    end
end
spawn(function()
    while wait() do
        if _G.AutoDefendVolcano then
            AutoHaki() 
            pcall(removeLava) 
            local currentTarget = findValidRock() 
            if currentTarget then
                local targetPosition = CFrame.new(currentTarget.Position + Vector3.new(0, 0, 0))
                topos(targetPosition) 
                local color = currentTarget.Color
                if color ~= Color3.fromRGB(185, 53, 56) and color ~= Color3.fromRGB(185, 53, 57) then
                    currentTarget = findValidRock() 
                else
                    local currentPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local distance = (currentPosition - currentTarget.Position - Vector3.new(0, 0, 0)).Magnitude
                    if distance <= 1 then
                        if _G.UseMelee then
                            equipAndUseSkill("Melee")
                        end
                        if _G.UseSword then
                            equipAndUseSkill("Sword")
                        end
                        if _G.UseGun then
                            equipAndUseSkill("Gun")
                        end
                    end
                    _G.TweenToPrehistoric = false
                end
            else
                _G.TweenToPrehistoric = true
            end
        end
    end
end)
local ToggleKillAura = Tabs.Sea:AddToggle("ToggleKillAura", {Title="Auto Kill Golems",Description="", Default=false })
ToggleKillAura:OnChanged(function(Value)
    KillAura=Value
end)
Options.ToggleKillAura:SetValue(false)
spawn(function()
    while wait() do
        if KillAura then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                        repeat task.wait()
                            sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                            v.Humanoid.Health=0
                            v.HumanoidRootPart.CanCollide=false
                        until not KillAura or not v.Parent or v.Humanoid.Health<=0
                    end
                end
            end)
        end
    end
end)
local ToggleCollectBone = Tabs.Sea:AddToggle("ToggleCollectBone", {
    Title="Collect Bone", 
    Description="", 
    Default=false
})
ToggleCollectBone:OnChanged(function(Value)
    _G.AutoCollectBone=Value
end)
spawn(function()
    while wait() do
        if _G.AutoCollectBone then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name=="DinoBone" then
                    topos(CFrame.new(obj.Position))
                end
            end
        end
    end
end)
local ToggleCollectEgg = Tabs.Sea:AddToggle("ToggleCollectEgg", {
    Title = "Collect Egg",
    Description = "",
    Default = false
})
ToggleCollectEgg:OnChanged(function(Value)
    _G.AutoCollectEgg = Value
end)
spawn(function()
    while wait() do
        if _G.AutoCollectEgg then
            local dragonEggs = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
            if #dragonEggs > 0 then
                local randomEgg = dragonEggs[math.random(1, #dragonEggs)]
                if randomEgg:IsA("Model") and randomEgg.PrimaryPart then
                    topos(randomEgg.PrimaryPart.CFrame)
                    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local eggPosition = randomEgg.PrimaryPart.Position
                    local distance = (playerPosition - eggPosition).Magnitude
                    if distance <= 1 then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    end
                end
            end
        end
    end
end)
