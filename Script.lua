-- script.lua (modo executável)
local UtilTab = getgenv()._UtilTab

UtilTab:CreateButton({
    Name = "Kit Médico Infinito",
    Callback = function()
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("GiveItem")
        if remote then
            remote:FireServer("Kit Médico")
        else
            warn("RemoteEvent 'GiveItem' não encontrado.")
        end
    end,
})
