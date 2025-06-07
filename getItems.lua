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

for x, y in pairs(FoodData) do
    if y.id == "butterfly_2025_snapdragon_flower" then
        local args = {
            "butterfly_2025_snapdragon_flower",
            y.unique
        }
        game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LootBoxAPI/ExchangeItemForReward"):InvokeServer(unpack(args))
    end
end
