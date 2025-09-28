loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

      
       local Window = MakeWindow({
         Hub = {
         Title = "Blox Fruit [ Beta ] Tổng Hợp Van Nguyen",
         Animation = "Youtube: Văn Nguyên"
         },
        Key = {
        KeySystem = true,
        Title = "Blox Fruit [ Beta ] Tổng Hợp Van Nguyen",
        Description = "Blox Fruit TongHop",
        KeyLink = "https://discord.gg/hNjWyVcF",
        Keys = {"vannguyen"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Wrong Key Successfull ✅",
       Incorrectkey = "Working Key No Key ❌",
       CopyKeyLink = "https://discord.gg/hNjWyVcF"
      }
    }
  })

       MinimizeButton({
       Image = "http://www.roblox.com/asset/?id=80196398184635",
       Size = {60, 60},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Click"})
     local Tab2o = MakeTab({Name = "Bấm"})
     local Tab3o = MakeTab({Name = "Thử"})
     
------TOGGLE
Toggle = AddToggle(Tab1o, {
    Name = "Click",
    Default = false,
    Callback = function()
    end
})

------ BUTTON
AddButton(Tab2o, {
    Name = "Bấm",
    Callback = function()
    end
})

------ Dropdown
Dropdown = AddDropdown(Tab3o, {
    Name = "thử",
    Options = {"Test 1", "Test 2", "Test 3", "Test 4"},
    Default = "Melee",
    Callback = function()
    end
})