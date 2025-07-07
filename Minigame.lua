if not _G.ScriptRunning then
    _G.ScriptRunning = true
    local sound = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("SoundPlayer")
    local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
    task.wait(2)
    sound.FX:play("BambooButton")
    UI.set_app_visibility("NewsApp", false)

    task.wait(5)


    getgenv().fsysCore = require(game:GetService("ReplicatedStorage").ClientModules.Core.InteriorsM.InteriorsM)
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local CoreGui = game:GetService("CoreGui")
    local PlayerGui = Player:FindFirstChildOfClass("PlayerGui") or CoreGui
    local LiveOpsMapSwap = require(game:GetService("ReplicatedStorage").SharedModules.Game.LiveOpsMapSwap)
    
    local router
    for i, v in next, getgc(true) do
        if type(v) == 'table' and rawget(v, 'get_remote_from_cache') then
            router = v
        end
    end

    local function rename(remotename, hashedremote)
        hashedremote.Name = remotename
    end
    table.foreach(debug.getupvalue(router.get_remote_from_cache, 1), rename)
    local xc = 0
    local NewAcc = false
    local HasTradeLic = false
    local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
    local Cash = ClientData.get_data()[game.Players.LocalPlayer.Name].money
    local NewAcc = false
    local HasTradeLic = false
    if ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.toys then 
        for i, v in pairs(ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.toys) do
            if v.id == "trade_license" then
                print("has trade lic")
                HasTradeLic = true
            end
        end
    end

    if Cash <= 10000 and not HasTradeLic then
        print("New account")
        print("Inside new account")
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer("theme_color", "red")
            local args = {
                [1] = "theme_color",
                [2] = "red"
            }
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TeamAPI/ChooseTeam"):InvokeServer("Parents", {
                ["source_for_logging"] = "intro_sequence",
                ["dont_enter_location"] = true
            })
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Avatar Tutorial Started")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Avatar Editor Opened")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer("opened")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetGender"):FireServer("male")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Avatar Editor Closed")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Housing Tutorial Started")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Housing Editor Opened")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer("edit_state_entered", {
                ["house_type"] = "mine"
            })
            task.wait(2)
            local args = { [1] = {} }
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = { [1] = "edit_state_exited", [2] = {} }
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("House Exited")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Nursery Tutorial Started")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Nursery Entered")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/EquipTutorialEgg"):FireServer()
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Started Egg Received")
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TutorialAPI/AddTutorialQuest"):FireServer()
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer("Tutorial Ailment Spawned")
            task.wait(2)
            local args = { [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg") }
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AdoptAPI/FocusPet"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/MarkTutorialCompleted"):FireServer()
            task.wait(2)
        end)
        if not success then
            warn("Error in first task: " .. tostring(err))
        end
        
        local success, err = pcall(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local API = ReplicatedStorage:WaitForChild("API")
            
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("npc_interaction")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ChoosePet"):FireServer("dog")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(2, { chosen_pet = "dog" })
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(3, { named_pet = false })
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(4)
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(5)
            task.wait(2)
            API:WaitForChild("TutorialAPI/SpawnPetTreat"):FireServer()
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet_2")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(6)
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(7)
            task.wait(2)
            API:WaitForChild("TutorialAPI/AddTutorialQuest"):FireServer()
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("opened_taskboard")
            task.wait(2)
            API:WaitForChild("QuestAPI/MarkQuestsViewed"):FireServer()
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet_3")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("started_playground_nav")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("reached_playground")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("opened_taskboard_2")
            task.wait(2)
            API:WaitForChild("QuestAPI/ClaimQuest"):InvokeServer("{6d6b008a-650e-4bea-b65c-20357e85f71c}")
            task.wait(2)
            API:WaitForChild("QuestAPI/MarkQuestsViewed"):FireServer()
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(10)
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet_4")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("started_home_nav")
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(11)
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportStepCompleted"):FireServer(12)
            task.wait(2)
            API:WaitForChild("TutorialAPI/ReportDiscreteStep"):FireServer("cured_dirty_ailment")
            task.wait(2)
            API:WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
            task.wait(2)
        end)
        if not success then
            warn("Error in second task: " .. tostring(err))
        end
        while not HasTradeLic do
            print("no trade lic")
            if ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.toys then 
                fsys = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
                local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
                fsys("RouterClient").get("SettingsAPI/SetBooleanFlag"):FireServer("has_talked_to_trade_quest_npc", true)
                task.wait()
                fsys("RouterClient").get("TradeAPI/BeginQuiz"):FireServer()
                task.wait(1)
                for i, v in pairs(fsys('ClientData').get("trade_license_quiz_manager")["quiz"]) do
                        fsys("RouterClient").get("TradeAPI/AnswerQuizQuestion"):FireServer(v["answer"])
                    task.wait()
                end
                for i, v in pairs(ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.toys) do
                    if v.id == "trade_license" then
                        print("have trade lic")
                        HasTradeLic = true
                    end
                end
            end
            task.wait(0.4)
        end
        Player:Kick("Tutorial completed please restart game!")
    end




    local function teleportToMainmap()
        local targetCFrame = CFrame.new(-275.9091491699219, 25.812084197998047, -1548.145751953125, -0.9798217415809631, 0.0000227206928684609, 0.19986890256404877, -0.000003862579433189239, 1, -0.00013261348067317158, -0.19986890256404877, -0.00013070966815575957, -0.9798217415809631)
        local OrigThreadID = getthreadidentity()
        task.wait(1)
        setidentity(2)
        task.wait(1)
        fsysCore.enter_smooth("MainMap", "MainDoor", {
            ["spawn_cframe"] = targetCFrame * CFrame.Angles(0, 0, 0)
        })
        setidentity(OrigThreadID)
    end
    teleportToMainmap()
    task.wait(2)

        local function FireSig(button)
            pcall(function()
                for _, connection in pairs(getconnections(button.MouseButton1Down)) do
                    connection:Fire()
                end
                task.wait(0.1)
                for _, connection in pairs(getconnections(button.MouseButton1Up)) do
                    connection:Fire()
                end
                task.wait(0.1)
                for _, connection in pairs(getconnections(button.MouseButton1Click)) do
                    connection:Fire()
                    -- print(button.Name.." clicked!")
                end
            end)
        end
        
    local function teleportPlayerNeeds(x, y, z)

        if x == 0 and y == 350 and z == 0 then
            x = math.random(10, 20)
        end
        local Player = game.Players.LocalPlayer
        if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z) 
        else
            --print("Player or character not found!")
        end
    end

    teleportPlayerNeeds(-589.408, 35.7978, -1669.11828)

    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local focusPetApp = Player.PlayerGui.FocusPetApp.Frame
    local ailments = focusPetApp.Ailments
    local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)

    getgenv().fsys = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)


    local virtualUser = game:GetService("VirtualUser")

    Player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)

    task.spawn(function()
        while true do
            task.wait(1200) -- every 20 minutes 
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            print("Anti-AFK jump")
        end
    end)

    task.wait(2)

    local Players = game:GetService("Players")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local Interiors = workspace:WaitForChild("Interiors")
    local targetPosition = Vector3.new(12028.45, 9904.26, 5982.73)

    -- Function to simulate clicking the center of the screen
    local function clickCenter()
        local screenCenter = workspace.CurrentCamera.ViewportSize / 2
        VirtualInputManager:SendMouseButtonEvent(screenCenter.X, screenCenter.Y, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(screenCenter.X, screenCenter.Y, 0, false, game, 0)
    end


    local radius = 3

    local function checkDistance()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local distance = (hrp.Position - targetPosition).Magnitude
            
            if distance <= radius then
                print("You are within 10 studs of the target location!")
                -- you can add more logic here, like triggering an event
            else
                print("You are outside the detection radius.")
                teleportPlayerNeeds(12028.45, 9904.26, 5982.73)
            end
        end
    end

    -- Main loop
    while true do
        local targetInterior = nil

        -- Find the dynamic CoconutBonkInterior
        for _, interior in ipairs(Interiors:GetChildren()) do
            if interior.Name:match("^CoconutBonkInterior::") then
                targetInterior = interior
                break
            end
        end

        if targetInterior then
            task.wait(10)
            print("Entered:", targetInterior.Name)

            -- Teleport to target position
            teleportPlayerNeeds(12028.45, 9904.26, 5982.73)
            checkDistance()
            -- Keep clicking while still inside
            while targetInterior.Parent == Interiors do
                

                while true do
                    local success, err = pcall(function()
                        local buttonFire = game:GetService("Players").LocalPlayer.PlayerGui.MinigameHotbarApp.Hotbar.SwordButton.Button
                        FireSig(buttonFire)
                    end)
                    if success then
                        print("FireSig succeeded.")
                        break
                    else
                        warn("FireSig failed, retrying... Error:", err)
                        task.wait(0.2)  -- wait a bit before retrying to avoid spamming too hard
                    end
                end
                task.wait(0.3)
            end

            print("Exited:", targetInterior.Name)
        end

        task.wait(1)
    end

end


