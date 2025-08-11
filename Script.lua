local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Cria a tela principal da GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedHubXBetaFF"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Fundo escuro semi-transparente
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BackgroundTransparency = 0.1
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

-- Menu lateral
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 120, 1, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
menuFrame.Parent = mainFrame

local menuLayout = Instance.new("UIListLayout")
menuLayout.Parent = menuFrame
menuLayout.SortOrder = Enum.SortOrder.LayoutOrder
menuLayout.Padding = UDim.new(0, 4)

-- Área conteúdo (à direita)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -120, 1, 0)
contentFrame.Position = UDim2.new(0, 120, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
contentFrame.Parent = mainFrame

-- Títulos da aba
local tabTitles = {
    "Info - Status",
    "In game",
    "Teleportation",
    "Settings",
    "User Interface"
}

local tabs = {}

-- Função pra criar botão do menu
local function createMenuButton(name, layoutOrder)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 16
    button.Text = name
    button.LayoutOrder = layoutOrder
    button.Parent = menuFrame
    return button
end

-- Cria os botões do menu e as abas de conteúdo
for i, title in ipairs(tabTitles) do
    local button = createMenuButton(title, i)

    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
    tabFrame.Parent = contentFrame

    -- Exemplo texto dentro da aba
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 30)
    label.Position = UDim2.new(0, 10, 0, 10)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 18
    label.Text = title .. " content here"
    label.Parent = tabFrame

    tabs[i] = tabFrame

    button.MouseButton1Click:Connect(function()
        -- Esconde todas abas
        for _, v in pairs(tabs) do
            v.Visible = false
        end
        -- Mostra a aba clicada
        tabFrame.Visible = true
    end)
end

-- Abre a primeira aba por padrão
tabs[1].Visible = true
