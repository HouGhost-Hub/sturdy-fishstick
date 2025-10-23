local Arsenal = game.GameId == 994732206 -- Arsenal
local days99 = game.GameId == 7326934954 -- 99 Nights In The Forest
local BloxFruits = game.GameId == 2753915549 -- Blox Fruits
local GymShowdown = game.GameId == 1234567890 -- Thay bằng GameId thực tế của Gym Showdown Simulator
repeat task.wait() until game:IsLoaded()

local function loadScript(url)
    local success, result = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    if not success then
        warn("Failed to load script from " .. url .. ": " .. tostring(result))
        return false
    end
    return true
end

if Arsenal then
    task.spawn(function()
        local scripts = {
            PVP = "https://raw.githubusercontent.com/HouGhost-Hub/special-journey/refs/heads/main/sus.lua",
            Kaitun_Script = "https://raw.githubusercontent.com/vannguyen740/vannguyenkaitun/refs/heads/main/vannguyenkaitun.lua",
            Default = "https://raw.githubusercontent.com/vannguyen740/special-journey/refs/heads/main/Mobile.lua"
        }
        repeat task.wait() until LoadedBackUp
        repeat task.wait() until StatusCheckIsBad
        local scriptUrl = scripts[_G.Script_Mode or "Default"]
        loadScript(scriptUrl)
    end)

    if not loadScript("https://raw.githubusercontent.com/xshiba/FIXING/main/ABC.lua") then
        StatusCheckIsBad = true
    end
    LoadedBackUp = true
    print("Loaded Backup Load for Arsenal")

    local scriptUrl = ({
        PVP = "https://raw.githubusercontent.com/HouGhost-Hub/special-journey/refs/heads/main/sus.lua",
        Kaitun_Script = "https://raw.githubusercontent.com/vannguyen740/vannguyenkaitun/refs/heads/main/vannguyenkaitun.lua",
        Default = "https://raw.githubusercontent.com/vannguyen740/special-journey/refs/heads/main/Mobile.lua"
    })[_G.Script_Mode or "Default"]
    if not loadScript(scriptUrl) then
        StatusCheckIsBad = true
    end
    print("Loaded Main Load for Arsenal")
elseif days99 then
    loadScript("https://raw.githubusercontent.com/vannguyen740/sturdy-fishstick/refs/heads/main/99NightsInTheForest.lua")
    print("Loaded script for 99 Nights In The Forest")
elseif GymShowdown then
    loadScript("https://raw.githubusercontent.com/vannguyen740/gymshowdown-script/main/gymshowdown.lua")
    print("Loaded script for Gym Showdown Simulator")
elseif Arsenal then
    loadScript("https://raw.githubusercontent.com/HouGhost-Hub/special-journey/refs/heads/main/Arsenal%20v5.3.lua")
    print("Loaded script for Gym Showdown Simulator")
elseif
    game.Players.LocalPlayer:Kick("Filter failed. Game not supported. Please try again or contact support.")
    task.wait(3)
    game:Shutdown()
end