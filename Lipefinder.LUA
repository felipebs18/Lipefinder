local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

_G.Enabled = true -- seta a variavel do _G
_G.Fruits = {
    ["Bomb"] = true,
    ["Spike"] = true,
    ["Chop"] = true,
    ["Spring"] = true,
    ["Kilo"] = true,
    ["Smoke"] = true,
    ["Spin"] = true,
    ["Flame"] = true,
    ["Falcon"] = true,
    ["Ice"] = true,
    ["Sand"] = true,
    ["Dark"] = true,
    ["Ghost"] = true,
    ["Diamond"] = true,
    ["Light"] = true,
    ["Love"] = true,
    ["Rubber"] = true,
    ["Barrier"] = true,
    ["Magma"] = true,
    ["Portal"] = true,
    ["Quake"] = true,
    ["Buddha"] = true,
    ["Spider"] = true,
    ["Phoenix"] = true,
    ["Rumble"] = true,
    ["Pain"] = true,
    ["Gravity"] = true,
    ["Dough"] = true,
    ["Shadow"] = true,
    ["Venom"] = true,
    ["Control"] = true,
    ["Dragon"] = true,
    ["Spirit"] = true,
    ["Leopard"] = true,
    ["Blizzard"] = true,
    ["Rocket"] = true,
    ["Mammoth"] = true,
    ["T-Rex"] = true,
    ["Kitsune"] = true,
    ["Sound"] = true,
}

local CheckDist = function()
    local Target = nil
    local ShortestDistance = 1000
    for i, v in pairs(workspace:GetChildren()) do
        if v.Name == "Fruit" and _G.Fruits[v.Type.Value] and (v.Position - player.Character.HumanoidRootPart.Position).magnitude < ShortestDistance then
            Target = v
            ShortestDistance = (v.Position - player.Character.HumanoidRootPart.Position).magnitude
        end
    end
    return Target
end

local CollectFruit = function(Fruit)
    if Fruit then
        repeat
            player.Character.HumanoidRootPart.CFrame = CFrame.new(Fruit.Position + Vector3.new(0,3,0))
            wait()
            game.ReplicatedStorage.Remotes.Interact:InvokeServer(Fruit)
        until not Fruit.Parent
    end
end

local Main = function()
    while wait() do
        local Target = CheckDist()
        CollectFruit(Target)
    end
end

if _G.Enabled then
    Main()
end