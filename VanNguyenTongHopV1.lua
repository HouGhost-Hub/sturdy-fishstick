local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/vinh12eqweaws/zingmods/refs/heads/main/zingpro')))()

local Window = OrionLib:MakeWindow({Name = "ZingMod", HidePremium = false, SaveConfig = true, ConfigFolder = "dxl_bf"})

local Tab1 = Window:MakeTab({
	Name = "Scripts Mới",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Mod Client",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Mod Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab4 = Window:MakeTab({
	Name = "Script Cũ",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab5 = Window:MakeTab({
	Name = "Hop Server",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab3:AddButton({
	Name = "RTX",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        loadstring(game:HttpGet("https://pastebin.com/raw/vmjZ4UY8"))()
end
})
Tab5:AddButton({
	Name = "Hop Fulll Moon Notify",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", "eb1b1f1c-ff9a-4d09-9dd5-602129cfe613")
end
})
Tab5:AddButton({
	Name = "Hop Sword Notify",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", "6224c87b-6fec-41a3-8f7d-3ae76cddd2cc")
end
})
Tab5:AddButton({
	Name = "Hop Boss Notify",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", "34605faa-4210-4cd8-9099-3b6c3e95ea55")
end
})
Tab5:AddButton({
	Name = "Hop King Legacy Notify",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "edd760f6-2a2b-49ce-b3a4-a99990793af5", game.Players.LocalPlayer)
end
})
Tab5:AddButton({
	Name = "Hop Haki Color Notify",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", "b68c23f7-fd7b-41cd-a5f3-81363d932ab2")
end
})
Tab5:AddButton({
	Name = "Hop Prehistoric Notify",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", "f850aa84-4c10-46a9-bc6f-89bed183bc83")
end
})
Tab5:AddButton({
	Name = "Hop Mirage Notify",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", "1649ed01-a83e-4a5c-b5b2-1b17e7d00202")
end
})
Tab3:AddButton({
	Name = "Fix Lag",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/Script/main/FixLag.lua"))()
end
})

Tab3:AddButton({
	Name = "Anti Kick",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
     loadstring(game:HttpGet("https://pastebin.com/raw/FPfaukXN"))()
end
})
Tab3:AddButton({
	Name = "Farm Nhanh",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        loadstring(game:HttpGet("https://api.realaya.xyz/v1/files/l/73mkp0aqyfo4ypy8hvl0nz10lq49fey5.lua"))()
end
})


Tab2:AddButton({
	Name = "Fruit Finder",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AdminusGames/Blox_Fruits_Sniper/main/.lua'))()
  	end    
})

Tab2:AddButton({
	Name = "Arceus X",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
end
})

Tab2:AddButton({
	Name = "Krnl",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
      loadstring(game:HttpGet("https://pastebin.com/raw/M3HjLPU7"))()
end
})

Tab2:AddButton({
	Name = "Synapse X",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
      loadstring(game:HttpGet("https://pastebin.com/raw/QmqSgQ3K"))()
end
})

Tab2:AddButton({
	Name = "Keyboard",
	Callback = function()
        repeat wait(5) until game:IsLoaded()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end
})

Tab:AddButton({
	Name = "NEW: Alchemy",
	Callback = function()
       loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
  	end    
})
Tab:AddButton({
	Name = "NEW: Banana",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptRUs/BananaHub/main/BananaHub.lua"))()
  	end    
})
Tab:AddButton({
	Name = "NEW: BLUE X",
	Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/EN.lua"))()
  	end    
})

Tab:AddButton({
	Name = "Chests Farm",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NickelHUBB/SonicTuru/main/ChestFarmOp"))()
end    
})


Tab4:AddButton({
	Name = "Domadic Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/Domadichub/NottoGay/Start.ranscript"))()
  	end    
})

Tab4:AddButton({
	Name = "FTS X Hub!",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/tufreescript/FTS-X-Hub/main/FTSXHUB%20V1'))()
  	end    
})

Tab4:AddButton({
	Name = "T7GFY GUI",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/minded102/dokinbog/main/README.md", true))()
  	end    
})

Tab4:AddButton({
	Name = "CFrame Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Steveee11/Scripts/main/Blox%20Fruits%20OP%20Script"))()
  	end    
})

Tab4:AddButton({
	Name = "Flare Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/flares"))()
  	end    
})

Tab4:AddButton({
	Name = "BLCK Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/BLCK"))()
  	end    
})

Tab4:AddButton({
	Name = "Modz HUb",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/modz"))()
  	end    
})

Tab4:AddButton({
	Name = "Hoho Hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
  	end    
})

Tab4:AddButton({
	Name = "Lol Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/neon"))()
  	end    
})

Tab4:AddButton({
	Name = "Zen Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
  	end    
})

Tab4:AddButton({
	Name = "Uranium/Switch Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Augustzyzx/UraniumX/main/src_.lua.txt"))()
  	end    
})


Tab4:AddButton({
	Name = "Thunder Z",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-05/HUB/main/Mobile-Loader"))()
  	end    
})

Tab4:AddButton({
	Name = "Mukuro Hub",
	Callback = function()
        loaloadstring(game:HttpGet("https://raw.githubusercontent.com/xDepressionx/Free-Script/main/BloxFruit.lua"))()
  	end    
})
