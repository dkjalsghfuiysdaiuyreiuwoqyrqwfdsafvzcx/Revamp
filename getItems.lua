print("Running Get Items")
local router
for i, v in next, getgc(true) do
    if type(v) == 'table' and rawget(v, 'get_remote_from_cache') then
        router = v
    end
end
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function rename(remotename, hashedremote)
    hashedremote.Name = remotename
end
table.foreach(debug.getupvalue(router.get_remote_from_cache, 1), rename)

task.wait(3)
local sound = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("SoundPlayer")
local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")

sound.FX:play("BambooButton")
UI.set_app_visibility("NewsApp", false)
task.wait(3)

local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
local SocialStones = ClientData.get_data()[game.Players.LocalPlayer.Name].social_stones_2025
local StonesToBuy = math.floor(SocialStones / 25)
local FoodData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.food

if StonesToBuy > 0 then
    local args = {
        "food",
        "butterfly_2025_snapdragon_flower",
        StonesToBuy
    }
    game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SocialStonesAPI/AttemptExchange"):FireServer(unpack(args))
end

task.wait(1)
getgenv().fsysCore = require(game:GetService("ReplicatedStorage").ClientModules.Core.InteriorsM.InteriorsM)
local function TeleportToMaps(map)
    local targetCFrame = CFrame.new(-275.9091491699219, 25.812084197998047, -1548.145751953125, -0.9798217415809631, 0.0000227206928684609, 0.19986890256404877, -0.000003862579433189239, 1, -0.00013261348067317158, -0.19986890256404877, -0.00013070966815575957, -0.9798217415809631)
    local OrigThreadID = getthreadidentity()
    task.wait(1)
    setidentity(2)
    task.wait(1)
    fsysCore.enter_smooth(map, "MainDoor", {
        ["spawn_cframe"] = targetCFrame * CFrame.Angles(0, 0, 0)
    })
    setidentity(OrigThreadID)
end

TeleportToMaps("Butterfly2025Sanctuary")

task.wait(3)

for x, y in pairs(FoodData) do
    if y.id == "butterfly_2025_snapdragon_flower" then
        local args = {
            "butterfly_2025_snapdragon_flower",
            y.unique
        }
        game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LootBoxAPI/ExchangeItemForReward"):InvokeServer(unpack(args))
    end
end
