local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

_G.Enabled = true -- Define a variável _G
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

-- Função para desenhar o ESP da fruta
local function drawFruitESP(fruit)
    local part = Instance.new("Part")
    part.Size = Vector3.new(3, 3, 3) -- Tamanho do ESP da fruta
    part.Position = fruit.Position
    part.Anchored = true
    part.Transparency = 0.5 -- Transparência para torná-la semi-transparente
    part.BrickColor = BrickColor.new("Bright red") -- Cor do ESP da fruta
    part.Parent = workspace.CurrentCamera -- Adiciona o ESP à câmera para ser visível em todas as direções
    
    -- Adiciona o nome da fruta ao ESP
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = fruit.Type.Value
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 20
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- Cor do texto (branco)
    textLabel.BackgroundTransparency = 1
    textLabel.Position = Vector3.new(fruit.Position.X, fruit.Position.Y + 3, fruit.Position.Z)
    textLabel.Parent = part
    
    -- Adiciona a distância entre o jogador e a fruta ao ESP
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Text = tostring(math.floor((fruit.Position - player.Character.HumanoidRootPart.Position).magnitude)) .. "m"
    distanceLabel.Font = Enum.Font.SourceSansBold
    distanceLabel.TextSize = 16
    distanceLabel.TextColor3 = Color3.new(1, 1, 1) -- Cor do texto (branco)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.Position = Vector3.new(fruit.Position.X, fruit.Position.Y + 2, fruit.Position.Z)
    distanceLabel.Parent = part
end

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
        if Target then
            drawFruitESP(Target)
            CollectFruit(Target)
        end
    end
end

if _G.Enabled then
    Main()
end