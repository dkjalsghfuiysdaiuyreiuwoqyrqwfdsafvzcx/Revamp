if not _G.ScriptRunning then
    _G.ScriptRunning = true
    local sound = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("SoundPlayer")
    local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")


    local router
    for i, v in next, getgc(true) do
        if type(v) == 'table' and rawget(v, 'get_remote_from_cache') then
            router = v
        end
    end
    local function rename(remotename, hashedremote)
        hashedremote.Name = remotename
    end
    -- Apply renaming to upvalues of the RouterClient.init function
    table.foreach(debug.getupvalue(router.get_remote_from_cache, 1), rename)

    --print("After dehash")

    task.wait(2) -- idk how much

    local sound = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("SoundPlayer")
    local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")

    sound.FX:play("BambooButton")
    UI.set_app_visibility("NewsApp", false)

    
    local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
    local Cash = ClientData.get_data()[game.Players.LocalPlayer.Name].money
    if not hookmetamethod then
        return notify('Incompatible Exploit', 'Your exploit does not support `hookmetamethod`')
    end

    local TeleportService = game:GetService("TeleportService")
    local oldIndex
    local oldNamecall

    -- Hook __index to intercept TeleportService method calls
    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if self == TeleportService and (key:lower() == "teleport" or key == "TeleportToPlaceInstance") then
            return function()
                error("Teleportation blocked by anti-teleport script.", 2)
            end
        end
        return oldIndex(self, key)
    end)

    -- Hook __namecall to intercept method calls like TeleportService:Teleport(...)
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if self == TeleportService and (method:lower() == "teleport" or method == "TeleportToPlaceInstance") then
            return
        end
        return oldNamecall(self, ...)
    end)

    print('Anti-Rejoin', 'Teleportation prevention is now active.')

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
    
    if Cash <= 125 and not HasTradeLic then
        print("New account")
        print("Inside new account")
    
    
        local success, err = pcall(function()
            local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
            UI.set_app_visibility("DialogApp", false)
            
            local args = {
                [1] = "theme_color",
                [2] = "black"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Parents",
                [2] = {
                    ["source_for_logging"] = "intro_sequence",
                    ["dont_enter_location"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TeamAPI/ChooseTeam"):InvokeServer(unpack(args))
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "female"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetGender"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "edit_state_entered",
                [2] = {
                    ["house_type"] = "mine"
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            
            
            local args = {
                [1] = "edit_state_exited",
                [2] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/UnsubscribeFromHouse"):InvokeServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Interiors",
                [2] = "Neighborhood!Default"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DownloadsAPI/Download"):InvokeServer(unpack(args))
            task.wait(2)
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
            task.wait(2)
            
            
            
            local args = {
                [1] = "Nursery Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("GuideArrowAPI/GetGraph"):InvokeServer()
            task.wait(2)
            local args = {
                [1] = "Nursery Entered"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = true
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/EquipTutorialEgg"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Started Egg Received"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("JournalAPI/CommitCollection"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ResetNetworkOwnership"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TutorialAPI/AddTutorialQuest"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Quest Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = "Quest App Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Quest App Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Tutorial Ailment Spawned"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/AddHungryAilment"):FireServer()
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("QuestAPI/MarkQuestsViewed"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AdoptAPI/FocusPet"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["FocusPet"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicateActivePerformances"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["local_anim_name"] = "DogSit",
                    ["local_anim_speed"] = 1,
                    ["dont_allow_sit_states"] = true,
                    ["dont_allow_remote_interaction"] = true,
                    ["anim_fade_time"] = 0.2
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicatePerformanceModifiers"):FireServer(unpack(args))
            task.wait(2)
            
            --get food unique
            local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
            local foodData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.food
            local tutorialegg
            local tutorialfood
            for x,y in pairs(foodData) do
                if y.kind == 'sandwich-default' then
                    tutorialfood = y.unique 
                end
            end
            
            --pet unique
            local petData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.pets
            for x,y in pairs(petData) do
                if y.kind == 'starter_egg' then
                    tutorialegg = y.unique
                end
            end
            local args = {
                [1] = "__Enum_PetObjectCreatorType_2",
                [2] = {
                    ["pet_unique"] = tutorialegg,
                    ["spawn_cframe"] = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position),
                    ["additional_consume_uniques"] = {},
                    ["unique_id"] = tutorialfood
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetObjectAPI/CreatePetObject"):InvokeServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/MarkTutorialCompleted"):FireServer()
            task.wait(10)
        end)
        if not success then
            warn("Error in first task: " .. tostring(err))
        end
        
        local success, err = pcall(function()
            local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
            UI.set_app_visibility("DialogApp", false)
            
            local args = {
                [1] = "theme_color",
                [2] = "black"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Parents",
                [2] = {
                    ["source_for_logging"] = "intro_sequence",
                    ["dont_enter_location"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TeamAPI/ChooseTeam"):InvokeServer(unpack(args))
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "female"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetGender"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "edit_state_entered",
                [2] = {
                    ["house_type"] = "mine"
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            
            
            local args = {
                [1] = "edit_state_exited",
                [2] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/UnsubscribeFromHouse"):InvokeServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Interiors",
                [2] = "Neighborhood!Default"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DownloadsAPI/Download"):InvokeServer(unpack(args))
            task.wait(2)
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
            task.wait(2)
            
            
            
            local args = {
                [1] = "Nursery Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("GuideArrowAPI/GetGraph"):InvokeServer()
            task.wait(2)
            local args = {
                [1] = "Nursery Entered"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = true
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/EquipTutorialEgg"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Started Egg Received"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("JournalAPI/CommitCollection"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ResetNetworkOwnership"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TutorialAPI/AddTutorialQuest"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Quest Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = "Quest App Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Quest App Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Tutorial Ailment Spawned"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/AddHungryAilment"):FireServer()
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("QuestAPI/MarkQuestsViewed"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AdoptAPI/FocusPet"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["FocusPet"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicateActivePerformances"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["local_anim_name"] = "DogSit",
                    ["local_anim_speed"] = 1,
                    ["dont_allow_sit_states"] = true,
                    ["dont_allow_remote_interaction"] = true,
                    ["anim_fade_time"] = 0.2
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicatePerformanceModifiers"):FireServer(unpack(args))
            task.wait(2)
            
            --get food unique
            local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
            local foodData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.food
            local tutorialegg
            local tutorialfood
            for x,y in pairs(foodData) do
                if y.kind == 'sandwich-default' then
                    tutorialfood = y.unique 
                end
            end
            
            --pet unique
            local petData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.pets
            for x,y in pairs(petData) do
                if y.kind == 'starter_egg' then
                    tutorialegg = y.unique
                end
            end
            local args = {
                [1] = "__Enum_PetObjectCreatorType_2",
                [2] = {
                    ["pet_unique"] = tutorialegg,
                    ["spawn_cframe"] = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position),
                    ["additional_consume_uniques"] = {},
                    ["unique_id"] = tutorialfood
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetObjectAPI/CreatePetObject"):InvokeServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/MarkTutorialCompleted"):FireServer()
            task.wait(10)
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
    
    task.spawn(function()
        local success, err = pcall(function()
            local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
            UI.set_app_visibility("DialogApp", false)
            
            local args = {
                [1] = "theme_color",
                [2] = "black"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Parents",
                [2] = {
                    ["source_for_logging"] = "intro_sequence",
                    ["dont_enter_location"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TeamAPI/ChooseTeam"):InvokeServer(unpack(args))
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "female"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetGender"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "edit_state_entered",
                [2] = {
                    ["house_type"] = "mine"
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            
            
            local args = {
                [1] = "edit_state_exited",
                [2] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/UnsubscribeFromHouse"):InvokeServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Interiors",
                [2] = "Neighborhood!Default"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DownloadsAPI/Download"):InvokeServer(unpack(args))
            task.wait(2)
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
            task.wait(2)
            
            
            
            local args = {
                [1] = "Nursery Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("GuideArrowAPI/GetGraph"):InvokeServer()
            task.wait(2)
            local args = {
                [1] = "Nursery Entered"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = true
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/EquipTutorialEgg"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Started Egg Received"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("JournalAPI/CommitCollection"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ResetNetworkOwnership"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TutorialAPI/AddTutorialQuest"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Quest Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = "Quest App Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Quest App Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Tutorial Ailment Spawned"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/AddHungryAilment"):FireServer()
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("QuestAPI/MarkQuestsViewed"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AdoptAPI/FocusPet"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["FocusPet"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicateActivePerformances"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["local_anim_name"] = "DogSit",
                    ["local_anim_speed"] = 1,
                    ["dont_allow_sit_states"] = true,
                    ["dont_allow_remote_interaction"] = true,
                    ["anim_fade_time"] = 0.2
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicatePerformanceModifiers"):FireServer(unpack(args))
            task.wait(2)
            
            --get food unique
            local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
            local foodData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.food
            local tutorialegg
            local tutorialfood
            for x,y in pairs(foodData) do
                if y.kind == 'sandwich-default' then
                    tutorialfood = y.unique 
                end
            end
            
            --pet unique
            local petData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.pets
            for x,y in pairs(petData) do
                if y.kind == 'starter_egg' then
                    tutorialegg = y.unique
                end
            end
            local args = {
                [1] = "__Enum_PetObjectCreatorType_2",
                [2] = {
                    ["pet_unique"] = tutorialegg,
                    ["spawn_cframe"] = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position),
                    ["additional_consume_uniques"] = {},
                    ["unique_id"] = tutorialfood
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetObjectAPI/CreatePetObject"):InvokeServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/MarkTutorialCompleted"):FireServer()
            task.wait(10)
        end)
        if not success then
            warn("Error in first task: " .. tostring(err))
        end
    end)
    
    task.spawn(function()
        local success, err = pcall(function()
            local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
            UI.set_app_visibility("DialogApp", false)
            
            local args = {
                [1] = "theme_color",
                [2] = "black"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Parents",
                [2] = {
                    ["source_for_logging"] = "intro_sequence",
                    ["dont_enter_location"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TeamAPI/ChooseTeam"):InvokeServer(unpack(args))
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SettingsAPI/SetSetting"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "female"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetGender"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SubmitAvatarAnalyticsEvent"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Avatar Editor Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Housing Editor Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "edit_state_entered",
                [2] = {
                    ["house_type"] = "mine"
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            
            
            local args = {
                [1] = "edit_state_exited",
                [2] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/SendHousingOnePointOneLog"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/UnsubscribeFromHouse"):InvokeServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = {}
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("HousingAPI/PushFurnitureChanges"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Interiors",
                [2] = "Neighborhood!Default"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DownloadsAPI/Download"):InvokeServer(unpack(args))
            task.wait(2)
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
            task.wait(2)
            
            
            
            local args = {
                [1] = "Nursery Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("GuideArrowAPI/GetGraph"):InvokeServer()
            task.wait(2)
            local args = {
                [1] = "Nursery Entered"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = true
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/EquipTutorialEgg"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Started Egg Received"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("JournalAPI/CommitCollection"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ResetNetworkOwnership"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TutorialAPI/AddTutorialQuest"):FireServer()
            task.wait(2)
            local args = {
                [1] = "Quest Tutorial Started"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            
            local args = {
                [1] = "Quest App Opened"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Quest App Closed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = "Tutorial Ailment Spawned"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/StashTutorialStatus"):FireServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/AddHungryAilment"):FireServer()
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("QuestAPI/MarkQuestsViewed"):FireServer()
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg")
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AdoptAPI/FocusPet"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("AvatarAPI/SetPlayerOnPlayerCollision"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["FocusPet"] = true
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicateActivePerformances"):FireServer(unpack(args))
            task.wait(2)
            local args = {
                [1] = workspace:WaitForChild("Pets"):WaitForChild("Starter Egg"),
                [2] = {
                    ["local_anim_name"] = "DogSit",
                    ["local_anim_speed"] = 1,
                    ["dont_allow_sit_states"] = true,
                    ["dont_allow_remote_interaction"] = true,
                    ["anim_fade_time"] = 0.2
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetAPI/ReplicatePerformanceModifiers"):FireServer(unpack(args))
            task.wait(2)
            
            --get food unique
            local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
            local foodData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.food
            local tutorialegg
            local tutorialfood
            for x,y in pairs(foodData) do
                if y.kind == 'sandwich-default' then
                    tutorialfood = y.unique 
                end
            end
            
            --pet unique
            local petData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.pets
            for x,y in pairs(petData) do
                if y.kind == 'starter_egg' then
                    tutorialegg = y.unique
                end
            end
            local args = {
                [1] = "__Enum_PetObjectCreatorType_2",
                [2] = {
                    ["pet_unique"] = tutorialegg,
                    ["spawn_cframe"] = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position),
                    ["additional_consume_uniques"] = {},
                    ["unique_id"] = tutorialfood
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("PetObjectAPI/CreatePetObject"):InvokeServer(unpack(args))
            task.wait(2)
            game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LegacyTutorialAPI/MarkTutorialCompleted"):FireServer()
            task.wait(10)
        end)
        if not success then
            warn("Error in second task: " .. tostring(err))
        end
    end)

    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local virtualUser = game:GetService("VirtualUser")
    
    Player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    
    --print("FarmPet Now running!")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local CoreGui = game:GetService("CoreGui")
    local PlayerGui = Player:FindFirstChildOfClass("PlayerGui") or CoreGui
    local LiveOpsMapSwap = require(game:GetService("ReplicatedStorage").SharedModules.Game.LiveOpsMapSwap)



    task.wait(5)
    game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
    sound.FX:play("BambooButton")
    UI.set_app_visibility("DailyLoginApp", false)

    getgenv().fsysCore = require(game:GetService("ReplicatedStorage").ClientModules.Core.InteriorsM.InteriorsM)
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

    local function teleportPlayerNeeds(x, y, z)
        local Player = game.Players.LocalPlayer
        if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z) 
        else
            --print("Player or character not found!")
        end
    end
    local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
    local InShakeDown = false 
    local FinishedMinigame = false
    local RunService = game:GetService("RunService")

        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui")
        local dialogApp = gui and gui:FindFirstChild("DialogApp")

                teleportToMainmap()
                task.wait(5)
                teleportPlayerNeeds(74.4566879272461, 41.194610595703125, -1571.404296875)
    while true do
        -- Wait until we are inside the BlossomShakedownInterior
        if not InShakeDown and workspace.Interiors:FindFirstChild("BlossomShakedownInterior") then
            InShakeDown = true
            task.wait(2)

            local rings = workspace.Interiors.BlossomShakedownInterior:WaitForChild("Rings")
            local messageServer = game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("MinigameAPI/MessageServer")

            local count = 0
            for _, ring in ipairs(rings:GetChildren()) do
                if count >= 40 then break end
                messageServer:FireServer("blossom_shakedown", "petal_ring_flown_through", ring.Name)
                count += 1
            end
        end

        -- Wait until player is back in MainMap and reward UI is shown
        if InShakeDown and not FinishedMinigame then
            local success = pcall(function()
                if workspace.Interiors:FindFirstChild("MainMap!Default") then
                    local rewardsApp = gui and gui:FindFirstChild("MinigameRewardsApp")
                    if rewardsApp and rewardsApp.Body.Visible then
                        task.wait(2)
                        
                        -- Reset all flags
                        InShakeDown = false
                        FinishedMinigame = false
                        
                        if UI then
                            UI.set_app_visibility("MinigameRewardsApp", false)
                        end
                    end
                end
            end)
            if not success then
                -- If MainMap or rewards not ready yet, wait a bit
                task.wait(1)
            end
        end
        task.wait(1)
    end
end
